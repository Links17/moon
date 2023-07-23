// Code generated by protoc-gen-go-http. DO NOT EDIT.
// versions:
// - protoc-gen-go-http v2.5.3
// - protoc             v3.19.4
// source: strategy/v1/pull/pull.proto

package pull

import (
	context "context"
	http "github.com/go-kratos/kratos/v2/transport/http"
	binding "github.com/go-kratos/kratos/v2/transport/http/binding"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the kratos package it is being compiled against.
var _ = new(context.Context)
var _ = binding.EncodeURL

const _ = http.SupportPackageIsVersion1

const OperationPullStrategies = "/api.strategy.v1.pull.Pull/Strategies"

type PullHTTPServer interface {
	Strategies(context.Context, *StrategiesRequest) (*StrategiesReply, error)
}

func RegisterPullHTTPServer(s *http.Server, srv PullHTTPServer) {
	r := s.Route("/")
	r.GET("/pull/v1/strategies", _Pull_Strategies0_HTTP_Handler(srv))
}

func _Pull_Strategies0_HTTP_Handler(srv PullHTTPServer) func(ctx http.Context) error {
	return func(ctx http.Context) error {
		var in StrategiesRequest
		if err := ctx.BindQuery(&in); err != nil {
			return err
		}
		http.SetOperation(ctx, OperationPullStrategies)
		h := ctx.Middleware(func(ctx context.Context, req interface{}) (interface{}, error) {
			return srv.Strategies(ctx, req.(*StrategiesRequest))
		})
		out, err := h(ctx, &in)
		if err != nil {
			return err
		}
		reply := out.(*StrategiesReply)
		return ctx.Result(200, reply)
	}
}

type PullHTTPClient interface {
	Strategies(ctx context.Context, req *StrategiesRequest, opts ...http.CallOption) (rsp *StrategiesReply, err error)
}

type PullHTTPClientImpl struct {
	cc *http.Client
}

func NewPullHTTPClient(client *http.Client) PullHTTPClient {
	return &PullHTTPClientImpl{client}
}

func (c *PullHTTPClientImpl) Strategies(ctx context.Context, in *StrategiesRequest, opts ...http.CallOption) (*StrategiesReply, error) {
	var out StrategiesReply
	pattern := "/pull/v1/strategies"
	path := binding.EncodeURL(pattern, in, true)
	opts = append(opts, http.Operation(OperationPullStrategies))
	opts = append(opts, http.PathTemplate(pattern))
	err := c.cc.Invoke(ctx, "GET", path, nil, &out, opts...)
	if err != nil {
		return nil, err
	}
	return &out, err
}