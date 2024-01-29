INSERT INTO `sys_apis` (`name`, `path`)
VALUES
    ('统计各告警页面告警的数量', '/api/v1/alarm_page/alarm/count'),
    ('批量删除告警页面', '/api/v1/alarm_page/batch/delete'),
    ('创建告警页面', '/api/v1/alarm_page/create'),
    ('删除告警页面', '/api/v1/alarm_page/delete'),
    ('获取告警页面', '/api/v1/alarm_page/get'),
    ('获取告警页面列表', '/api/v1/alarm_page/list'),
    ('获取告警页面下拉列表', '/api/v1/alarm_page/select'),
    ('批量更新告警页面状态', '/api/v1/alarm_page/status/batch/update'),
    ('更新告警页面', '/api/v1/alarm_page/update'),

    ('创建通知群组', '/api/v1/chat/group/create'),
    ('删除通知群组', '/api/v1/chat/group/delete'),
    ('获取通知群组', '/api/v1/chat/group/get'),
    ('获取通知群组列表', '/api/v1/chat/group/list'),
    ('获取通知群组列表(下拉选择)', '/api/v1/chat/group/select'),
    ('更新通知群组', '/api/v1/chat/group/update'),

    ('添加监控端点', '/api/v1/endpoint/append'),
    ('批量修改端点状态', '/api/v1/endpoint/batch/status'),
    ('删除监控端点', '/api/v1/endpoint/delete'),
    ('获取监控端点详情', '/api/v1/endpoint/detail'),
    ('编辑端点信息', '/api/v1/endpoint/edit'),
    ('获取监控端点列表', '/api/v1/endpoint/list'),
    ('获取监控端点下拉列表', '/api/v1/endpoint/select'),

    ('获取策略组列表明细', '/api/v1/strategy/group/all/list'),
    ('批量删除策略组', '/api/v1/strategy/group/batch/delete'),
    ('创建策略组', '/api/v1/strategy/group/create'),
    ('删除策略组', '/api/v1/strategy/group/delete'),
    ('导出策略组', '/api/v1/strategy/group/export'),
    ('获取策略组', '/api/v1/strategy/group/get'),
    ('导入策略组', '/api/v1/strategy/group/import'),
    ('获取策略组列表', '/api/v1/strategy/group/list'),
    ('获取策略组下拉列表', '/api/v1/strategy/group/select'),
    ('批量更新策略组状态', '/api/v1/strategy/group/status/batch/update'),
    ('更新策略组', '/api/v1/strategy/group/update'),

    ('创建通知对象', '/api/v1/prom/notify/create'),
    ('删除通知对象', '/api/v1/prom/notify/delete'),
    ('获取通知对象详情', '/api/v1/prom/notify/get'),
    ('获取通知对象列表', '/api/v1/prom/notify/list'),
    ('更新通知对象', '/api/v1/prom/notify/update'),
    ('获取通知对象列表(用于下拉选择)', '/api/v1/prom/notify/select'),

    ('获取实时告警数据详情', '/api/v1/alarm/realtime/detail'),
    ('告警认领/介入', '/api/v1/alarm/realtime/intervene'),
    ('告警抑制', '/api/v1/alarm/realtime/suppress'),
    ('告警升级', '/api/v1/alarm/realtime/upgrade'),

    ('创建用户', '/api/v1/user/create'),
    ('删除用户', '/api/v1/user/delete'),
    ('获取用户列表', '/api/v1/user/list'),
    ('用户关联角色', '/api/v1/user/roles/relate'),
    ('获取用户下拉列表', '/api/v1/user/select'),
    ('批量修改用户状态', '/api/v1/user/status/edit'),
    ('更新用户基础信息', '/api/v1/user/update'),
    ('修改密码', '/api/v1/user/password/edit'),
    ('获取用户详情', '/api/v1/user/get'),
    ('创建角色', '/api/v1/role/create'),
    ('删除角色', '/api/v1/role/delete'),
    ('获取角色详情', '/api/v1/role/get'),
    ('获取角色列表', '/api/v1/role/list'),
    ('角色关联API', '/api/v1/role/relate/api'),
    ('获取角色下拉列表', '/api/v1/role/select'),
    ('更新角色', '/api/v1/role/update'),
    ('创建API', '/api/v1/system/api/create'),
    ('删除API', '/api/v1/system/api/delete'),
    ('获取API详情', '/api/v1/system/api/get'),
    ('获取API列表', '/api/v1/system/api/list'),
    ('获取API下拉列表', '/api/v1/system/api/select'),
    ('更新API数据', '/api/v1/system/api/update'),
    ('测试', '/test'),
    ('创建字典', '/api/v1/dict/create'),
    ('字典列表', '/api/v1/dict/list'),
    ('更新字典状态', '/api/v1/dict/status/update/batch'),
    ('删除字典列表', '/api/v1/dict/batch/delete'),
    ('删除字典', '/api/v1/dict/delete'),
    ('获取字典详情', '/api/v1/dict/get'),
    ('获取字典下拉列表', '/api/v1/dict/select'),
    ('更新字典', '/api/v1/dict/update'),
    ('实时告警列表', '/api/v1/alarm/realtime/list'),
    ('报警历史', '/api/v1/alarm/history/list'),
    ('报警历史详情', '/api/v1/alarm/history/get'),

    ('策略列表', '/api/v1/strategy/list'),
    ('策略详情', '/api/v1/strategy/detail'),
    ('创建策略', '/api/v1/strategy/create'),
    ('更新策略', '/api/v1/strategy/update'),
    ('删除策略', '/api/v1/strategy/delete'),
    ('批量启用策略', '/api/v1/strategy/status/batch/update'),
    ('批量删除策略', '/api/v1/strategy/batch/delete'),
    ('策略列表(下拉)', '/api/v1/strategy/select'),

    ('绑定通知对象', '/api/v1/strategy/notify/object/bind')