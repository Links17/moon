import {
    Badge,
    Button,
    FormInstance,
    MenuProps,
    StepProps,
    Tag,
    Typography,
    Upload,
    UploadProps
} from 'antd'
import { IconFont } from '@/components/IconFont/IconFont.tsx'
import { operationItems } from '@/components/Data/DataOption/option.tsx'
import { DataFormItem } from '@/components/Data'
import {
    ImportGroupRequest,
    StrategyGroupItemType,
    StrategyGroupListRequest
} from '@/apis/home/monitor/strategy-group/types.ts'
import { DictSelectItem } from '@/apis/home/system/dict/types'
import { ColumnGroupType, ColumnType } from 'antd/es/table'
import dayjs from 'dayjs'
import { Category, Status, StatusMap } from '@/apis/types'
import { DataOptionItem } from '@/components/Data/DataOption/DataOption'
import { ActionKey } from '@/apis/data'
import DataForm from '@/components/Data/DataForm/DataForm'
import {
    defaultPageReq,
    getAlarmPages,
    getEndponts,
    getLevels
} from './strategy/options'
import { UploadOutlined } from '@ant-design/icons'
import SyntaxHighlighter from 'react-syntax-highlighter'
import { ThemeType } from '@/context'
import {
    atomOneDark,
    atomOneLight
} from 'react-syntax-highlighter/dist/esm/styles/hljs'
import jsYaml from 'js-yaml'
import dictApi from '@/apis/home/system/dict'
import alarmGroupApi from '@/apis/home/monitor/alarm-group'
import { DefaultOptionType } from 'antd/es/select'
import { defaultSelectAlarmGroupRequest } from '@/apis/home/monitor/alarm-group/types'

const { Paragraph } = Typography

export const getCategories = (keyword: string) => {
    return dictApi
        .dictSelect({
            keyword,
            page: defaultPageReq,
            category: Category.CATEGORY_PROM_STRATEGY_GROUP
        })
        .then((items) => {
            return items.list.map((item) => {
                const { color, value, label } = item
                return {
                    value: value,
                    label: <Tag color={color}>{label}</Tag>
                }
            })
        })
}

export const tableOperationItems = (
    record: StrategyGroupItemType
): MenuProps['items'] => [
    {
        key: ActionKey.OP_KEY_STRATEGY_LIST,
        label: (
            <Button
                type="link"
                size="small"
                icon={<IconFont type="icon-linkedin-fill" />}
            >
                策略列表
            </Button>
        )
    },
    record.status === Status.STATUS_DISABLED
        ? {
              key: ActionKey.ENABLE,
              label: (
                  <Button
                      type="link"
                      size="small"
                      icon={<IconFont type="icon-Enable" />}
                  >
                      启用
                  </Button>
              )
          }
        : {
              key: ActionKey.DISABLE,
              label: (
                  <Button
                      type="link"
                      size="small"
                      danger
                      icon={<IconFont type="icon-disable2" />}
                  >
                      禁用
                  </Button>
              )
          },
    {
        key: ActionKey.OPERATION_LOG,
        label: (
            <Button
                size="small"
                type="link"
                icon={<IconFont type="icon-wj-rz" />}
            >
                操作日志
            </Button>
        )
    },
    ...(operationItems(record) as any[])
]

export const searchItems: DataFormItem[] = [
    {
        name: 'keyword',
        label: '规则组名称'
    },
    {
        name: 'categoryIds',
        label: '规则分类',
        dataProps: {
            type: 'select-fetch',
            parentProps: {
                selectProps: {
                    placeholder: '请选择策略组类型',
                    mode: 'multiple'
                },
                handleFetch: getCategories,
                defaultOptions: []
            }
        }
    },
    {
        name: 'status',
        label: '规则组状态',
        formItemProps: {
            initialValue: Status.STATUS_UNKNOWN
        },
        dataProps: {
            type: 'radio-group',
            parentProps: {
                optionType: 'button',
                options: [
                    {
                        label: '全部',
                        value: Status.STATUS_UNKNOWN
                    },
                    {
                        label: '启用',
                        value: Status.STATUS_ENABLED
                    },
                    {
                        label: '禁用',
                        value: Status.STATUS_DISABLED
                    }
                ]
            }
        }
    }
]

