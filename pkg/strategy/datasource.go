package strategy

import (
	"context"
	"crypto/md5"
	"encoding/json"
	"fmt"
)

type Datasource interface {
	Query(ctx context.Context, expr string, duration int64) (*QueryResponse, error)
	GetCategory() string
	GetEndpoint() string
	GetBasicAuth() *BasicAuth
	WithBasicAuth(basicAuth *BasicAuth) Datasource
}

type (
	Metric map[string]string

	Result struct {
		Metric Metric `json:"metric"`
		Value  []any  `json:"value"`
	}

	Data struct {
		ResultType string    `json:"resultType"`
		Result     []*Result `json:"result"`
	}

	QueryResponse struct {
		Status    string `json:"status"`
		Data      *Data  `json:"data"`
		ErrorType string `json:"errorType"`
		Error     string `json:"error"`
	}
)

type DatasourceName string

const (
	PrometheusDatasource DatasourceName = "prometheus"
)

const (
	MetricName        = "__name__"
	MetricGroupName   = "__group_name__"
	MetricGroupId     = "__group_id__"
	MetricAlert       = "alertname"
	MetricAlertId     = "__alert_id__"
	MetricLevelId     = "__level_id__"
	MetricInstance    = "instance"
	MetricDescription = "description"
	MetricSummary     = "summary"
)

// Bytes QueryResponse to []byte
func (qr *QueryResponse) Bytes() []byte {
	bs, _ := json.Marshal(qr)
	return bs
}

// String QueryResponse to string
func (qr *QueryResponse) String() string {
	return string(qr.Bytes())
}

// Name Metric __name__
func (m Metric) Name() string {
	return m.Get(MetricName)
}

// Get get tag value
func (m Metric) Get(key string) string {
	return m[key]
}

// Set Metric set tag value
func (m Metric) Set(key, value string) {
	m[key] = value
}

// Bytes Metric to []byte
func (m Metric) Bytes() []byte {
	if m == nil {
		return nil
	}
	bs, _ := json.Marshal(m)
	return bs
}

// String Metric to string
func (m Metric) String() string {
	return string(m.Bytes())
}

// MD5 Metric to md5
func (m Metric) MD5() string {
	return fmt.Sprintf("%x", md5.Sum(m.Bytes()))
}

// Map Metric to map[string]string
func (m Metric) Map() map[string]string {
	return m
}

// GetMetric Result to Metric
func (r *Result) GetMetric() Metric {
	if r == nil {
		return nil
	}
	return r.Metric
}

func NewDatasource(datasourceName DatasourceName, endpoint string) Datasource {
	switch datasourceName {
	case PrometheusDatasource:
		return NewPrometheusDatasource(endpoint)
	default:
		return NewPrometheusDatasource(endpoint)
	}
}
