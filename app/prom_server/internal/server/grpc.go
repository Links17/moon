package server

import (
	"github.com/go-kratos/kratos/v2/middleware/logging"
	"github.com/go-kratos/kratos/v2/middleware/selector"
	"github.com/go-kratos/kratos/v2/middleware/validate"
	"prometheus-manager/api/alarm/history"
	"prometheus-manager/api/alarm/hook"
	"prometheus-manager/api/alarm/page"
	"prometheus-manager/api/dict"
	"prometheus-manager/api/ping"
	"prometheus-manager/api/prom/endpoint"
	"prometheus-manager/api/prom/strategy"
	"prometheus-manager/api/prom/strategy/group"
	"prometheus-manager/api/system"
	"prometheus-manager/app/prom_server/internal/conf"
	"prometheus-manager/app/prom_server/internal/service"
	"prometheus-manager/app/prom_server/internal/service/alarmservice"
	"prometheus-manager/app/prom_server/internal/service/dictservice"
	"prometheus-manager/app/prom_server/internal/service/promservice"
	"prometheus-manager/app/prom_server/internal/service/systemservice"
	"prometheus-manager/pkg/helper/middler"

	"github.com/go-kratos/kratos/v2/log"
	"github.com/go-kratos/kratos/v2/middleware/recovery"
	"github.com/go-kratos/kratos/v2/transport/grpc"
)

type GrpcServer struct {
	*grpc.Server
}

// RegisterGrpcServer register a gRPC server.
func RegisterGrpcServer(
	srv *grpc.Server,
	pingService *service.PingService,
	dictService *dictservice.Service,
	strategyService *promservice.StrategyService,
	strategyGroupService *promservice.GroupService,
	alarmPageService *alarmservice.AlarmPageService,
	hookService *alarmservice.HookService,
	historyService *alarmservice.HistoryService,
	userService *systemservice.UserService,
	roleService *systemservice.RoleService,
	endpointService *promservice.EndpointService,
	apiService *systemservice.ApiService,
) *GrpcServer {
	ping.RegisterPingServer(srv, pingService)
	dict.RegisterDictServer(srv, dictService)
	strategy.RegisterStrategyServer(srv, strategyService)
	group.RegisterGroupServer(srv, strategyGroupService)
	page.RegisterAlarmPageServer(srv, alarmPageService)
	hook.RegisterHookServer(srv, hookService)
	history.RegisterHistoryServer(srv, historyService)
	system.RegisterUserServer(srv, userService)
	system.RegisterRoleServer(srv, roleService)
	endpoint.RegisterEndpointServer(srv, endpointService)
	system.RegisterApiServer(srv, apiService)

	return &GrpcServer{Server: srv}
}

// NewGRPCServer new a gRPC server.
func NewGRPCServer(
	c *conf.Server,
	whiteList *conf.WhiteList,
	logger log.Logger,
) *grpc.Server {
	logHelper := log.NewHelper(log.With(logger, "module", "server/grpc"))
	defer logHelper.Info("NewGRPCServer done")
	var opts = []grpc.ServerOption{
		grpc.Middleware(
			recovery.Recovery(),
			logging.Server(logger),
			validate.Validator(),
			selector.Server(middler.JwtServer()).Match(middler.NewWhiteListMatcher(whiteList.GetApi())).Build(),
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