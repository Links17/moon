package server

import (
	"github.com/go-kratos/kratos/v2/log"
	"github.com/go-kratos/kratos/v2/middleware/logging"
	"github.com/go-kratos/kratos/v2/middleware/recovery"
	"github.com/go-kratos/kratos/v2/middleware/selector"
	"github.com/go-kratos/kratos/v2/middleware/validate"
	"github.com/go-kratos/kratos/v2/transport/grpc"
	"github.com/aide-family/moon/api/alarm/hook"
	"github.com/aide-family/moon/api/ping"
	"github.com/aide-family/moon/api/server/alarm/history"
	"github.com/aide-family/moon/api/server/alarm/realtime"
	"github.com/aide-family/moon/api/server/dashboard"
	"github.com/aide-family/moon/api/server/prom/endpoint"
	"github.com/aide-family/moon/api/server/prom/notify"
	"github.com/aide-family/moon/api/server/prom/strategy"
	"github.com/aide-family/moon/api/server/prom/strategy/group"
	"github.com/aide-family/moon/api/server/system"
	"github.com/aide-family/moon/app/prom_server/internal/conf"
	"github.com/aide-family/moon/app/prom_server/internal/data"
	"github.com/aide-family/moon/app/prom_server/internal/service"
	"github.com/aide-family/moon/app/prom_server/internal/service/alarmservice"
	"github.com/aide-family/moon/app/prom_server/internal/service/dashboardservice"
	"github.com/aide-family/moon/app/prom_server/internal/service/promservice"
	"github.com/aide-family/moon/app/prom_server/internal/service/systemservice"
	"github.com/aide-family/moon/pkg/helper/middler"
)

type GrpcServer struct {
	*grpc.Server
}

// RegisterGrpcServer register a gRPC server.
func RegisterGrpcServer(
	srv *grpc.Server,
	pingService *service.PingService,
	dictService *systemservice.Service,
	strategyService *promservice.StrategyService,
	strategyGroupService *promservice.GroupService,
	hookService *alarmservice.HookService,
	historyService *alarmservice.HistoryService,
	userService *systemservice.UserService,
	roleService *systemservice.RoleService,
	endpointService *promservice.EndpointService,
	apiService *systemservice.ApiService,
	chatGroupService *promservice.ChatGroupService,
	notifyService *promservice.NotifyService,
	realtimeService *alarmservice.RealtimeService,
	chartService *dashboardservice.ChartService,
	dashboardService *dashboardservice.DashboardService,
	syslogService *systemservice.SyslogService,
) *GrpcServer {
	ping.RegisterPingServer(srv, pingService)
	system.RegisterDictServer(srv, dictService)
	strategy.RegisterStrategyServer(srv, strategyService)
	group.RegisterGroupServer(srv, strategyGroupService)
	hook.RegisterHookServer(srv, hookService)
	history.RegisterHistoryServer(srv, historyService)
	system.RegisterUserServer(srv, userService)
	system.RegisterRoleServer(srv, roleService)
	system.RegisterSyslogServer(srv, syslogService)
	endpoint.RegisterEndpointServer(srv, endpointService)
	system.RegisterApiServer(srv, apiService)
	notify.RegisterNotifyServer(srv, notifyService)
	notify.RegisterChatGroupServer(srv, chatGroupService)
	realtime.RegisterRealtimeServer(srv, realtimeService)
	dashboard.RegisterDashboardServer(srv, dashboardService)
	dashboard.RegisterChartServer(srv, chartService)

	return &GrpcServer{Server: srv}
}

// NewGRPCServer new a gRPC server.
func NewGRPCServer(
	c *conf.Server,
	d *data.Data,
	apiWhite *conf.ApiWhite,
	logger log.Logger,
) *grpc.Server {
	logHelper := log.NewHelper(log.With(logger, "module", "server/grpc"))
	defer logHelper.Info("NewGRPCServer done")

	allApi := apiWhite.GetAll()
	jwtApis := append(allApi, apiWhite.GetJwtApi()...)
	jwtMiddle := selector.Server(middler.JwtServer(), middler.MustLogin(d.Cache())).Match(middler.NewWhiteListMatcher(jwtApis)).Build()

	var opts = []grpc.ServerOption{
		grpc.Middleware(
			recovery.Recovery(),
			logging.Server(logger),
			validate.Validator(),
			jwtMiddle,
		),
	}
	if c.Grpc.Network != "" {
		opts = append(opts, grpc.Network(c.Grpc.Network))
	}
	if c.Grpc.Addr != "" {
		opts = append(opts, grpc.Address(c.Grpc.Addr))
	}
	if c.Grpc.Timeout != nil {
		opts = append(opts, grpc.Timeout(c.Grpc.Timeout.AsDuration()))
	}
	srv := grpc.NewServer(opts...)

	return srv
}