export const columns: (
    | ColumnGroupType<StrategyGroupItemType>
    | ColumnType<StrategyGroupItemType>
)[] = [
    {
        title: '名称',
        dataIndex: 'name',
        key: 'name',
        width: 160,
        render: (name: string) => {
            return name
        }
    },

    {
        title: '类型',
        dataIndex: 'categories',
        key: 'categories',
        width: 160,
        render: (categories: DictSelectItem[], _: StrategyGroupItemType) => {
            if (!categories || categories.length === 0) return '-'
            return categories?.map((item: DictSelectItem) => {
                return (
                    <Tag key={item.value} color={item.color}>
                        {item.label}
                    </Tag>
                )
            })
        }
    },
    {
        title: '状态',
        dataIndex: 'status',
        key: 'status',
        width: 160,
        align: 'center',
        render: (status: Status, _: StrategyGroupItemType) => {
            const { color, text } = StatusMap[status]
            return <Badge key={text} text={text} color={color} />
        }
    },
    {
        // 策略数量
        title: '策略数量',
        dataIndex: 'strategyCount',
        key: 'strategyCount',
        width: 120,
        align: 'center',
        render: (strategyCount: number | string) => {
            return <b>{strategyCount}</b>
        }
    },
    {
        // 开启中的策略数量
        title: '开启的策略数量',
        dataIndex: 'enableStrategyCount',
        key: 'enableStrategyCount',
        width: 120,
        align: 'center',
        render: (enableStrategyCount: number | string) => {
            return <b>{enableStrategyCount}</b>
        }
    },
    {
        title: '描述',
        dataIndex: 'remark',
        key: 'remark',
        width: 400,
        render: (description: string) => {
            return (
                <Paragraph
                    ellipsis={{ rows: 2, expandable: true, symbol: 'more' }}
                >
                    {description || '-'}
                </Paragraph>
            )
        }
    },
    {
        title: '创建时间',
        dataIndex: 'createdAt',
        key: 'createdAt',
        width: 180,
        render: (createdAt: string | number) => {
            return dayjs(+createdAt * 1000).format('YYYY-MM-DD HH:mm:ss')
        }
    },
    {
        title: '更新时间',
        dataIndex: 'updatedAt',
        key: 'updatedAt',
        width: 180,
        render: (updatedAt: string | number) => {
            return dayjs(+updatedAt * 1000).format('YYYY-MM-DD HH:mm:ss')
        }
    }
]

export const defaultStrategyGroupListRequest: StrategyGroupListRequest = {
    page: {
        size: 10,
        curr: 1
    }
}

export const rightOptions = (loading: boolean): DataOptionItem[] => [
    {
        key: ActionKey.REFRESH,
        label: (
            <Button type="primary" loading={loading}>
                刷新
            </Button>
        )
    }
]

export const leftOptions = (loading: boolean): DataOptionItem[] => [
    {
        key: ActionKey.BATCH_IMPORT,
        label: (
            <Button type="primary" loading={loading}>
                批量导入
            </Button>
        )
    },
    {
        key: ActionKey.OP_KEY_STRATEGY_LIST,
        label: (
            <Button type="link" loading={loading}>
                跳转策略列表
            </Button>
        )
    }
]

export const editStrategyGroupDataFormItems: DataFormItem[] = [
    {
        name: 'name',
        label: '规则组名称',
        rules: [
            {
                required: true,
                message: '请输入规则组名称'
            }
        ]
    },
    {
        name: 'categoryIds',
        label: '规则分类',
        dataProps: {
            type: 'select-fetch',
            parentProps: {
                selectProps: {
                    placeholder: '请选择策略组类型',
                    mode: 'multiple'
                },
                handleFetch: getCategories,
                defaultOptions: []
            }
        }
    },
    {
        name: 'remark',
        label: '规则组描述',
        dataProps: {
            type: 'textarea',
            parentProps: {
                placeholder: '请输入200字以内的规则组描述',
                maxLength: 200,
                showCount: true
            }
        }
    }
]

