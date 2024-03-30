INSERT INTO `sys_apis` (`id`, `name`, `path`, `method`, `domain`, `module`)
VALUES (1, '统计各告警页面告警的数量', '/api/v1/alarm_page/alarm/count', 'POST', 2, 6),
       (2, '批量删除告警页面', '/api/v1/alarm_page/batch/delete', 'POST', 2, 11),
       (3, '创建告警页面', '/api/v1/alarm_page/create', 'POST', 2, 11),
       (4, '删除告警页面', '/api/v1/alarm_page/delete', 'POST', 2, 11),
       (5, '获取告警页面', '/api/v1/alarm_page/get', 'POST', 2, 11),
       (6, '获取告警页面列表', '/api/v1/alarm_page/list', 'POST', 2, 11),
       (7, '获取告警页面下拉列表', '/api/v1/alarm_page/select', 'POST', 2, 11),
       (8, '批量更新告警页面状态', '/api/v1/alarm_page/status/batch/update', 'POST', 2, 11),
       (9, '更新告警页面', '/api/v1/alarm_page/update', 'POST', 2, 11),
       (10, '创建通知群组', '/api/v1/chat/group/create', 'POST', 2, 13),
       (11, '删除通知群组', '/api/v1/chat/group/delete', 'POST', 2, 13),
       (12, '获取通知群组', '/api/v1/chat/group/get', 'POST', 2, 13),
       (13, '获取通知群组列表', '/api/v1/chat/group/list', 'POST', 2, 13),
       (14, '获取通知群组列表(下拉选择)', '/api/v1/chat/group/select', 'POST', 2, 13),
       (15, '更新通知群组', '/api/v1/chat/group/update', 'POST', 2, 13),
       (16, '添加监控端点', '/api/v1/endpoint/append', 'POST', 2, 10),
       (17, '批量修改端点状态', '/api/v1/endpoint/batch/status', 'POST', 2, 10),
       (18, '删除监控端点', '/api/v1/endpoint/delete', 'POST', 2, 10),
       (19, '获取监控端点详情', '/api/v1/endpoint/detail', 'POST', 2, 10),
       (20, '编辑端点信息', '/api/v1/endpoint/edit', 'POST', 2, 10),
       (21, '获取监控端点列表', '/api/v1/endpoint/list', 'POST', 2, 10),
       (22, '获取监控端点下拉列表', '/api/v1/endpoint/select', 'POST', 2, 10),
       (23, '获取策略组列表明细', '/api/v1/strategy/group/all/list', 'POST', 2, 8),
       (24, '批量删除策略组', '/api/v1/strategy/group/batch/delete', 'POST', 2, 8),
       (25, '创建策略组', '/api/v1/strategy/group/create', 'POST', 2, 8),
       (26, '删除策略组', '/api/v1/strategy/group/delete', 'POST', 2, 8),
       (27, '导出策略组', '/api/v1/strategy/group/export', 'POST', 2, 8),
       (28, '获取策略组', '/api/v1/strategy/group/get', 'POST', 2, 8),
       (29, '导入策略组', '/api/v1/strategy/group/import', 'POST', 2, 8),
       (30, '获取策略组列表', '/api/v1/strategy/group/list', 'POST', 2, 8),
       (31, '获取策略组下拉列表', '/api/v1/strategy/group/select', 'POST', 2, 8),
       (32, '批量更新策略组状态', '/api/v1/strategy/group/status/batch/update', 'POST', 2, 8),
       (33, '更新策略组', '/api/v1/strategy/group/update', 'POST', 2, 8),
       (34, '创建通知对象', '/api/v1/prom/notify/create', 'POST', 2, 12),
       (35, '删除通知对象', '/api/v1/prom/notify/delete', 'POST', 2, 12),
       (36, '获取通知对象详情', '/api/v1/prom/notify/get', 'POST', 2, 12),
       (37, '获取通知对象列表', '/api/v1/prom/notify/list', 'POST', 2, 12),
       (38, '更新通知对象', '/api/v1/prom/notify/update', 'POST', 2, 12),
       (39, '获取通知对象列表(用于下拉选择)', '/api/v1/prom/notify/select', 'POST', 2, 12),
       (40, '获取实时告警数据详情', '/api/v1/alarm/realtime/detail', 'POST', 2, 6),
       (41, '告警认领/介入', '/api/v1/alarm/realtime/intervene', 'POST', 2, 6),
       (42, '告警抑制', '/api/v1/alarm/realtime/suppress', 'POST', 2, 6),
       (43, '告警升级', '/api/v1/alarm/realtime/upgrade', 'POST', 2, 6),
       (44, '创建用户', '/api/v1/user/create', 'POST', 1, 4),
       (45, '删除用户', '/api/v1/user/delete', 'POST', 1, 4),
       (46, '获取用户列表', '/api/v1/user/list', 'POST', 1, 4),
       (47, '用户关联角色', '/api/v1/user/roles/relate', 'POST', 1, 4),
       (48, '获取用户下拉列表', '/api/v1/user/select', 'POST', 1, 4),
       (49, '批量修改用户状态', '/api/v1/user/status/edit', 'POST', 1, 4),
       (50, '更新用户基础信息', '/api/v1/user/update', 'POST', 1, 4),
       (51, '修改密码', '/api/v1/user/password/edit', 'POST', 1, 4),
       (52, '获取用户详情', '/api/v1/user/get', 'POST', 1, 4),
       (53, '创建角色', '/api/v1/role/create', 'POST', 1, 3),
       (54, '删除角色', '/api/v1/role/delete', 'POST', 1, 3),
       (55, '获取角色详情', '/api/v1/role/get', 'POST', 1, 3),
       (56, '获取角色列表', '/api/v1/role/list', 'POST', 1, 3),
       (57, '角色关联API', '/api/v1/role/relate/api', 'POST', 1, 3),
       (58, '获取角色下拉列表', '/api/v1/role/select', 'POST', 1, 3),
       (59, '更新角色', '/api/v1/role/update', 'POST', 1, 3),
       (60, '创建API', '/api/v1/system/api/create', 'POST', 1, 1),
       (61, '删除API', '/api/v1/system/api/delete', 'POST', 1, 1),
       (62, '获取API详情', '/api/v1/system/api/get', 'POST', 1, 1),
       (63, '获取API列表', '/api/v1/system/api/list', 'POST', 1, 1),
       (64, '获取API下拉列表', '/api/v1/system/api/select', 'POST', 1, 1),
       (65, '更新API数据', '/api/v1/system/api/update', 'POST', 1, 1),
       (66, '测试', '/test', 'POST', 0, 0),
       (67, '创建字典', '/api/v1/dict/create', 'POST', 1, 5),
       (68, '字典列表', '/api/v1/dict/list', 'POST', 1, 5),
       (69, '更新字典状态', '/api/v1/dict/status/update/batch', 'POST', 1, 5),
       (70, '删除字典列表', '/api/v1/dict/batch/delete', 'POST', 1, 5),
       (71, '删除字典', '/api/v1/dict/delete', 'POST', 1, 5),
       (72, '获取字典详情', '/api/v1/dict/get', 'POST', 1, 5),
       (73, '获取字典下拉列表', '/api/v1/dict/select', 'POST', 1, 5),
       (74, '更新字典', '/api/v1/dict/update', 'POST', 1, 5),
       (75, '实时告警列表', '/api/v1/alarm/realtime/list', 'POST', 2, 6),
       (76, '报警历史', '/api/v1/alarm/history/list', 'POST', 2, 7),
       (77, '报警历史详情', '/api/v1/alarm/history/get', 'POST', 2, 7),
       (78, '策略列表', '/api/v1/strategy/list', 'POST', 2, 9),
       (79, '策略详情', '/api/v1/strategy/detail', 'POST', 2, 9),
       (80, '创建策略', '/api/v1/strategy/create', 'POST', 2, 9),
       (81, '更新策略', '/api/v1/strategy/update', 'POST', 2, 9),
       (82, '删除策略', '/api/v1/strategy/delete', 'POST', 2, 9),
       (83, '批量启用策略', '/api/v1/strategy/status/batch/update', 'POST', 2, 9),
       (84, '批量删除策略', '/api/v1/strategy/batch/delete', 'POST', 2, 9),
       (85, '策略列表(下拉)', '/api/v1/strategy/select', 'POST', 2, 9),
       (86, '绑定通知对象', '/api/v1/strategy/notify/object/bind', 'POST', 2, 9),
       (87, '创建新的大盘', '/api/v1/dashboard/create', 'POST', 2, 15),
       (88, '删除大盘', '/api/v1/dashboard/delete', 'POST', 2, 15),
       (89, '大盘详情', '/api/v1/dashboard/detail', 'POST', 2, 15),
       (90, '大盘列表', '/api/v1/dashboard/list', 'POST', 2, 15),
       (91, '大盘下拉列表', '/api/v1/dashboard/select', 'POST', 2, 15),
       (92, '更新大盘', '/api/v1/dashboard/update', 'POST', 2, 15),
       (93, '创建新图表', '/api/v1/dashboard/chart/create', 'POST', 2, 14),
       (94, '删除图表', '/api/v1/dashboard/chart/delete', 'POST', 2, 14),
       (95, '图表详情', '/api/v1/dashboard/chart/detail', 'POST', 2, 14),
       (96, '图表列表', '/api/v1/dashboard/chart/list', 'POST', 2, 14),
       (97, '更新图表', '/api/v1/dashboard/chart/update', 'POST', 2, 14),
       (98, '我的告警页面', '/api/v1/alarm_page/my/list', 'POST', 2, 11),
       (99, '配置我的告警页面列表', '/api/v1/alarm_page/my/list/config', 'POST', 2, 11),
       (100, '权限树', '/api/v1/system/api/tree', 'POST', 1, 1);