export const getNotifyList = (
    keyword: string
): Promise<DefaultOptionType[]> => {
    return alarmGroupApi
        .select({
            ...defaultSelectAlarmGroupRequest,
            keyword: keyword
        })
        .then((data) => {
            if (!data || !data?.list) return []
            return data?.list.map((item) => {
                const { value, label, remark } = item
                return {
                    value: value,
                    label: label,
                    title: remark
                }
            })
        })
}

export const importGroupDataFormItems: (DataFormItem[] | DataFormItem)[] = [
    [
        {
            name: 'datasourceId',
            label: '数据源',
            dataProps: {
                type: 'select-fetch',
                parentProps: {
                    selectProps: {
                        placeholder: '请选择数据源'
                    },
                    width: '100%',
                    handleFetch: getEndponts,
                    defaultOptions: []
                }
            },
            formItemProps: {
                tooltip: <p>请选择Prometheus数据源, 目前仅支持Prometheus</p>,
                rules: [
                    {
                        required: true,
                        message: '请选择Prometheus数据源'
                    }
                ]
            }
        },
        {
            name: 'defaultAlarmPageIds',
            label: '告警页面',
            id: 'defaultAlarmPageIds',
            dataProps: {
                type: 'select-fetch',
                parentProps: {
                    selectProps: {
                        placeholder: '请选择告警页面',
                        mode: 'multiple'
                    },
                    handleFetch: getAlarmPages,
                    defaultOptions: []
                }
            },
            formItemProps: {
                tooltip: <p>报警页面: 当该规则触发时, 页面将跳转到报警页面</p>
            },
            rules: [
                {
                    required: true,
                    message: '请选择报警页面'
                }
            ]
        }
    ],
    [
        {
            name: 'defaultLevel',
            label: '策略等级',
            id: 'defaultLevel',
            dataProps: {
                type: 'select-fetch',
                parentProps: {
                    selectProps: {
                        placeholder: '请选择告警级别'
                    },
                    handleFetch: getLevels,
                    defaultOptions: []
                }
            },
            rules: [
                {
                    required: true,
                    message: '请选择策略等级'
                }
            ]
        },
        {
            name: 'defaultCategoryIds',
            label: '策略类型',
            id: 'defaultCategoryIds',
            dataProps: {
                type: 'select-fetch',
                parentProps: {
                    selectProps: {
                        placeholder: '请选择策略组类型',
                        mode: 'multiple'
                    },
                    handleFetch: getCategories,
                    defaultOptions: []
                }
            },
            rules: [
                {
                    required: true,
                    message: '请选择策略类型'
                }
            ]
        }
    ],
    {
        name: 'defaultAlarmNotifyIds',
        label: '通知对象',
        dataProps: {
            type: 'select-fetch',
            parentProps: {
                selectProps: {
                    placeholder: '请选择通知对象',
                    mode: 'multiple'
                },
                handleFetch: getNotifyList,
                defaultOptions: []
            }
        }
    }
]

export interface ImportStepProps extends StepProps {
    content?: React.ReactNode
}

export interface ImportModalStepsItemsParamsType {
    form: FormInstance<ImportGroupRequest>
    uploadProps: UploadProps
    sysTheme?: ThemeType
    importData?: ImportGroupRequest
}

export const importModalStepsItems = (
    params: ImportModalStepsItemsParamsType
): ImportStepProps[] => [
    {
        title: '填写默认信息',
        content: (
            <DataForm
                formProps={{ layout: 'vertical' }}
                form={params.form}
                items={importGroupDataFormItems}
            />
        )
    },
    {
        title: '导入策略组文件',
        content: (
            <Upload {...params.uploadProps}>
                <Button icon={<UploadOutlined />}>点击上传</Button>
            </Upload>
        )
    },
    {
        title: '确认数据',
        content: (
            <div
                style={{
                    height: '400px',
                    overflowY: 'auto'
                }}
            >
                <SyntaxHighlighter
                    language="yaml"
                    style={
                        params.sysTheme === 'dark' ? atomOneDark : atomOneLight
                    }
                >
                    {jsYaml.dump({ groups: params.importData?.groups })}
                </SyntaxHighlighter>
            </div>
        )
    }
]
