## Table: `ai_token_config`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `token_id` | `bigint` | `NOT NULL` | token_id |
| `create_by` | `character` | `varying(50)` | 创建人 |
| `update_by` | `character` | `varying(50)` | 更新人 |
| `create_time` | `timestamp(6)` | `without time zone` | 创建时间 |
| `update_time` | `timestamp(6)` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |
| `tokens` | `integer` | `` | token长度参数 |
| `del_flag` | `character(1)` | `` | 删除类型： 0-正常，1-删除 |


## Table: `auto_exec_configure`

**表注释**: 执行配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `conf_id` | `bigint` | `NOT NULL` | 执行配置id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 是否删除 0-不是，1-是 |
| `exec_style` | `character(1)` | `` | 执行策略 0-立即执行，1-定时执行 |
| `exec_type` | `character(1)` | `` | 执行类型 0-串行 1-随机 |
| `send_mail` | `character(1)` | `` | 是否发送邮件 0-否 1-是 |
| `task_id` | `bigint` | `NOT NULL` | 执行任务id |
| `script_type` | `character` | `varying(100) NOT NULL` | 关联脚本种类 |
| `cron` | `character` | `varying(50)` | 七子表达式 |
| `single_count` | `integer` | `` | 单个执行次数 |
| `total_count` | `integer` | `` | 执行总次数 |
| `cycle_start_time` | `timestamp` | `without time zone` | 执行周期-开始时间 |
| `cycle_end_time` | `timestamp` | `without time zone` | 执行周期-结束时间 |
| `exec_num` | `integer` | `DEFAULT 0` | 执行的真实次数 |
| `exec_status` | `character(1)` | `DEFAULT '0'::bpchar` | 执行状态 0-未执行，1-执行中，2-未执行 |
| `timed_type` | `integer` | `` | 定时类型 0-指定时间，1-定点时间，3-周期执行 |
| `exec_json_info` | `text` | `` | 提测参数json |
| `enabled` | `boolean` | `` | 是否启用 |
| `custom_job_rule` | `character` | `varying(1000)` | 周期执行配置策略 |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `auto_exec_info`

**表注释**: 执行配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `exec_id` | `bigint` | `NOT NULL` | 执行配置id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 是否删除 0-不是，1-是 |
| `task_id` | `bigint` | `NOT NULL` | 执行任务id |
| `script_type` | `character` | `varying(100) NOT NULL` | 关联脚本种类 |
| `conf_id` | `bigint` | `NOT NULL` | 配置id |
| `exec_style` | `character(1)` | `` | 执行策略 0-立即执行，1-定时执行 |
| `exec_type` | `character(1)` | `` | 执行类型 0-串行 1-随机 |
| `exec_status` | `character(1)` | `DEFAULT '0'::bpchar` | 执行状态 0-未执行  1-执行中  2-成功  3-失败  4-停止 |
| `start_time` | `timestamp` | `without time zone` | 执行开始时间 |
| `end_time` | `timestamp` | `without time zone` | 执行结束时间 |
| `exec_duration` | `character` | `varying(100)` | 执行时长 |
| `exec_user_id` | `bigint` | `` | 执行人 |
| `exec_conf_json` | `text` | `` | 执行配置的json |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `case_metrics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `cr_id` | `bigint` | `` | CRId |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `cr_code` | `character` | `varying(255)` | CR编码 |
| `cr_online_time` | `timestamp` | `without time zone` | CR上线时间 |
| `case_id` | `character` | `varying(50)` | 案例Id |
| `case_name` | `character` | `varying(2000)` | 案例名称 |
| `case_designer_id` | `bigint` | `` | 案例设计人Id |
| `case_designer_name` | `character` | `varying(255)` | 案例设计人名称 |
| `case_designer_group_name` | `character` | `varying(255)` | 案例设计人组别 |
| `related_issue` | `character` | `varying(50)` | 关联缺陷 |
| `auto_exec_flag` | `boolean` | `` | 是否自动化案例 |
| `case_stage_type` | `character` | `varying(10)` | 阶段版本标识(sit,uat) |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `system_id` | `bigint` | `` | 系统ID |
| `system_name` | `character` | `varying(255)` | 系统名称 |
| `system_manager_dept_id` | `bigint` | `` | 系统负责人所属处室id |
| `system_manager_dept_name` | `character` | `varying(255)` | 系统负责人所属处室名称 |
| `first_module_id` | `bigint` | `` | 一级模块ID |
| `first_module_name` | `character` | `varying(255)` | 一级模块名称 |
| `second_module_id` | `bigint` | `` | 二级模块ID |
| `second_module_name` | `character` | `varying(255)` | 二级模块名称 |
| `stage_version_id` | `bigint` | `` | 阶段版本 |
| `stage_version_name` | `character` | `varying(255)` | 阶段版本名称 |


## Table: `cockpit_common_function`

**表注释**: 驾驶舱常用功能配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cockpit_id` | `character` | `varying(64) NOT NULL` | 驾驶舱Id |
| `create_by` | `character` | `varying(64)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `name` | `character` | `varying(128)` | 功能名称 |
| `power_name` | `character` | `varying(128) NOT NULL` | 权限名称 |


## Table: `cr_actual_release_manage_time`

**表注释**: CR实际发布管理时间表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cr_id` | `bigint` | `NOT NULL` | CRid |
| `sit_actual_release_manage_time` | `timestamp(6)` | `without time zone` | sit实际发布管理时间 |
| `uat_actual_release_manage_time` | `timestamp(6)` | `without time zone` | uat实际发布管理时间 |
| `import_date` | `timestamp(6)` | `without time zone` | 导入时间 |


## Table: `cr_metrics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cr_id` | `bigint` | `NOT NULL` |  |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `stage_version_id` | `bigint` | `` | 阶段版本id |
| `stage_version_name` | `character` | `varying(255)` | 阶段版本名称 |
| `cr_proposer_dept_name` | `character` | `varying(200)` | 需求提出部门 |
| `dev_dept_name` | `character` | `varying(200)` | 开发处室 |
| `cr_online_time` | `timestamp` | `without time zone` | CR上线时间 |
| `delayed_release_flag` | `boolean` | `` | 是否延期发布 |
| `sit_test_case_reuse_rate` | `real` | `` | SIT 测试案例复用率 |
| `uat_test_case_reuse_rate` | `real` | `` | UAT 测试案例复用率 |
| `sit_positive_negative_ratio` | `real` | `` | SIT 正向/反向案例比 |
| `uat_positive_negative_ratio` | `real` | `` | UAT 正向/反向案例比 |
| `sit_test_case_density` | `numeric(10` | `` | SIT 案例密度 |
| `uat_test_case_density` | `real` | `` | UAT 案例密度 |
| `sit_req_change_test_case_change_rate` | `real` | `` | SIT 需求变更测试案例变更率 |
| `uat_req_change_test_case_change_rate` | `real` | `` | UAT 需求变更测试案例变更率 |
| `sit_test_case_hit_rate` | `real` | `` | SIT 测试案例命中率 |
| `uat_test_case_hit_rate` | `real` | `` | UAT 测试案例命中率 |
| `sit_effective_defect_rate` | `real` | `` | SIT 有效缺陷率 |
| `uat_effective_defect_rate` | `real` | `` | UAT 有效缺陷率 |
| `defect_escape_rate` | `real` | `` | 缺陷逃逸率 |
| `uat_accepted_flag` | `boolean` | `` | UAT 是否承接且投产 |
| `sit_accepted_flag` | `boolean` | `` | SIT 是否承接且投产 |
| `test_phase_req_change_flag` | `boolean` | `` | 是否测试阶段需求变更 |
| `sit_smoke_test_passed_rate` | `real` | `` | SIT 冒烟测试通过率 |
| `uat_smoke_test_passed_rate` | `real` | `` | UAT 冒烟测试通过率 |
| `sit_smoke_test_flag` | `boolean` | `` | SIT 是否有冒烟测试 |
| `sit_smoke_test_all_passed_flag` | `boolean` | `` | SIT 冒烟测试是否全部通过 |
| `uat_smoke_test_flag` | `boolean` | `` |  UAT 是否有冒烟测试 |
| `uat_smoke_test_all_passed_flag` | `boolean` | `` |  UAT 冒烟测试是否全部通过 |
| `sit_delayed_release_flag` | `boolean` | `` | SIT 是否延期上版 |
| `uat_delayed_release_flag` | `boolean` | `` |  UAT 是否延期上版 |
| `code_defect_percentage` | `real` | `` | 代码类缺陷占比 |
| `avg_defect_resolution_time` | `real` | `` | 缺陷平均停留时长 |
| `code_type_defect_rate` | `real` | `` | 代码类缺陷占比 |
| `requirement_type_defect_rate` | `real` | `` | 需求类类缺陷占比 |
| `env_type_defect_rate` | `real` | `` | 环境类类缺陷占比 |
| `optimization_type_defect_rate` | `real` | `` | 优化类缺陷占比 |
| `design_type_defect_rate` | `real` | `` | 设计类缺陷占比 |
| `data_type_defect_rate` | `real` | `` | 数据类缺陷占比 |
| `param_type_defect_rate` | `real` | `` | 参数类缺陷占比 |
| `fun_spec_type_defect_rate` | `real` | `` | 功能规格类缺陷占比 |
| `itil_type_defect_rate` | `real` | `` | itil类缺陷占比 |
| `delayed_defect_resolution_percentage` | `real` | `` | 缺陷延迟修复占比 |
| `blocked_defect_rate` | `real` | `` | 阻塞缺陷率 |
| `critical_major_defect_percentage` | `real` | `` | 致命/严重缺陷占比 |
| `defect_rejection_rate` | `real` | `` | 缺陷不通过率 |
| `uat_compliant_flag` | `boolean` | `` | 用户验收测试是否达标 |
| `product_risk_level_distribution_percentage` | `real` | `` | 产品风险等级占比 |
| `sit_cr_testing_duration` | `real` | `` | 单个 CR 在 SIT 阶段执行测试时长 |
| `uat_cr_testing_duration` | `real` | `` | 单个 CR 在 UAT 阶段执行测试时长 |
| `excessive_micro_flag` | `boolean` | `` | 是否属于超标微需求 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `micro_flag` | `boolean` | `` | 是否是微需求 |
| `issue_density` | `real` | `` | 缺陷密度 |
| `risk_issue_rate` | `real` | `` | 关联风险缺陷占比 |
| `cr_type` | `character` | `varying(200)` | cr类型 |
| `cr_process_name` | `character` | `varying(200)` | 测试过程类型 |
| `cr_automated_case_execute_count` | `integer` | `` | CR自动化案例执行总次数 |
| `cr_case_execute_count` | `integer` | `` | CR案例执行总次数 |
| `cr_automated_test_execute_rate` | `real` | `` | CR自动化测试执行占比 |
| `cr_sit_automated_case_execute_count` | `integer` | `` | CR-SIT自动化案例执行总次数 |
| `cr_sit_case_execute_count` | `integer` | `` | CR-SIT案例执行总次数 |
| `cr_sit_automated_test_execute_rate` | `real` | `` | CR-SIT自动化测试执行占比 |
| `cr_uat_automated_case_execute_count` | `integer` | `` | CR-UAT自动化案例执行总次数 |
| `cr_uat_case_execute_count` | `integer` | `` | CR-UAT案例执行总次数 |
| `cr_uat_automated_test_execute_rate` | `real` | `` | CR-UAT自动化测试执行占比 |
| `automated_test_flag` | `boolean` | `` | 是否应用自动化测试 |
| `cr_automated_case_count` | `integer` | `` | CR自动化案例数量 |
| `cr_case_count` | `integer` | `` | CR案例总数 |
| `cr_automated_test_case_converage_rate` | `real` | `` | CR自动化测试案例覆盖率 |
| `sit_automated_test_case_from_case_library_count` | `integer` | `` | sit从案例库引入自动化案例总数 |
| `sit_automated_test_case_count` | `integer` | `` | sit自动化案例总数 |
| `sit_automated_test_case_reuse_rate` | `real` | `` | SIT自动化测试案例复用率 |
| `uat_automated_test_case_from_case_library_count` | `integer` | `` | uat从案例库引入自动化案例总数 |
| `uat_automated_test_case_count` | `integer` | `` | uat自动化案例总数 |
| `uat_automated_test_case_reuse_rate` | `real` | `` | UAT自动化测试案例复用率 |
| `cr_risk_count` | `integer` | `` | CR风险总数 |
| `risk_issue_count` | `integer` | `` | 关联风险缺陷数量 |
| `product_risk_level_distribution_count` | `integer` | `` | 重大/较大产品风险个数 |
| `critical_major_defect_count` | `integer` | `` | 阻塞和严重缺陷总数 |
| `sit_lib_case_import_count` | `integer` | `` | SIT从案例库引入案例数量 |
| `sit_case_count` | `integer` | `` | SIT案例总数 |
| `uat_lib_case_import_count` | `integer` | `` | UAT从案例库引入案例数量 |
| `uat_case_count` | `integer` | `` | UAT案例总数 |
| `sit_positive_count` | `integer` | `` | SIT正向案例数 |
| `sit_negative_count` | `integer` | `` | SIT反向案例数 |
| `uat_positive_count` | `integer` | `` | SIT正向案例数 |
| `uat_negative_count` | `integer` | `` | SIT反向案例数 |
| `sit_second_module_count` | `integer` | `` | SIT案例二级模块数 |
| `uat_second_module_count` | `integer` | `` | UAT案例二级模块数 |
| `sit_case_relate_issue_count` | `integer` | `` | SIT案例关联的缺陷总数 |
| `uat_case_relate_issue_count` | `integer` | `` | UAT案例关联的缺陷总数 |
| `sit_effective_issue_count` | `integer` | `` | SIT有效缺陷数 |
| `sit_issue_count` | `integer` | `` | SIT缺陷总数 |
| `uat_effective_issue_count` | `integer` | `` | UAT有效缺陷数 |
| `uat_issue_count` | `integer` | `` | UAT缺陷总数 |
| `code_defect_count` | `integer` | `` | 代码类有效缺陷数 |
| `effective_issue_count` | `integer` | `` | 有效缺陷总数 |
| `requirement_type_defect_count` | `integer` | `` | 需求类有效缺陷数 |
| `env_type_defect_count` | `integer` | `` | 环境类有效缺陷数 |
| `optimization_type_defect_count` | `integer` | `` | 优化类有效缺陷数 |
| `design_type_defect_count` | `integer` | `` | 设计类有效缺陷数 |
| `data_type_defect_count` | `integer` | `` | 数据类有效缺陷数 |
| `param_type_defect_count` | `integer` | `` | 参数类有效缺陷数 |
| `fun_spec_type_defect_count` | `integer` | `` | 功能规格类有效缺陷数 |
| `itil_type_defect_count` | `integer` | `` | itil类有效缺陷数 |
| `blocked_defect_count` | `integer` | `` | 阻塞缺陷数量 |
| `other_type_defect_count` | `integer` | `` | 其他类有效缺陷数 |
| `have_question_effective_issue_count` | `integer` | `` | 有问题分类有效缺陷总数 |
| `sit_req_change_case_count` | `integer` | `` | SIT需求变更案例数量 |
| `uat_req_change_case_count` | `integer` | `` | UAT需求变更案例数量 |
| `total_functional_points` | `integer` | `` | 总功能点数 |
| `agile_flag` | `character` | `varying(255)` | 是否敏捷，1是，其他否 |


## Table: `cr_file`

**表注释**: CR文档表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(256)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(256)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目组id |
| `cr_id` | `bigint` | `` | crId |
| `file_type` | `integer` | `` | 文件类型 0：需求规格说明书，1：概要设计说明书，2：业务需求书，3：详细设计说明书，4：项目需求用户验收测试报告，5：项目系统集成测试报告，6：整体测试计划 |
| `file_name` | `character` | `varying(256)` | 文件名 |
| `file_path` | `character` | `varying(256)` | 下载路径 |
| `file_version` | `character` | `varying(10)` | 版本号 |
| `vp_flag` | `integer` | `` | 来源 0：本地，1：vp |
| `sub_flag` | `integer` | `` | 提交vp标识 0：未提交，1：已提交 |
| `del_flag` | `character(1)` | `` | 删除标识 0：未删除，1：已删除 |
| `system_name` | `character` | `varying(256)` | 所属系统 |
| `sub_time` | `timestamp` | `without time zone` | 提交vp时间 |
| `vp_cr_id` | `bigint` | `` | vp的crId |


## Table: `custom_report_field_relation`

**表注释**: 自定义报表模板和字段关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `template_id` | `bigint` | `NOT NULL` | 自定义报表主键id |
| `field_id` | `bigint` | `NOT NULL` | 字段id |
| `sort_flag` | `integer` | `` | 排序 |
| `show_flag` | `integer` | `DEFAULT 1` | 显示标识 |
| `default_flag` | `integer` | `DEFAULT 1` | 默认是否展示 |


## Table: `custom_report_template`

**表注释**: 自定义报表模板


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `template_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(255)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(255)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `template_name` | `character` | `varying(128)` | 模板名称 |
| `template_code` | `character` | `varying(128)` | 模板编码 |
| `template_desc` | `character` | `varying(128)` | 模板描述 |
| `project_default` | `smallint` | `` | 项目初始值 |
| `system_flag` | `smallint` | `` | 系统标识 |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |


## Table: `evaluation_checks`

**表注释**: 后评价计划、任务检核项


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `check_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 删除标识 |
| `plan_id` | `bigint` | `NOT NULL` | 计划id |
| `task_id` | `bigint` | `` | 任务id |
| `cr_id` | `bigint` | `NOT NULL` | cr的id |
| `check_type` | `integer` | `NOT NULL` | 检核项 0-计划，1-任务 |
| `check_project` | `integer` | `NOT NULL` | 检核项 0-需求分析，1-案例设计，2-案例执行，3-评审，4-风险，5-缺陷，6-生产问题 |
| `stage_type` | `character` | `varying(255)` | 测试阶段 |
| `check_status` | `integer` | `` | 检查项状态 0:未分配 1:已分配 2:已完成 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |


## Table: `evaluation_issue`

**表注释**: 后评价质量跟踪


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `issue_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `plan_id` | `bigint` | `` | 所属计划 |
| `task_id` | `bigint` | `` | 所属任务 |
| `cr_id` | `bigint` | `` | 所属cr |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `stage_type` | `character` | `varying(10)` | 测试阶段 sit/uat |
| `issue_name` | `character` | `varying(500)` | 标题 |
| `issue_level` | `character` | `varying(10)` | 严重程度 |
| `start_time` | `timestamp` | `without time zone` | 开始时间 |
| `end_time` | `timestamp` | `without time zone` | 截止时间 |
| `issue_circulate_user` | `text` | `` | 传阅人 |
| `issue_type` | `character` | `varying(50)` | 问题类型 |
| `sub_issue_type` | `character` | `varying(50)` | 问题子类 |
| `issue_description` | `character` | `varying(1500)` | 问题描述 |
| `issue_remark` | `character` | `varying(1500)` | 备注 |
| `issue_cause_reason` | `character` | `varying(1500)` | 问题产生原因 |
| `issue_suggestion` | `character` | `varying(1500)` | 整改措施 |
| `issue_feedback` | `character` | `varying(1500)` | 整改反馈 |
| `process_id` | `bigint` | `` | 流程id |
| `issue_status` | `bigint` | `` | 缺陷状态 |
| `issue_code` | `character` | `varying(100)` | 问题编号 |
| `pre_issue_status` | `bigint` | `` | 上一个缺陷状态 |
| `issue_transfer_state` | `character` | `varying(50)` | 缺陷流转状态 ：create、transferring、close |
| `close_flag` | `tinyint` | `` | 是否关闭 1:是 0:否 |
| `overdue_flag` | `tinyint` | `` | 是否超期 1:是 0:否 |
| `status_code` | `character` | `varying(50)` | 状态编码 |
| `effective_flag` | `tinyint` | `` | 是否有效 1:是 0:否 |
| `find_user` | `bigint` | `` | 发现人 |
| `receive_user` | `bigint` | `` | 接收人 |
| `enter_state_time` | `timestamp` | `without time zone` | 状态变更时时间 |
| `issue_level_update_time` | `timestamp` | `without time zone` | 重要程度变更时时间 |
| `back_space_user` | `bigint` | `` | 回退人 |
| `close_time` | `timestamp` | `without time zone` | 缺陷关闭时间 |
| `overdue_day` | `integer` | `` | 超期天数 |
| `opt_ids` | `character` | `varying(1024)` | 状态流转操作人 |
| `rectification_reason` | `character` | `varying(1500)` | 整改原因 |


## Table: `evaluation_plan`

**表注释**: 后评价计划表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `plan_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `bigint` | `` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `bigint` | `` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `plan_title` | `character` | `varying(64)` | 计划标题 |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `plan_desc` | `character` | `varying(2000)` | 计划描述 |
| `plan_status` | `integer` | `` | 计划状态，0未开始，1进行中，2已完成 |
| `plan_start_time` | `timestamp` | `without time zone` | 计划开始时间 |
| `plan_end_time` | `timestamp` | `without time zone` | 计划结束时间 |
| `actual_start_time` | `timestamp` | `without time zone` | 实际开始时间 |
| `actual_end_time` | `timestamp` | `without time zone` | 实际结束时间 |
| `creator_id` | `bigint` | `` | 创建人id |


## Table: `evaluation_plan_cr`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `create_by` | `bigint` | `` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `bigint` | `` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `plan_id` | `bigint` | `` | 计划id  |
| `cr_id` | `bigint` | `` | crid  |


## Table: `evaluation_report`

**表注释**: 后评价报告


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `report_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 删除标识 0：未删除，1：已删除 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目组id |
| `create_id` | `bigint` | `` | 创建人id |
| `report_title` | `character` | `varying(64)` | 报告标题 |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `report_summary` | `character` | `varying(1000)` | 报告概述 |
| `check_issue_list` | `character` | `varying(1000)` | 检核项问题排名前5 |
| `report_status` | `integer` | `` | 报告状态 |
| `report_version` | `character` | `varying(1000)` | 报告版本 |
| `report_cr_content` | `character` | `varying(10000)` | cr维度概述包括概述，图片地址，数据 |
| `report_sit_content` | `character` | `varying(10000)` | sit维度概述包括概述，图片地址，数据 |
| `report_uat_content` | `character` | `varying(10000)` | uat维度概述包括概述，图片地址，数据 |
| `report_issue_content` | `character` | `varying(10000)` | 问题维度概述包括概述，图片地址，数据 |
| `issue_desc` | `character` | `varying(10000)` | 问题原因分析 |
| `issue_change_desc` | `character` | `varying(10000)` | 问题整改措施 |
| `stage_type` | `character` | `varying(10)` | 测试阶段 sit/uat |
| `check_issue_url` | `character` | `varying(100)` | 检核问题表url |
| `report_url` | `character` | `varying(100)` | 报告地址 |


## Table: `evaluation_report_plan`

**表注释**: 后评价报告和计划关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `report_id` | `bigint` | `NOT NULL` | 报告id |
| `plan_id` | `bigint` | `NOT NULL` | 计划id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `evaluation_task`

**表注释**: 后评价任务


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `task_id` | `bigint` | `NOT NULL` | 任务id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 删除标识 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `task_name` | `character` | `varying(100)` | 任务名称 |
| `stageversion_id` | `bigint` | `` | 阶段版本 |
| `task_status` | `integer` | `` | 任务状态 |
| `task_exec_id` | `bigint` | `` | 实施人id |
| `task_start_time` | `timestamp` | `without time zone` | 任务计划开始时间 |
| `task_end_time` | `timestamp` | `without time zone` | 任务计划结束时间 |
| `actual_start_time` | `timestamp` | `without time zone` | 实际开始时间 |
| `actual_end_time` | `timestamp` | `without time zone` | 实际结束时间 |
| `plan_id` | `bigint` | `` | 计划id |
| `creator_id` | `bigint` | `` | 创建人id |
| `general_comment` | `character` | `varying(2000)` | 任务总评 |
| `task_description` | `character` | `varying(2000)` | 描述 |
| `overdue_day` | `integer` | `` | 超期天数 |


## Table: `evaluation_task_cr`

**表注释**: 后评价任务和cr关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `task_id` | `bigint` | `NOT NULL` | 任务id |
| `cr_id` | `bigint` | `NOT NULL` | cr的id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `event_case_relation`

**表注释**: 生产事件关联案例表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `event_id` | `bigint` | `` | 生产事件id |
| `case_id` | `character` | `varying(50)` | 案例id |
| `case_name` | `character` | `varying(1000)` | 案例名称 |
| `case_side_type` | `integer` | `` | 正反例 |
| `case_type` | `integer` | `` | 案例类型 |
| `case_code` | `character` | `varying(100)` | 案例编码 |


## Table: `event_issue_relation`

**表注释**: 生产事件关联缺陷表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `event_id` | `bigint` | `` | 生产事件id |
| `issue_id` | `character` | `varying(50)` | 缺陷id |
| `issue_no` | `character` | `varying(100)` | 缺陷编号 |
| `issue_name` | `character` | `varying(1000)` | 缺陷名称 |
| `issue_status` | `bigint` | `` | 缺陷状态 |


## Table: `event_risk_relation`

**表注释**: 生产事件关联风险表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `event_id` | `bigint` | `` | 生产事件id |
| `risk_id` | `character` | `varying(50)` | 风险id |
| `risk_code` | `character` | `varying(100)` | 风险编号 |
| `risk_name` | `character` | `varying(1000)` | 风险名称 |


## Table: `group_metrics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `group_id` | `bigint` | `` | 组别id |
| `group_name` | `character` | `varying(128)` | 组别名称 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `date` | `` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `date` | `` | 更新时间 |
| `lib_auto_case_count` | `integer` | `` | 案例库自动化案例总数 |
| `lib_case_count` | `integer` | `` | 案例库案例总数 |
| `lib_auto_case_cover_rate` | `real` | `` | 案例库自动化测试案例覆盖率 |
| `sit_group_add_delete_update_after_exec_once_script_count` | `integer` | `` | SIT组别增删改且改后至少执行一次的脚本数量 |
| `uat_group_add_delete_update_after_exec_once_script_count` | `integer` | `` | UAT组别增删改且改后至少执行一次的脚本数量 |
| `sit_group_original_auto_script_count` | `integer` | `` | SIT组别原有自动化脚本数量 |
| `uat_group_original_auto_script_count` | `integer` | `` | UAT组别原有自动化脚本数量 |
| `sit_group_scenarioization_script_count` | `integer` | `` | SIT组别下打过场景化脚本标签的脚本数量 |
| `uat_group_scenarioization_script_count` | `integer` | `` | UAT组别下打过场景化脚本标签的脚本数量 |
| `sit_group_all_auto_script_count` | `integer` | `` | SIT组别下所有自动化脚本数量 |
| `uat_group_all_auto_script_count` | `integer` | `` | UAT组别下所有自动化脚本数量 |


## Table: `import_user_role_test`

**表注释**: 老测服人员角色关系生产导入数据


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `userresourceid` | `bigint` | `` | 人员id |
| `usergroupresourceid` | `bigint` | `` | 角色id |
| `name` | `character` | `varying(256)` | 角色名称 |
| `username` | `character` | `varying(256)` | 用户名称 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `issue_delete_info`

**表注释**: 缺陷删除记录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `issue_id` | `character` | `varying(50) NOT NULL` | 缺陷id |
| `issue_no` | `character` | `varying(50)` | 缺陷编号 |
| `delete_time` | `timestamp(6)` | `without time zone` | 删除时间 |


## Table: `issue_metrics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `issue_id` | `character` | `varying(50) NOT NULL` | 缺陷id |
| `issue_name` | `character` | `varying(1000)` | 缺陷名称 |
| `issue_no` | `character` | `varying(50)` | 缺陷编号 |
| `problem_type` | `character` | `varying(100)` | 问题分类 |
| `cr_id` | `bigint` | `` | crId |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `cr_online_time` | `timestamp` | `without time zone` | CR上线时间 |
| `system_id` | `bigint` | `` | 缺陷所属系统 |
| `system_name` | `character` | `varying(150)` | 缺陷所属系统名称 |
| `system_manager_id` | `bigint` | `` | 所属系统负责人处室 |
| `system_manager_dept_id` | `bigint` | `` | 所属系统负责人处室Id |
| `system_manager_dept_name` | `character` | `varying(255)` | 所属系统负责人所在处室 |
| `stage_version_id` | `bigint` | `` | 所属阶段版本 |
| `stage_version_name` | `character` | `varying(150)` | 所属阶段版本名称 |
| `stage_type` | `character` | `varying(50)` | 测试阶段 |
| `valid_and_close_duration` | `tinyint` | `` | 有效且已关闭的停留时长 |
| `repair_duration` | `tinyint` | `` | 缺陷修复所用时长 |
| `block_flag` | `boolean` | `` | 是否阻塞类缺陷 |
| `serious_flag` | `boolean` | `` | 是否严重/致命缺陷 |
| `overdue_flag` | `tinyint` | `` | 是否超期 1:是 0:否 |
| `passed_flag` | `boolean` | `` | 是否通过标识通过 |
| `code_problem_flag` | `boolean` | `` | 是否是代码类问题 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `library_risk_case_relation`

**表注释**: 资产库风险案例关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `case_id` | `character` | `varying(50) NOT NULL` | 检查结果id |
| `risk_id` | `character` | `varying(50) NOT NULL` | 企业id |


## Table: `month_test_metrics`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键 |
| `create_time` | `date` | `` | 创建时间 |
| `sit_test_case_capacity` | `real` | `` | sit测试案例产能 |
| `uat_test_case_capacity` | `real` | `` | uat测试案例产能 |
| `sit_issue_efficacy` | `real` | `` | sit缺陷效能 |
| `uat_issue_efficacy` | `real` | `` | uat缺陷效能 |
| `sit_fun_test_efficacy` | `real` | `` | sit功能点测试效能 |
| `uat_fun_test_efficacy` | `real` | `` | uat功能点测试效能 |
| `cr_sit_test_efficacy` | `real` | `` | sit阶段cr测试效能 |
| `cr_uat_test_efficacy` | `real` | `` | uat阶段cr测试效能 |
| `product_risk_reuse_rate` | `real` | `` | 产品风险复用率 |
| `product_risk_lib_fresh_rate` | `real` | `` | 产品风险库保鲜率 |
| `case_lib_reuse_rate` | `real` | `` | 案例资产复用率 |
| `case_lib_fresh_rate` | `real` | `` | 案例库案例保鲜率 |
| `auto_test_case_lib_reuse_rate` | `real` | `` | 自动化案例资产复用率 |
| `case_lib_sit_reuse_rate` | `real` | `` | 案例库SIT资产复用率 |
| `case_lib_uat_reuse_rate` | `real` | `` | 案例库UAT资产复用率 |
| `interface_test_case_lib_cover_rate` | `real` | `` | 接口测试案例库自动化案例覆盖率 |
| `ui_test_case_lib_cover_rate` | `real` | `` | UI测试案例库自动化案例覆盖率 |
| `sit_interface_script_rate` | `real` | `` | SIT接口场景化脚本率 |
| `uat_interface_script_rate` | `real` | `` | UAT接口场景化脚本率 |
| `sit_auto_script_fresh_rate` | `real` | `` | SIT自动化脚本保鲜率 |
| `uat_auto_script_fresh_rate` | `real` | `` | UAT自动化脚本保鲜率 |
| `sit_auto_execute_count` | `integer` | `` | SIT自动化执行总次数 |
| `uat_auto_execute_count` | `integer` | `` | UAT自动化执行总次数 |
| `sit_case_execute_count` | `integer` | `` | SIT测试案例执行总次数 |
| `uat_case_execute_count` | `integer` | `` | UAT测试案例执行总次数 |


## Table: `non_funcation_system_stratum`

**表注释**: 非功能系统层级表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `stratum_id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `DEFAULT 1619927771602984961::bigint` |  |
| `project_id` | `bigint` | `DEFAULT 1` |  |
| `create_by` | `character` | `varying(128)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(128)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `name` | `character` | `varying(128)` | 层级名称 |
| `index` | `integer` | `` | 序号 |
| `parent_id` | `bigint` | `NOT NULL` | 父节点ID，没有父节点默ID认为0 |
| `stratum_type` | `character` | `varying(32)` | 节点类型：stratum--层，reaches--渠道 |
| `is_shroud` | `character(1)` | `DEFAULT '0'::bpchar` | 是否隐藏，0-不隐藏，1-隐藏 |


## Table: `non_functional_config`

**表注释**: 非功能评分关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `config_id` | `bigint` | `NOT NULL` | 配置id |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `http_transcribe_tps1` | `integer` | `` | HTTP(录制)TPS阈值1 |
| `http_transcribe_tps2` | `integer` | `` | HTTP(录制)TPS阈值2 |
| `http_transcribe_tps3` | `integer` | `` | HTTP(录制)TPS阈值3 |
| `http_transcribe_tps4` | `integer` | `` | HTTP(录制)TPS阈值4 |
| `http_transcribe_tps5` | `integer` | `` | HTTP(录制)TPS阈值5 |
| `http_transcribe_tps6` | `integer` | `` | HTTP(录制)TPS阈值6 |
| `http_transcribe_repsonse_time1` | `integer` | `` | HTTP(录制)响应时间阈值1 |
| `http_transcribe_repsonse_time2` | `integer` | `` | HTTP(录制)响应时间阈值2 |
| `http_transcribe_repsonse_time3` | `integer` | `` | HTTP(录制)响应时间阈值3 |
| `http_transcribe_repsonse_time4` | `integer` | `` | HTTP(录制)响应时间阈值4 |
| `http_service_tps1` | `integer` | `` | HTTP(接口)TPS阈值1 |
| `http_service_tps2` | `integer` | `` | HTTP(接口)TPS阈值2 |
| `http_service_tps3` | `integer` | `` | HTTP(接口)TPS阈值3 |
| `http_service_tps4` | `integer` | `` | HTTP(接口)TPS阈值4 |
| `http_service_tps5` | `integer` | `` | HTTP(接口)TPS阈值5 |
| `http_service_tps6` | `integer` | `` | HTTP(接口)TPS阈值6 |
| `http_service_repsonse_time1` | `integer` | `` | HTTP(接口)响应时间阈值1 |
| `http_service_repsonse_time2` | `integer` | `` | HTTP(接口)响应时间阈值2 |
| `http_service_repsonse_time3` | `integer` | `` | HTTP(接口)响应时间阈值3 |
| `http_service_repsonse_time4` | `integer` | `` | HTTP(接口)响应时间阈值4 |
| `tcp_tps1` | `integer` | `` | TcpTPS阈值1 |
| `tcp_tps2` | `integer` | `` | TcpTPS阈值2 |
| `tcp_tps3` | `integer` | `` | TcpTPS阈值3 |
| `tcp_tps4` | `integer` | `` | TcpTPS阈值4 |
| `tcp_tps5` | `integer` | `` | TcpTPS阈值5 |
| `tcp_tps6` | `integer` | `` | TcpTPS阈值6 |
| `tcp_repsonse_time1` | `integer` | `` | Tcp响应时间阈值1 |
| `tcp_repsonse_time2` | `integer` | `` | Tcp响应时间阈值2 |
| `tcp_repsonse_time3` | `integer` | `` | Tcp响应时间阈值3 |
| `tcp_repsonse_time4` | `integer` | `` | Tcp响应时间阈值4 |
| `tong_tps1` | `integer` | `` | Tong中间件TPS阈值1 |
| `tong_tps2` | `integer` | `` | Tong中间件TPS阈值2 |
| `tong_tps3` | `integer` | `` | Tong中间件TPS阈值3 |
| `tong_tps4` | `integer` | `` | Tong中间件TPS阈值4 |
| `tong_tps5` | `integer` | `` | Tong中间件TPS阈值5 |
| `tong_tps6` | `integer` | `` | Tong中间件TPS阈值6 |
| `tong_repsonse_time1` | `integer` | `` | Tong中间件响应时间阈值1 |
| `tong_repsonse_time2` | `integer` | `` | Tong中间件响应时间阈值2 |
| `tong_repsonse_time3` | `integer` | `` | Tong中间件响应时间阈值3 |
| `tong_repsonse_time4` | `integer` | `` | Tong中间件响应时间阈值4 |
| `tps_rating_weight` | `integer` | `` | TPS得分权重 |
| `response_time_rating_weight` | `integer` | `` | 平均响应时间得分权重 |
| `test_cycle_weight` | `integer` | `` | 测试周期权重 |
| `demand_quality_weight` | `integer` | `` | 需求质量得分权重 |
| `issue_repair_cycle_weight` | `integer` | `` | 缺陷修复周期得分权重 |
| `quality_rating_weight` | `integer` | `` | 系统质量评分权重 |
| `test_process_rating_weight` | `integer` | `` | 测试过程评分权重 |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `non_functional_project`

**表注释**: 非功能项目管理表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `plan_id` | `bigint` | `NOT NULL` | 计划id |
| `system_id` | `bigint` | `` |  |
| `enterprise_id` | `bigint` | `DEFAULT 1619927771602984961::bigint` |  |
| `project_id` | `bigint` | `DEFAULT 1` |  |
| `create_by` | `character` | `varying(64)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(64)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `vp_code` | `character` | `varying(64)` | vp编号 |
| `name` | `character` | `varying(256)` | 项目名称 |
| `plan_status` | `character` | `varying(64)` | 计划状态 |
| `test_user_name` | `character` | `varying(64)` | 测试负责人 |
| `change_type` | `character` | `varying(64)` | 变更类型 |
| `start_time` | `bigint` | `` | 开始时间 |
| `plan_completion_time` | `timestamp` | `without time zone` | 计划完成时间 |
| `case_number` | `character` | `varying(16)` | 脚本数量 |
| `test_type` | `character(1)` | `` | 测试类型：1-阶段版本，2-专项测试 |
| `application_user` | `character` | `varying(128)` | 需求提出人 |
| `application_state` | `character` | `varying(128)` | 需求提出部门 |
| `issue_number` | `integer` | `DEFAULT 0` | 缺陷总数 |
| `stage_version` | `character` | `varying(64)` | 阶段版本 |
| `is_history` | `character(1)` | `DEFAULT 2` | 历史迁移数据标识：1-是，2-不是 |


## Table: `non_functional_rating_relation`

**表注释**: 非功能评分关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `non_functional_task_id` | `bigint` | `NOT NULL` | 非功能任务id |
| `system_quality_rating` | `double` | `precision` | 系统质量评分 |
| `test_process_rating` | `double` | `precision` | 测试实施过程评分 |
| `system_type` | `integer` | `` | 系统类别 1：Http(录制) 2：Http(接口) 3：TCP 4：Tong中间件 |
| `tps_value` | `integer` | `` | TPS数值 |
| `response_time_value` | `integer` | `` | 平均响应时间 |
| `issue_value` | `integer` | `` | 缺陷数值 |
| `issue_score` | `double` | `precision` | 缺陷得分 |
| `demand_end_time` | `timestamp` | `without time zone` | 需求截止日期 |
| `environmenttal_readiness_time` | `timestamp` | `without time zone` | 环境就绪时间 |
| `test_completion_time` | `timestamp` | `without time zone` | 要求测试完成时间 |
| `demand_integrity_score` | `double` | `precision` | 需求完整度得分 |
| `case_coverage_score` | `double` | `precision` | 案例覆盖率得分 |
| `demand_change_frequency_score` | `double` | `precision` | 需求变更次数得分 |
| `issue_resolution_cycle` | `character` | `varying(10)` | 平均缺陷解决周期 |
| `system_quality_level` | `character` | `varying(10)` | 系统质量等级 |
| `test_process_level` | `character` | `varying(10)` | 测试实施过程等级 |
| `comprehensive_score` | `double` | `precision` | 综合评分 |
| `comprehensive_evaluation_level` | `character` | `varying(10)` | 综合评价等级 |


## Table: `non_functional_result`

**表注释**: 非功能项目测试结果表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `report_id` | `bigint` | `NOT NULL` |  |
| `system_id` | `bigint` | `` | 系统id |
| `plan_id` | `bigint` | `` | 计划id |
| `create_by` | `character` | `varying(64)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(64)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `test_env` | `character` | `varying(128)` | 测试场景 |
| `test_protocol` | `character` | `varying(128)` | 测试协议 |
| `tps` | `character` | `varying(64)` | TPS |
| `art` | `character` | `varying(64)` | ART |
| `rating_tag` | `character(1)` | `` | 评级标记：1-是，2-否 |
| `test_result` | `character` | `varying(128)` | 测试结果 |


## Table: `non_functional_stageversion`

**表注释**: 非功能测试阶段表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `stage_version_id` | `bigint` | `NOT NULL` | 非功能阶段版id |
| `create_by` | `character` | `varying(64)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(64)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `stage_version_name` | `character` | `varying(128)` | 非功能阶段版名称 |
| `del_flag` | `character(1)` | `` | 删除类型；0-正常，1-删除 |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `non_functional_synchro`

**表注释**: vp同步非功能任务表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 非功能任务id |
| `create_by` | `character` | `varying(64)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(64)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `vp_number` | `character` | `varying(256)` | 任务编号 |
| `task_name` | `character` | `varying(256)` | 任务名称 |
| `status` | `character` | `varying(128)` | 状态 |
| `current_state_person` | `character` | `varying(128)` | 当前状态负责人 |
| `relation_cr` | `character` | `varying(512)` | 关联cr |
| `application_time` | `timestamp` | `without time zone` | 申请时间 |
| `application_user` | `character` | `varying(128)` | 申请人 |
| `application_state` | `character` | `varying(128)` | 申请部门 |
| `ask_for_test_completion_time` | `timestamp` | `without time zone` | 要求测试完成时间 |
| `planned_test_deadline` | `timestamp` | `without time zone` | 计划测试截止时间 |
| `actual_finish_time` | `timestamp` | `without time zone` | 实际完成时间 |
| `test_category` | `character` | `varying(128)` | 测试类别 |
| `tele_phone` | `character` | `varying(128)` | 联系方式 |
| `staged_or_not_version` | `character` | `varying(128)` | 是否阶段版本（是、否） |
| `version_implement` | `character` | `varying(128)` | 版本实现 |
| `system_name` | `character` | `varying(128)` | 系统名称 |
| `description` | `character` | `varying(2000)` | 描述 |
| `results_entry` | `character` | `varying(128)` | 结果录入(未录入、已录入) |
| `del_flag` | `character(1)` | `` | 删除类型；0-正常，1-删除 |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `non_functional_system_reta`

**表注释**: 非功能项目测试结果表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `system_id` | `bigint` | `` | 系统id |
| `system_name` | `character` | `varying(256)` | 系统名称 |
| `application_state` | `character` | `varying(128)` | 所属处室 |
| `transactions` | `integer` | `` | 交易处理能力 |
| `immediate_response` | `integer` | `` | 即时响应能力 |
| `availability` | `integer` | `` | 高可用能力 |
| `burst_response` | `integer` | `` | 突发应对能力 |
| `code_quality` | `integer` | `` | 代码质量能力 |
| `test_frequency` | `integer` | `` | 测试频度评级 |
| `general_comment` | `integer` | `` | 总评 |
| `reta_level` | `character` | `varying(5)` | 总评级别：1-优秀，2-良好，3-及格，4-不及格 |


## Table: `non_functional_test_task`

**表注释**: 非功能测试任务表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `non_functional_task_id` | `bigint` | `NOT NULL` | 非功能任务id |
| `create_by` | `character` | `varying(128)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(128)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `non_functional_stage_id` | `bigint` | `NOT NULL` | 非功能阶段版id |
| `task_number` | `character` | `varying(256)` | 任务编号 |
| `task_name` | `character` | `varying(512)` | 任务名称 |
| `current_work_content` | `character` | `varying(512)` | 当前工作内容 |
| `work_plan_of_this_week` | `character` | `varying(512)` | 本周工作计划 |
| `progress_percentage` | `bigint` | `` | 测试进度 |
| `status` | `character` | `varying(256)` | 状态 |
| `current_issues` | `character` | `varying(256)` | 当前问题 |
| `total_number_of_defects` | `bigint` | `` | 缺陷总数 |
| `number_of_unresolved_defects` | `bigint` | `` | 未解决缺陷总数 |
| `number_of_scenes_executed` | `bigint` | `` | 待执行场景数 |
| `number_of_scenes_passed` | `bigint` | `` | 已通过场景数 |
| `number_of_scenes_failed` | `bigint` | `` | 未通过场景数 |
| `creator_id` | `bigint` | `` | 创建人 |
| `test_leader_id` | `bigint` | `` | 测试负责人 |
| `test_executor_id` | `bigint` | `` | 测试执行人 |
| `relation_cr` | `character` | `varying(256)` | 关联cr |
| `application_time` | `timestamp` | `without time zone` | 申请时间 |
| `application_user` | `character` | `varying(256)` | 申请人 |
| `application_state` | `character` | `varying(256)` | 申请部门 |
| `launch_time` | `timestamp` | `without time zone` | 上线时间 |
| `planned_test_deadline` | `timestamp` | `without time zone` | 计划测试截止时间 |
| `number_of_test_cases` | `bigint` | `` | 测试案例数 |
| `key_project_or_not` | `bigint` | `` | 是否重点项目,0:不是，1:是 |
| `production_type` | `character` | `varying(256)` | 投产类型 |
| `test_scenario` | `character` | `varying(512)` | 测试场景 |
| `del_flag` | `character(1)` | `` | 删除类型；0-正常，1-删除 |
| `test_leader` | `character` | `varying(64)` | 测试负责人账号 |
| `test_executor` | `character` | `varying(64)` |  |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `platform_component_config`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `component_id` | `bigint` | `DEFAULT nextval('platform_component_id_sequence'::regclass) NOT NULL` | Id编号 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |
| `component_name` | `character` | `varying(100)` | 组件名称 |
| `code_lib_name` | `character` | `varying(100)` | 代码库名称 |
| `charge_person` | `bigint` | `` | 负责人 |
| `del_flag` | `character` | `varying(10)` | 删除标识 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `platform_version_config`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `version_id` | `integer` | `DEFAULT nextval('platform_version_id_sequence'::regclass) NOT NULL` | Id编号 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |
| `component_id` | `bigint` | `` | 组件id |
| `version_no` | `character` | `varying(100)` | 版本号 |
| `del_flag` | `character` | `varying(10)` | 删除标识 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `production_event_detail`

**表注释**: 生产事件详情表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `event_id` | `bigint` | `` | 生产事件主表id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `event_leader_id` | `bigint` | `` | 组长 |
| `event_group_id` | `bigint` | `` | 组别 |
| `event_desc` | `character` | `varying(2000)` | 问题描述 |
| `analyze_user` | `bigint` | `` | 生产问题分析人 |
| `receive_user` | `bigint` | `` | 生产问题接收人 |
| `issue_type` | `integer` | `` | 问题类型 1.需求优化/优化建议，2.系统缺陷，3.版本部署问题，4.性能问题，5，第三方问题 |
| `business_cause_analyze` | `character` | `varying(2000)` | 业务场景及原因分析 |
| `cr_code` | `character` | `varying(500)` | 关联CR号 |
| `cr_id` | `bigint` | `` | 关联crId |
| `relate_system_id` | `character` | `varying(500)` | 关联系统 |
| `not_find_cause_type` | `character` | `varying(500)` | 测试未发现原因分类 1: 被测功能未覆盖 2: 测试场景设计不充分 3: 测试用例未执行 4: 测试结果验证不充分 5: 测试范围缩减 6: 新增优化需求 7: 其他 |
| `not_find_cause_analyze` | `character` | `varying(2000)` | 测试未发现原因分析 |
| `not_find_root_cause_type` | `character` | `varying(500)` | 测试未发现根问分类 1: 需求缺失 2: 需求变更未告知测试人员 3: 用例编写不规范 4: 业务只是欠缺 5: 测试技能掌握不熟练 6: 人为疏忽 7: 其他 |
| `not_find_root_cause_analyze` | `character` | `varying(2000)` | 测试未发现根因分析 |
| `note1` | `character` | `varying(500)` | 补充说明1 |
| `note2` | `character` | `varying(500)` | 补充说明2 |
| `event_code` | `character` | `varying(500)` | 类似生产问题编号 |
| `improvement_measure` | `character` | `varying(500)` | 测试是否改进措施 1: 是 2: 否 |
| `improvement_measure_user_id` | `bigint` | `` | 改进措施责任人 |
| `improvement_measure_desc` | `character` | `varying(1000)` | 改进措施描述 |
| `measure_start_time` | `timestamp` | `without time zone` | 措施实施开始时间 |
| `measure_end_time` | `timestamp` | `without time zone` | 措施实施结束时间 |
| `review_status` | `integer` | `` | 初审状态 1-待评审 2-拒绝 3-通过 |
| `review_option` | `character` | `varying(500)` | 初审意见 |
| `group_info` | `character` | `varying(100)` | 组长组别名称信息 |


## Table: `question_case_relation`

**表注释**: 评审问题案例关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `question_id` | `character` | `varying(32)` | 评审问题id |
| `case_id` | `character` | `varying(32)` | 案例id |
| `case_status` | `character` | `varying(64)` | 案例整改状态： 增补，修改，未整改 |


## Table: `question_risk_relation`

**表注释**: 评审问题风险关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `question_id` | `character` | `varying(64)` | 评审问题id |
| `risk_id` | `character` | `varying(64)` | 风险id |
| `risk_status` | `character` | `varying(32)` | 风险整改状态 |


## Table: `report_info`

**表注释**: 测试报告


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `report_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(32)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(32)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_falg` | `character(1)` | `` | 删除状态 0:正常 1:删除 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `report_tile` | `character` | `varying(255)` | 报告标题 |
| `report_code` | `character` | `varying(255)` | 报告编号-预留 |
| `report_version` | `character` | `varying(255)` | 报告版本 |
| `cr_id` | `bigint` | `` | crid |
| `stage_type` | `character` | `varying(255)` | 所属阶段比如SIT UAT |
| `stage_activity_type` | `integer` | `` | 所属活动 |
| `report_source` | `integer` | `` | 0线上编写，1线下导入 |
| `upload_reason` | `character` | `varying(2048)` | 上传附件原因 |
| `report_impl_id` | `bigint` | `` | 实施人id |
| `report_create_id` | `bigint` | `` | 创建人id |
| `report_status` | `integer` | `` | 报告状态 |
| `review_status` | `integer` | `` | 评审状态 |
| `test_start_time` | `timestamp` | `without time zone` | 测试开始时间 |
| `test_end_time` | `timestamp` | `without time zone` | 测试结束时间 |
| `test_summary` | `character` | `varying(2000)` | 测试概述 |
| `test_conclusion` | `character` | `varying(2000)` | 测试结论 |
| `test_result_sug` | `character` | `varying(1000)` | 测试情况总结建议-SIT |
| `test_result_summary` | `character` | `varying(1000)` | 测试情况总结描述-SIT |
| `test_result` | `character` | `varying(1000)` | 测试情况总结-UAT |
| `valid_result` | `character` | `varying(1000)` | 测试校验结论-json |
| `report_valid_result` | `character` | `varying(255)` |  |
| `micro_flag` | `integer` | `` | 微需求标识，0：不是，1：微需求 |
| `uncompleted_test_case` | `character` | `varying(1000)` | 未完成测试案例情况 |
| `unresolved_defect` | `text` | `` | 未解决缺陷分析 |
| `report_file` | `character` | `varying(255)` | 报告文件 |
| `report_name` | `character` | `varying(255)` | 报告文件名 |
| `mcr_defect` | `character` | `varying(1000)` | 微需求缺陷 |
| `review_person` | `character` | `varying(255)` | 评审人 |
| `uat_no_check_flag` | `integer` | `DEFAULT 0` | uat不校验标识； 1：不校验，0：需要校验（默认） |
| `mcr_tester` | `character` | `varying(255)` | 微需求测试人 |
| `mcr_reviewer` | `character` | `varying(255)` | 微需求审核人 |


## Table: `production_event`

**表注释**: 生产事件表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `event_code` | `character` | `varying(500)` | 事件编号 |
| `event_title` | `character` | `varying(500)` | 事件简描 |
| `event_dept` | `character` | `varying(500)` | 申请机构 |
| `event_level` | `character` | `varying(500)` | 事件等级 一般处理,优先处理,p0,p1,p2,p3,p4 |
| `event_type` | `character` | `varying(500)` | 事件类型 1: 系统操作 2: 系统缺陷 3: 财务信息查询 4: 咨询服务 5: 应用系统缺陷类问题 6: 用户体验类问题 7: 运行环境类问题 8: 其他类问题 9: 需求缺陷类问题 10: 客户体验类 11: 系统功能类 12: 业务流程类 13: 制度类 14: 风险类 15: 硬件类问题 16: 网络类问题 17: 应用系统问题 18: 操作系统问题 19: 中间件问题 20: 数据库问题 21: 操作类问题 22: 变更问题 23:外联问题 24: 其他问题 25: 数据类问题 26: 安全类问题 |
| `event_system_id` | `character` | `varying(500)` | 所属系统 |
| `status` | `integer` | `` | 状态(流转) 1: 未分析 2: 待分配 3: 待分析 4: 初审 5: 待审核 6: 审核通过 7: 已结束 8: 初审(部分退回) |
| `event_details` | `text` | `` | 事件详述 |
| `event_cause` | `text` | `` | 事件原因 |
| `event_solution` | `text` | `` | 事件解决方案 |
| `issue_apply_time` | `timestamp` | `without time zone` | 问题申请时间 |
| `status_update_time` | `timestamp` | `without time zone` | 状态更新时间 |
| `source` | `integer` | `` | 来源 1: 手工创建 2: 模板导入 3: itil同步 |
| `audit_opinion` | `character` | `varying(500)` | 审核意见 |
| `event_receive_user` | `text` | `` | 接收人 |
| `event_status` | `integer` | `` | 事件状态 1: 待确认 2: 已关闭 3: 主办部门处理中 4: 总行服务台审核 5: 总行服务台受理 6: 处理中 7: 已退回 |
| `typical` | `integer` | `DEFAULT 2` | 是否为典型 1: 是 2: 否 |
| `remark` | `character` | `varying(500)` | 备注 |


## Table: `report_other`

**表注释**: 测试报告-其他信息


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `report_id` | `bigint` | `` | 主键id |
| `create_by` | `character` | `varying(32)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(32)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `report_code` | `character` | `varying(255)` | 报告编号-预留 |
| `stage_type` | `character` | `varying(255)` | 所属阶段比如SIT UAT |
| `no_finish_reason` | `character` | `varying(1000)` | 未完成原因 |
| `no_finish_sug` | `character` | `varying(1000)` | 未完成建议 |
| `no_finish_note` | `character` | `varying(1000)` | 未完成备注 |
| `issues_code` | `character` | `varying(25)` | 缺陷号 |
| `issues_id` | `bigint` | `` | 缺陷id |
| `issues_name` | `character` | `varying(50)` | 缺陷名称 |
| `issues_priority` | `character` | `varying(255)` | 缺陷重要度 |
| `issues_reason` | `character` | `varying(1000)` | 缺陷原因 |
| `issues_impact` | `character` | `varying(1000)` | 缺陷影响 |
| `issues_plan` | `character` | `varying(1000)` | 缺陷后续方案 |
| `issues_distribution` | `character` | `varying(1000)` | 缺陷分布-UAT |
| `issues_severity` | `character` | `varying(1000)` | 缺陷级别-UAT |
| `issues_risk` | `character` | `varying(1000)` | 缺陷风险-UAT |


## Table: `report_user_relation`

**表注释**: 测试报告-执行人关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `report_id` | `bigint` | `` | 报告id |
| `user_id` | `bigint` | `` | 用户id |
| `user_type` | `integer` | `` | 1代表执行人 |
| `user_name` | `character` | `varying(50)` | 用户名 |


## Table: `review_case_relation`

**表注释**: 评审与用例关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `review_id` | `bigint` | `` | 评审id |
| `case_id` | `character` | `varying` | 用例id |
| `case_order` | `integer` | `` | 用例排序标识-预留字段 |
| `review_status` | `integer` | `` | 预留字段 |
| `change_type` | `integer` | `` | 变更类型 0:增补 1:修改 2:删除 |
| `change_reason` | `integer` | `` | 变更原因 0:需求变更 1:补充测试 |
| `case_warehousing_modify_flag` | `integer` | `` | 案例入库标记原因是否更改 0或null：未更改 1：已更改 |


## Table: `review_config`

**表注释**: 评审配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | id |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `config_name` | `character` | `varying(64)` | 评审流程名称 |
| `stage_type` | `character` | `varying` | 测试阶段 0:sit 1:uat |
| `review_type` | `integer` | `` | 评审类型 0:用例评审 1:报告评审 |
| `config_desc` | `character` | `varying(255)` | 评审流程描述 |
| `review_scope` | `character` | `varying(1000)` | 流程配置范围 testManagerId:测试经理, crProposerId:CR提出人, crPerinchargeId:CR负责人, testContactId:测试联系人, crReviewId:需求评审责任人, crSystemIds:系统负责人, reviewCreator:评审发起人, sitExecId:sit实施经理, uatExecId:uat实施经理 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `review_scope_class` | `character` | `varying(255)` | 流程配置所属的class |
| `counter_sign` | `character(1)` | `` | 会签 0：false 1：true |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `review_info`

**表注释**: 评审表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | id |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `review_name` | `character` | `varying(255)` | 评审名称 |
| `review_code` | `character` | `varying(64)` | 评审编码 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |
| `review_method` | `character(1)` | `` | 评审方式 0:正式评审 1:非正式评审 |
| `start_time` | `timestamp` | `without time zone` | 开始时间 |
| `end_time` | `timestamp` | `without time zone` | 截止时间 |
| `cr_id` | `bigint` | `` | crId |
| `stage_type` | `character` | `varying(255)` | 测试阶段  sit,uat |
| `stage_activity_type` | `integer` | `` | 活动类型：同数据字典 |
| `review_process_id` | `bigint` | `` | 评审流程id |
| `report_id` | `bigint` | `` | 报告id |
| `task_desc` | `character` | `varying(600)` | 任务描述 |
| `review_type` | `character(1)` | `` | 评审类型 0:用例评审 1:报告评审 |
| `create_user_id` | `bigint` | `` | 创建评审人员id |
| `review_status` | `character` | `varying(64)` | 评审状态  -1:已撤回  0:未评审 1:评审中 2:评审通过 3:评审未通过 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `actual_start_time` | `timestamp(6)` | `without time zone` | 实际开始时间 |
| `actual_end_time` | `timestamp(6)` | `without time zone` | 实际结束时间 |
| `review_file` | `character` | `varying(1000)` | 评审附件路径 |
| `review_version` | `character` | `varying(10)` | 评审版本号 |


## Table: `review_report_relation`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `review_id` | `bigint` | `` |  |
| `report_id` | `character` | `varying` |  |
| `report_order` | `integer` | `` |  |
| `review_status` | `integer` | `` |  |


## Table: `review_user_relation`

**表注释**: 评审执行人关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `review_id` | `bigint` | `NOT NULL` | 评审表id |
| `user_id` | `bigint` | `NOT NULL` | 评审执行人userId |
| `review_status` | `character` | `varying(64) DEFAULT '0'::bpchar` | 评审状态 0:未评审 1:评审中 2:评审通过 3:评审未通过 |
| `review_reason` | `character` | `varying(255)` | 评审原因 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `relation_id` | `bigint` | `` | 关系表id |


## Table: `risk_case_relation`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键 |
| `risk_id` | `character` | `varying(50)` | 风险id |
| `case_id` | `character` | `varying(50)` | 案例id |
| `create_time` | `timestamp(6)` | `without time zone` | 创建时间 |
| `update_time` | `timestamp(6)` | `without time zone` | 更新时间 |
| `is_library_case` | `tinyint` | `` | 是否来源于案例库 |
| `case_code` | `character` | `varying(100)` | 案例编号 |


## Table: `risk_factor_config`

**表注释**: 风险因子表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `risk_factor_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目组id |
| `risk_factor` | `character` | `varying(500)` | 风险因子 |
| `score_two_min` | `integer` | `` | 代表赋分2的最小值 |
| `score_two_max` | `integer` | `` | 代表赋分2的最大值 |
| `expand_score_two_min` | `integer` | `` | 代表赋分2的最小值（用于判断扩展区间使用） |
| `expand_score_two_max` | `integer` | `` | 代表赋分2的最大值（用于判断扩展区间使用） |


## Table: `risk_issue_relation`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `risk_id` | `character` | `varying(50)` |  |
| `issue_id` | `character` | `varying(50)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `issue_no` | `character` | `varying(100)` | 缺陷编号 |
| `is_library_risk` | `character` | `varying(5) DEFAULT 2` | 是否来自资产库风险：1-是，2-不是 |


## Table: `risk_level_config`

**表注释**: 风险等级表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `risk_level_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目组id |
| `high_risk_max` | `integer` | `` | 高风险最大值 |
| `high_risk_min` | `integer` | `` | 高风险最小值 |
| `medium_risk_max` | `integer` | `` | 中风险最大值 |
| `medium_risk_min` | `integer` | `` | 中风险最小值 |
| `low_risk_max` | `integer` | `` | 低风险最大值 |
| `low_risk_min` | `integer` | `` | 低风险最小值 |


## Table: `status_transfer`

**表注释**: 缺陷状态流转表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(32)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(32)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `start_status_id` | `bigint` | `` | 状态开始Id |
| `end_status_id` | `bigint` | `` | 状态结束Id |
| `step_name` | `character` | `varying(255)` | 步骤名称 |
| `step_sort` | `integer` | `` | 步骤排序 |
| `receiver_type` | `integer` | `` | 1角色，2指定字段 3用户ids |
| `receiver_roles` | `character` | `varying(1000)` | 角色ids |
| `receiver_ids` | `character` | `varying(1000)` | 字段名字 |
| `receiver_fields` | `character` | `varying(1000)` | 用户ids |
| `template_id` | `bigint` | `` | 流程id |
| `editable_fields` | `character` | `varying(500)` | 可编辑的字段信息 |


## Table: `status_transfer_display_fields`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(32)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(32)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `transfer_id` | `bigint` | `` | 流转id |
| `field_id` | `bigint` | `` | 字段id |
| `field_display` | `tinyint` | `` | 显示方式; 1: 显示只读,0: 不显示 |
| `field_position` | `integer` | `` | 排序 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `status_transfer_fields`

**表注释**: 缺陷状态流转表-字段


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(32)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(32)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `transfer_id` | `bigint` | `` | 流转id |
| `field_id` | `bigint` | `` | 字段id |
| `field_required` | `tinyint` | `` | 是否必填 |
| `field_position` | `integer` | `` | 排序 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `story_cr_allplan`

**表注释**: CR的整体计划表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | CR的整体计划主键ID |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `cr_id` | `bigint` | `NOT NULL` | crId |
| `overall_plan` | `character` | `varying(30)` | 整体计划标识 |
| `devepol_stage_start_time` | `timestamp` | `without time zone` | 开发阶段计划开始时间 |
| `devepol_stage_end_time` | `timestamp` | `without time zone` | 开发阶段计划结束时间 |
| `vp_cr_id` | `bigint` | `` | vp的crId |
| `project_id` | `bigint` | `` | 项目组id |
| `enterprise_id` | `bigint` | `` | 企业id |


## Table: `story_cr_evaluation_issue`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cr_id` | `bigint` | `NOT NULL` | crId |
| `parent_issue_id` | `character` | `varying(100)` | 原缺陷id |
| `issue_id` | `character` | `varying(100)` | 质量问题id |
| `create_by` | `character` | `varying(100)` |  |
| `update_by` | `character` | `varying(100)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |


## Table: `story_cr_follow`

**表注释**: 用户和cr关注表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cr_id` | `bigint` | `` | crId |
| `user_id` | `bigint` | `` | 系统id |
| `cr_type` | `integer` | `` | CR类型  0:cr  1:（非cr）工单 |


## Table: `story_cr_interface`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `interface_id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(50)` |  |
| `update_by` | `character` | `varying(50)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `cr_id` | `bigint` | `` |  |
| `mind_id` | `bigint` | `` | 脑图id |
| `stage_id` | `bigint` | `` | 阶段id |
| `stage_type` | `character` | `varying(100)` | 阶段类型：SIT,UAT |
| `dir_id` | `character` | `varying(64)` | 节点id |
| `interface_name` | `character` | `varying(1000)` | 接口名称 |
| `parent_node_match_system` | `smallint` | `` | 父节点是否是一二级模块 |
| `system_id` | `bigint` | `` | 系统id |
| `first_module_id` | `bigint` | `` | 一级模块id |
| `second_module_id` | `bigint` | `` | 二级模块id |
| `case_total` | `integer` | `` | 测试需求点总数 |
| `manual_count` | `integer` | `` | 手工添加需求点数 |
| `adopt_count` | `integer` | `` | 采纳的测试需求点数 |
| `del_flag` | `character(1)` | `` | 删除类型： 0-正常，1-删除 |
| `interface_text` | `text` | `` | 接口信息文本 |


## Table: `story_cr_key_project_config`

**表注释**: 重点项目配置


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `key_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 删除标识 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `key_name` | `character` | `varying(100)` | 名称 |
| `key_content` | `character` | `varying(1000)` | 内容 |
| `cr_id` | `bigint` | `` |  |
| `process_code` | `character` | `varying(100)` |  |
| `process_id` | `bigint` | `` |  |


## Table: `story_cr_manage_process`

**表注释**: CR的管理流程


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | CR的管理流程主键ID |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `cr_id` | `bigint` | `NOT NULL` | crId |
| `process_id` | `character` | `varying(20)` | 流程id |
| `process_name` | `character` | `varying(50)` | 流程名称 |
| `start_time` | `timestamp` | `without time zone` | 开始时间 |
| `end_time` | `timestamp` | `without time zone` | 结束时间 |
| `is_complete` | `character` | `varying(10)` | 是否完成 |
| `assignee` | `character` | `varying(100)` | 处理人 |
| `vp_cr_id` | `bigint` | `` | vp的crId |


## Table: `story_cr_milepost`

**表注释**: CR的里程碑表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | CR的里程碑表主键ID |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `cr_id` | `bigint` | `NOT NULL` | crId |
| `milepost_name` | `character` | `varying(255)` | 里程碑名称 |
| `deliverables` | `character` | `varying(255)` | 交付物 |
| `milepost_time_start` | `timestamp` | `without time zone` | 里程碑开始时间 |
| `milepost_time` | `timestamp` | `without time zone` | 里程碑时间点 |
| `milepost_duration` | `character` | `varying(255)` | 工期 |
| `early_warning_time` | `timestamp` | `without time zone` | 预警时间 |
| `remark` | `character` | `varying(255)` | 备注 |
| `milepost_type` | `character` | `varying(20)` | 里程碑类型 |
| `rank_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 里程碑级别 0：cr级里程碑 ； 1：系统级里程碑 |
| `system_id` | `bigint` | `` | 系统id |
| `vp_cr_id` | `bigint` | `` | vp的crId |


## Table: `story_cr_mind`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `mind_id` | `bigint` | `NOT NULL` | 脑图id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 删除标识 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `cr_id` | `bigint` | `` | crid |
| `stage_type` | `character` | `varying(50)` | 阶段标识 |
| `mind_content` | `text` | `` | 脑图内容 |
| `mind_title` | `character` | `varying(500)` | 脑图标题 |
| `description` | `character` | `varying(100)` | 脑图描述 |


## Table: `story_cr_stage`

**表注释**: CR-阶段


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(20)` | 用例创建人 |
| `update_by` | `character` | `varying(1000)` | 用例修改人 |
| `create_time` | `timestamp` | `without time zone` | 记录创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `del_flag` | `integer` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `process_id` | `bigint` | `` | 流程id |
| `cr_id` | `bigint` | `` | crId |
| `stage_id` | `bigint` | `` | 阶段id |
| `stage_type` | `character` | `varying(255)` | 阶段类型：SIT,UAT |
| `test_environment` | `character` | `varying(1000)` | 测试环境 |
| `environment_require` | `character` | `varying(1000)` | 环境要求 |
| `cut_reason` | `character` | `varying(512)` | 裁剪原因 |
| `circuit_start_time` | `timestamp` | `without time zone` | 线路图开始时间 |
| `circuit_end_time` | `timestamp` | `without time zone` | 线路图结束时间 |
| `exec_id` | `bigint` | `` | 实施经理-人员ID |
| `stage_status` | `integer` | `` | 阶段状态 0:未开始 1:进行中 2:已完成 |


## Table: `story_cr_stage_activity`

**表注释**: CR-阶段下的活动


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(20)` | 用例创建人 |
| `update_by` | `character` | `varying(1000)` | 用例修改人 |
| `create_time` | `timestamp` | `without time zone` | 记录创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `del_flag` | `integer` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `process_id` | `bigint` | `` | 流程id |
| `cr_id` | `bigint` | `` | crId |
| `stage_id` | `bigint` | `` | 阶段id |
| `stage_type` | `character` | `varying(255)` | 阶段类型：SIT,UAT |
| `circuit_start_time` | `timestamp` | `without time zone` | 线路图开始时间 |
| `circuit_end_time` | `timestamp` | `without time zone` | 线路图结束时间 |
| `exec_id` | `bigint` | `` |  |
| `activity_status` | `integer` | `` | 活动状态 0:未开始 1:进行中 2:已完成 |
| `activity_type` | `integer` | `` | 活动类型-取数据字典 |


## Table: `story_cr_system_relation`

**表注释**: cr关联系统


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cr_id` | `bigint` | `` |  |
| `system_id` | `bigint` | `` |  |
| `vp_flag` | `character(1)` | `` |  |
| `vp_cr_id` | `bigint` | `` |  |
| `relation_system_type` | `integer` | `` | 0:工作量系统，1：配合系统 |
| `create_by` | `character` | `varying(64)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |


## Table: `story_cr_requirement`

**表注释**: 测试需求点表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `requirement_id` | `bigint` | `NOT NULL` | 需求点id |
| `create_by` | `character` | `varying(50)` | 创建人 |
| `update_by` | `character` | `varying(50)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 删除标识 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `cr_id` | `bigint` | `` | crid |
| `mind_id` | `bigint` | `` | 脑图id |
| `stage_id` | `bigint` | `` | 阶段id |
| `stage_type` | `character` | `varying(100)` | 阶段类型 |
| `dir_id` | `bigint` | `` | 目录id |
| `requirement_name` | `character` | `varying(1000)` | 需求点名称 |
| `requirement_code` | `character` | `varying(255)` | 需求点编号 |
| `requirement_desc` | `character` | `varying(255)` | 需求点描述 |
| `parent_node_match_system` | `smallint` | `` | 父节点是否是系统的模块 |
| `system_id` | `bigint` | `` | 系统id |
| `first_module_id` | `bigint` | `` | 一级模块Id |
| `second_module_id` | `bigint` | `` | 二级模块Id |
| `interface_id` | `bigint` | `` | 接口id |
| `source_type` | `character` | `varying(5)` | 测试需求点来源：1、大模型 2、风险引入 3、手动引入 |
| `requirement_node` | `character` | `varying(256)` | 测试需求点类型 |
| `is_support_ai` | `character` | `varying(5)` | 是否支持AI设计：1-支持，2-不支持 |
| `node_id` | `character` | `varying(64)` | 脑图中的节点ID |
| `priority` | `integer` | `` |  |
| `origin_test_point_info` | `character` | `varying(1000)` | 生成的测试需求点源数据 |
| `adopt_type` | `character` | `varying(5)` | 采纳类型，1-完全采纳 2-部分采纳 |
| `adopt_notes` | `character` | `varying(1000)` | 采纳备注 |


## Table: `story_cr_system_relation_2`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `cr_id` | `bigint` | `` |  |
| `system_id` | `bigint` | `` |  |
| `vp_flag` | `character(1)` | `` |  |
| `vp_cr_id` | `bigint` | `` |  |
| `relation_system_type` | `integer` | `` |  |


## Table: `sys_calendar`

**表注释**: 日历管理表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `calendar_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `year` | `integer` | `` | 所属年份 |
| `date_config` | `timestamp` | `without time zone` | 日期配置 |
| `config_type` | `character` | `varying(64)` | 配置类型	holiday: 节假日	workday: 必要工作日 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 删除状态 0:正常 1:删除 |


## Table: `sys_checks_config`

**表注释**: 系统检查项


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `config_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |
| `checks_type` | `character` | `varying(100)` | 案例设计:case_design，案例评审:case_review，案例执行:case_execute，缺陷:defect，风险:risk，生产问题:product_issue |
| `checks_description` | `character` | `varying(2000)` | 检核项描述 |
| `checks_domain` | `character` | `varying(100)` | 测试需求点:test_requirement_point， 测试案例:test_case，案例评审:case_review，案例执行:case_execute，缺陷:defect，风险:risk，生产问题:production_issue |
| `checks_status` | `integer` | `` | 状态 0:停用	1:启动 |
| `checks_field_content` | `character` | `varying(50000)` | 检核对象字段 |
| `checks_condition_content` | `character` | `varying(5000)` | 触发条件 |
| `checks_test_stage` | `character` | `varying(10)` | 测试阶段 SIT UAT |


## Table: `sys_dept`

**表注释**: 部门管理


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `dept_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `dept_name` | `character` | `varying(255) DEFAULT NULL::character varying` | 部门名称 |
| `sort_order` | `integer` | `DEFAULT 0 NOT NULL` | 排序 |
| `parent_id` | `bigint` | `` | 父企业id |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `org_code` | `character` | `varying(255)` | 机构编码 |
| `org_type` | `character` | `varying(20)` | 机构类型 |
| `full_path_name` | `character` | `varying(255)` | 全路径 |
| `parent_code` | `character` | `varying(255)` | 父机构编码 |
| `org_code_dept` | `character` | `varying(255)` | 部门 |
| `org_code_room` | `character` | `varying(255)` | 科室 |


## Table: `sys_dept_relation`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `ancestor` | `bigint` | `NOT NULL` |  |
| `descendant` | `bigint` | `NOT NULL` |  |


## Table: `sys_dict`

**表注释**: 字典表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `dict_key` | `character` | `varying(100) DEFAULT NULL::character varying` | 标识 |
| `description` | `character` | `varying(100) DEFAULT NULL::character varying` | 描述 |
| `remark` | `character` | `varying(255) DEFAULT NULL::character varying` | 备注 |
| `system_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 是否是系统内置 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |


## Table: `sys_dict_item`

**表注释**: 字典项


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `dict_id` | `bigint` | `NOT NULL` | 字典ID |
| `dict_key` | `character` | `varying(100) DEFAULT NULL::character varying` | 字典标识 |
| `value` | `character` | `varying(100) DEFAULT NULL::character varying` | 值 |
| `label` | `character` | `varying(100) DEFAULT NULL::character varying` | 标签 |
| `type` | `character` | `varying(100) DEFAULT NULL::character varying` | 字典类型 |
| `description` | `character` | `varying(100) DEFAULT NULL::character varying` | 描述 |
| `sort_order` | `integer` | `DEFAULT 0 NOT NULL` | 排序（升序） |
| `remark` | `character` | `varying(255) DEFAULT ' '::character varying` | 备注 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `icon` | `character` | `varying(255)` |  |
| `color` | `character` | `varying(255)` |  |


## Table: `sys_download`

**表注释**: 下载中心表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `file_id` | `bigint` | `NOT NULL` | 文件id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `creator_id` | `bigint` | `` | 创建人id |
| `file_type` | `character` | `varying(100)` | 文件类型:案例导出case	测试证迹导出test_evidence	测试报告导出test_report	自定义报表导出custom_report |
| `file_name` | `character` | `varying(1000)` | 文件名称 |
| `original` | `character` | `varying(255)` | 原文件名称 |
| `file_url` | `character` | `varying(2000)` | 文件路径 |
| `status` | `character(1)` | `` | 状态 0-开始 1-进行中 2-已完成 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_enterprise`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `enterprise_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建人 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `enterprise_code` | `character` | `varying(64) DEFAULT NULL::character varying` | 企业编号 |
| `enterprise_name` | `character` | `varying(128) DEFAULT NULL::character varying` | 企业名称 |
| `enterprise_logo` | `character` | `varying(128) DEFAULT NULL::character varying` | 企业LOGO |
| `enterprise_desc` | `character` | `varying(512) DEFAULT NULL::character varying` | 企业描述 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 删除标记，0-正常，1-删除 |


## Table: `sys_file`

**表注释**: 文件管理表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `file_id` | `bigint` | `NOT NULL` | 主键 |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `file_name` | `character` | `varying(100)` | 文件名称 |
| `bucket_name` | `character` | `varying(200)` | bucket名称 |
| `original` | `character` | `varying(1000)` | 原文件名 |
| `file_type` | `character` | `varying(200)` | 文件类型 |
| `file_size` | `bigint` | `` | 文件大小 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `file_data_id` | `character` | `varying(255)` | 文件所属数据的领域对象ID |
| `file_data_class` | `character` | `varying(255)` | 文件所属领域的领域对类 |
| `file_md5` | `character` | `varying(255)` | 文件md5 |
| `file_upload_id` | `bigint` | `` | 文件上传人id |
| `file_save_path` | `character` | `varying(255)` | 文件存储路径 |
| `file_tag` | `character` | `varying(255)` | 文件标记，eg:tmp,attachment |


## Table: `sys_homepage_notice_config`

**表注释**: 首页提示配置


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `config_id` | `bigint` | `NOT NULL` | 配置id-主键 |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `config_title` | `character` | `varying(768)` | 标题 |
| `config_content` | `text` | `` | 内容 |
| `config_time` | `timestamp` | `without time zone` | 配置时间 |
| `config_status` | `numeric(2` | `` | 配置状态   0：未发布，1：发布中 |
| `ignore_users` | `text` | `` | 不弹窗的用户ids |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_log`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 参加时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `log_type` | `character(1)` | `` | 日志类型 |
| `title` | `character` | `varying(255)` | 日志标题 |
| `service_id` | `character` | `varying(100)` | 服务ID |
| `remote_addr` | `character` | `varying(255)` | 操作IP地址 |
| `user_agent` | `character` | `varying(1000)` | 用户代理 |
| `request_uri` | `character` | `varying(255)` | 请求URI |
| `method` | `character` | `varying(10)` | 请求方法 |
| `params` | `text` | `` | 操作提交的参数 |
| `del_flag` | `character(1)` | `` | 删除标记 |
| `exception` | `text` | `` | 异常信息 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_menu`

**表注释**: 菜单节点表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `menu_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `parent_id` | `bigint` | `` | 父菜单ID |
| `menu_name` | `character` | `varying(100) NOT NULL` | 菜单名称 |
| `title` | `character` | `varying(50) DEFAULT ''::character varying NOT NULL` | 菜单标题 |
| `icon` | `character` | `varying(300) DEFAULT ''::character varying NOT NULL` | 图标 |
| `condition` | `character` | `varying(255) DEFAULT ''::character varying NOT NULL` | 条件 |
| `remark` | `character` | `varying(255) DEFAULT ''::character varying NOT NULL` | 备注 |
| `menu_type` | `tinyint` | `DEFAULT 0 NOT NULL` | 类型 0目录 1菜单 2按钮 |
| `weigh` | `smallint` | `DEFAULT 0 NOT NULL` | 权重 |
| `is_hide` | `tinyint` | `DEFAULT 0 NOT NULL` | 显示状态 |
| `path` | `character` | `varying(100) DEFAULT ''::character varying NOT NULL` | 路由地址 |
| `permission` | `character` | `varying(255) DEFAULT NULL::character varying` | 菜单权限标识 |
| `component` | `character` | `varying(100) DEFAULT ''::character varying NOT NULL` | 组件路径 |
| `module_type` | `character` | `varying(30) DEFAULT ''::character varying NOT NULL` | 所属模块 |
| `model_id` | `integer` | `DEFAULT 0 NOT NULL` | 模型ID |
| `redirect` | `character` | `varying(255) DEFAULT ''::character varying NOT NULL` | 路由重定向地址 |
| `is_cached` | `tinyint` | `DEFAULT 0 NOT NULL` | 是否缓存 |
| `is_affix` | `tinyint` | `DEFAULT 0 NOT NULL` | 是否固定 |
| `is_iframe` | `tinyint` | `DEFAULT 0 NOT NULL` | 是否内嵌iframe |
| `is_link` | `tinyint` | `DEFAULT 0 NOT NULL` | 是否外链 1是 0否 |
| `link_url` | `character` | `varying(500) DEFAULT ''::character varying NOT NULL` | 链接地址 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `menu_sort` | `integer` | `DEFAULT 0` | 菜单排序 |


## Table: `sys_menu_old`

**表注释**: 菜单表（旧数据）


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `menu_id` | `bigint` | `NOT NULL` |  |
| `name` | `character` | `varying(32) NOT NULL` | 菜单名称 |
| `permission` | `character` | `varying(32) DEFAULT NULL::character varying` | 菜单权限标识 |
| `path` | `character` | `varying(128) DEFAULT NULL::character varying` | 前端URL |
| `parent_id` | `bigint` | `` | 父菜单ID |
| `icon` | `character` | `varying(32) DEFAULT NULL::character varying` | 图标 |
| `sort_order` | `integer` | `DEFAULT 0 NOT NULL` | 排序值 |
| `keep_alive` | `character(1)` | `DEFAULT '0'::bpchar` | 0-开启，1- 关闭 |
| `type` | `character(1)` | `DEFAULT NULL::bpchar` | 菜单类型 （0菜单 1按钮） |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 逻辑删除标记(0--正常 1--删除) |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 修改人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间1111 |


## Table: `sys_message`

**表注释**: 系统消息表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `message_id` | `bigint` | `NOT NULL` | 消息id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `title` | `character` | `varying(150)` | 标题 |
| `content` | `character` | `varying(5000)` | 内容 |
| `sender` | `bigint` | `` | 发送人 |
| `recipient` | `bigint` | `` | 接收人 |
| `read_flag` | `character(1)` | `` | 是否已读（Y：已读 N：未读） |
| `message_type` | `character(1)` | `` | 消息类型（0：通知 1：提醒） |
| `message_source` | `character` | `varying(50)` | 消息来源 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_message_item`

**表注释**: 消息事项表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `item_id` | `bigint` | `NOT NULL` | 事项id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间（编辑时间） |
| `update_user_name` | `character` | `varying(64)` | 编辑人姓名 |
| `item_name` | `character` | `varying(50)` | 事项名称 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_message_notice`

**表注释**: 消息通知表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `notice_id` | `bigint` | `NOT NULL` | 通知id |
| `item_id` | `bigint` | `` | 事项id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `notice_name` | `character` | `varying(150)` | 通知名称 |
| `notice_way` | `character` | `varying(10)` | 通知方式（0：站内信 1：企业微信） |
| `open_flag` | `character(1)` | `` | 是否开启（Y：开启 N：关闭） |
| `notice_type` | `character(1)` | `` | 通知类型（0：操作通知 1：属性通知） |
| `item` | `character` | `varying(500)` | 事项（操作或属性） |
| `ttrigger_conditions` | `character` | `varying(500)` | 触发条件 |
| `notice_role` | `character` | `varying(500)` | 通知对象（角色） |
| `notice_attribute` | `character` | `varying(500)` | 通知对象（属性） |
| `notice_member` | `character` | `varying(500)` | 通知对象（成员） |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_message_remind`

**表注释**: 消息提醒表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `remind_id` | `bigint` | `NOT NULL` | 提醒id |
| `item_id` | `bigint` | `` | 事项id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `date_attribute` | `character` | `varying(50)` | 时间属性 |
| `remind_node` | `character` | `varying(150)` | 提醒节点 |
| `remind_way` | `character` | `varying(10)` | 提醒方式（0：站内信 1：企业微信） |
| `open_flag` | `character(1)` | `` | 是否开启（Y：开启 N：关闭） |
| `ttrigger_conditions` | `character` | `varying(500)` | 触发条件 |
| `remind_role` | `character` | `varying(500)` | 提醒对象（角色） |
| `remind_attribute` | `character` | `varying(500)` | 提醒对象（属性） |
| `remind_member` | `character` | `varying(500)` | 提醒对象（成员） |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_module`

**表注释**: 模块表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `module_id` | `bigint` | `NOT NULL` | 模块id |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `module_code` | `character` | `varying(100)` | 模块编码 |
| `module_name` | `character` | `varying(255) NOT NULL` | 模块名称 |
| `parent_id` | `bigint` | `NOT NULL` | 父模块id |
| `system_id` | `bigint` | `NOT NULL` | 系统id |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `module_sort` | `tinyint` | `DEFAULT 0` |  |
| `is_shroud` | `character` | `varying(5) DEFAULT 0` | 是否隐藏：0-不隐藏，1-隐藏 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_module_0905`

**表注释**: 模块表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `module_id` | `bigint` | `NOT NULL` | 模块id |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `module_code` | `character` | `varying(100)` | 模块编码 |
| `module_name` | `character` | `varying(255) NOT NULL` | 模块名称 |
| `parent_id` | `bigint` | `NOT NULL` | 父模块id |
| `system_id` | `bigint` | `NOT NULL` | 系统id |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `module_sort` | `tinyint` | `DEFAULT 0` |  |


## Table: `sys_module_0908`

**表注释**: 模块表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `module_id` | `bigint` | `NOT NULL` | 模块id |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `module_code` | `character` | `varying(100)` | 模块编码 |
| `module_name` | `character` | `varying(255) NOT NULL` | 模块名称 |
| `parent_id` | `bigint` | `NOT NULL` | 父模块id |
| `system_id` | `bigint` | `NOT NULL` | 系统id |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `module_sort` | `tinyint` | `DEFAULT 0` |  |


## Table: `sys_notice`

**表注释**: 系统公告


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `notice_id` | `bigint` | `NOT NULL` | 公告id-主键 |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `notice_title` | `character` | `varying(768)` | 公告标题 |
| `notice_status` | `numeric(2` | `` | 公告状态  0：待发布，1：发布中，2：已撤销 |
| `start_time` | `timestamp` | `without time zone` | 公告生效时间 |
| `end_time` | `timestamp` | `without time zone` | 公告失效时间 |
| `publish_time` | `timestamp` | `without time zone` | 公告发布时间 |
| `notice_content` | `text` | `` | 公告内容 |
| `status_order` | `numeric(2` | `` | 状态排序，发布中>待发布>已撤销 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_oauth_client_details`

**表注释**: 终端信息表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `client_id` | `character` | `varying(32) NOT NULL` | 客户端ID |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新时间 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `resource_ids` | `character` | `varying(256) DEFAULT NULL::character varying` | 资源列表 |
| `client_secret` | `character` | `varying(256) DEFAULT NULL::character varying` | 客户端密钥 |
| `scope` | `character` | `varying(256) DEFAULT NULL::character varying` | 域 |
| `authorized_grant_types` | `character` | `varying(256) DEFAULT NULL::character varying` | 认证类型 |
| `web_server_redirect_uri` | `character` | `varying(256) DEFAULT NULL::character varying` | 重定向地址 |
| `authorities` | `character` | `varying(256) DEFAULT NULL::character varying` | 角色列表 |
| `access_token_validity` | `integer` | `` | token 有效期 |
| `refresh_token_validity` | `integer` | `` | 刷新令牌有效期 |
| `additional_information` | `character` | `varying(4096) DEFAULT NULL::character varying` | 令牌扩展字段JSON |
| `autoapprove` | `character` | `varying(256) DEFAULT NULL::character varying` | 是否自动放行 |


## Table: `test_auto_summary_statistics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `stats_date` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `group_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `case_exec_count` | `integer` | `DEFAULT 0` |  |
| `auto_exec_count` | `integer` | `DEFAULT 0` |  |
| `auto_exec_success_count` | `integer` | `DEFAULT 0` |  |
| `auto_exec_ratio` | `numeric(10` | `` |  |
| `auto_exec_success_ratio` | `numeric(10` | `` |  |
| `cr_case_exec_count` | `integer` | `DEFAULT 0` |  |
| `cr_auto_exec_count` | `integer` | `DEFAULT 0` |  |
| `cr_auto_exec_success_count` | `integer` | `DEFAULT 0` |  |
| `cr_auto_exec_ratio` | `numeric(10` | `` |  |
| `cr_auto_exec_success_ratio` | `numeric(10` | `` |  |
| `back_case_exec_count` | `integer` | `DEFAULT 0` |  |
| `back_auto_exec_count` | `integer` | `DEFAULT 0` |  |
| `back_auto_exec_success_count` | `integer` | `DEFAULT 0` |  |
| `back_auto_exec_ratio` | `numeric(10` | `` |  |
| `back_auto_exec_success_ratio` | `numeric(10` | `` |  |
| `inspection_case_exec_count` | `integer` | `DEFAULT 0` |  |
| `inspection_auto_exec_count` | `integer` | `DEFAULT 0` |  |
| `inspection_auto_exec_success_count` | `integer` | `DEFAULT 0` |  |
| `inspection_auto_exec_ratio` | `numeric(10` | `` |  |
| `inspection_auto_exec_success_ratio` | `numeric(10` | `` |  |
| `library_case_count` | `integer` | `DEFAULT 0` |  |
| `library_auto_exec_case_count` | `integer` | `DEFAULT 0` |  |
| `library_auto_cr_case_reuse_number` | `integer` | `DEFAULT 0` |  |
| `library_auto_exec_ratio` | `numeric(10` | `` |  |
| `library_auto_reuse_ratio` | `numeric(10` | `` |  |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` |  |
| `update_time` | `timestamp` | `without time zone` |  |


## Table: `ai_case_design_data_record`

**表注释**: AI案例设计历史数据记录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(50)` |  |
| `update_by` | `character` | `varying(50)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目组ID |
| `cr_id` | `bigint` | `` | CR-ID |
| `stage_type` | `character` | `varying(100)` | CR名称 |
| `system_id` | `bigint` | `` | 系统id |
| `first_module_id` | `bigint` | `` | 一级模块id |
| `second_module_id` | `bigint` | `` | 二级模块id |
| `case_id` | `character` | `varying(100)` | 案例ID |
| `case_name` | `character` | `varying(500)` | 案例名字 |
| `case_desc` | `character` | `varying(1000)` | 案例描述 |
| `step_id` | `character` | `varying(100)` | 步骤ID |
| `step_desc` | `character` | `varying(2000)` | 步骤描述 |
| `chinese_name` | `character` | `varying(500)` | 字段中文名 |
| `value` | `character` | `varying(2000)` | 字段值 |
| `case_target` | `character` | `varying(100)` | 是否案例关注字段 |
| `mandatory` | `character` | `varying(100)` | 是否必填 |
| `explain` | `character` | `varying(1000)` | 字段解释 |
| `tool_purpose` | `character` | `varying(100)` | 工具标识 |
| `ref` | `character` | `varying(100)` | 是否使用外部工具 |
| `adept_if` | `integer` | `` | 采纳类型， 0-未采纳 1-采纳 |
| `requirement_id` | `bigint` | `` |  |
| `requirement_name` | `character` | `varying(1500)` |  |
| `interface_id` | `bigint` | `` |  |
| `interface_name` | `character` | `varying(500)` |  |
| `prompt_name` | `character` | `varying(250)` |  |
| `stageversion_id` | `bigint` | `` |  |


## Table: `sys_post`

**表注释**: 岗位信息表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `post_id` | `bigint` | `NOT NULL` | 岗位ID |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `create_by` | `character` | `varying(64) DEFAULT ''::character varying` | 创建人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `update_by` | `character` | `varying(64) DEFAULT ''::character varying` | 更新人 |
| `post_code` | `character` | `varying(64) NOT NULL` | 岗位编码 |
| `post_name` | `character` | `varying(50) NOT NULL` | 岗位名称 |
| `post_sort` | `integer` | `NOT NULL` | 岗位排序 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar NOT NULL` | 是否删除  -1：已删除  0：正常 |
| `remark` | `character` | `varying(500) DEFAULT NULL::character varying` | 备注信息 |


## Table: `sys_process`

**表注释**: 流程-作用于cr需求


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `process_name` | `character` | `varying(255)` | 流程名称 |
| `process_code` | `character` | `varying(255)` | 流程编码 |
| `process_desc` | `character` | `varying(255)` | 流程描述 |
| `del_flag` | `integer` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `system_flag` | `character` | `varying DEFAULT '0'::character varying NOT NULL` | 是否是系统自建 0:不是系统自建 1:是系统自建 |


## Table: `sys_process_stage`

**表注释**: 流程下的阶段


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `process_id` | `bigint` | `` | 流程id |
| `stage_name` | `character` | `varying(255)` | 阶段名称 |
| `stage_type` | `character` | `varying(255)` | 阶段编码-取数据字典 |
| `stage_desc` | `character` | `varying(255)` | 阶段描述 |
| `del_flag` | `integer` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `test_environment` | `character` | `varying(255)` | 测试环境 |
| `cr_id` | `bigint` | `` | CRID |
| `exec_id` | `bigint` | `` | 实施经理-人员ID |
| `environment_require` | `character` | `varying(255)` | 环境要求 |
| `circuit_start_time` | `timestamp` | `without time zone` | 线路图开始时间 |
| `circuit_end_time` | `timestamp` | `without time zone` | 线路图结束时间 |
| `stage_status` | `integer` | `DEFAULT 0` | 阶段状态 0:未开始 1:进行中 2:已完成 |
| `cut_reason` | `character` | `varying(255)` | 裁剪原因 |
| `cutout_status` | `boolean` | `` | true支持，false不支持 |


## Table: `sys_process_stage_activity`

**表注释**: 流程下的每个阶段下的活动


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `cr_id` | `bigint` | `` | cr_id |
| `stage_id` | `bigint` | `` | 阶段id |
| `activity_name` | `character` | `varying(255)` | 活动名称 |
| `activity_type` | `integer` | `` | 活动编码-取数据字典 |
| `activity_desc` | `character` | `varying(255)` | 活动描述 |
| `cutout_status` | `boolean` | `` | true支持，false不支持 |
| `activity_status` | `integer` | `DEFAULT 0` | 活动状态 0:未开始 1:进行中 2:已完成 |
| `del_flag` | `integer` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `circuit_start_time` | `timestamp` | `without time zone` | 线路图开始时间 |
| `circuit_end_time` | `timestamp` | `without time zone` | 线路图结束时间 |


## Table: `sys_project`

**表注释**: 项目组基本信息


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `project_id` | `bigint` | `NOT NULL` | 主键id |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `parent_project_id` | `bigint` | `` | 父项目id |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `project_code` | `character` | `varying(64) DEFAULT NULL::character varying` | 项目组编号 |
| `project_name` | `character` | `varying(128) DEFAULT NULL::character varying` | 项目组名称 |
| `project_level` | `integer` | `DEFAULT 0` | 公开范围 0：项目组成员可见；1企业全员可见； |
| `project_logo` | `text` | `` | 项目组logo |
| `project_desc` | `character` | `varying(512) DEFAULT NULL::character varying` | 项目组描述 |
| `default_role_id` | `bigint` | `` | 默认角色id |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `project_manager` | `bigint` | `NOT NULL` | 空间管理员 |
| `project_status` | `integer` | `NOT NULL` | 空间状态 0: 停用 1: 启动 |
| `manager_role_id` | `bigint` | `` | 空间管理员角色 |


## Table: `sys_prompt_relation`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(50)` |  |
| `update_by` | `character` | `varying(50)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `requirement_prompt_id` | `bigint` | `` | 需求点提示词ID |
| `case_prompt_id` | `bigint` | `` | 案例提示词ID |
| `del_flag` | `character(1)` | `` | 删除类型： 0-正常，1-删除 |


## Table: `sys_public_param`

**表注释**: 公共参数配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `public_id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(64) DEFAULT ' '::character varying` | 创建人 |
| `update_by` | `character` | `varying(64) DEFAULT ' '::character varying` | 更新人 |
| `create_time` | `timestamp` | `without time zone DEFAULT pg_systimestamp()` | 创建时间 |
| `update_time` | `timestamp` | `without time zone DEFAULT pg_systimestamp()` | 更新时间 |
| `public_name` | `character` | `varying(128) DEFAULT NULL::character varying` |  |
| `public_key` | `character` | `varying(128) DEFAULT NULL::character varying` |  |
| `public_value` | `character` | `varying(128) DEFAULT NULL::character varying` |  |
| `status` | `character(1)` | `DEFAULT '0'::bpchar` |  |
| `validate_code` | `character` | `varying(64) DEFAULT NULL::character varying` |  |
| `public_type` | `character(1)` | `DEFAULT '0'::bpchar` |  |
| `system_flag` | `character(1)` | `DEFAULT '0'::bpchar` |  |


## Table: `sys_prompt`

**表注释**: AI测试配置提示词表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `create_by` | `character` | `varying(255)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(255)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 2:停用 |
| `prompt_name` | `character` | `varying(255)` | 提示词名称 |
| `prompt_type` | `character` | `varying(255)` | 提示词类型，requirement：测试需求点，case：测试案例，caseData：测试案例数据 |
| `prompt_sort` | `integer` | `` | 排序 |
| `link_knowledge_flag` | `character(1)` | `DEFAULT 0` | 是否连接知识库，0：否  1：是 |
| `effect_flag` | `character(1)` | `DEFAULT 0` | 是否生效 0：不生效 1：生效 |
| `prompt_desc` | `text` | `` | 提示词描述 |
| `priority` | `integer` | `` | 重要性：1-高，2-中，3-低 |
| `knowledge_connect_type` | `integer` | `` | 是否连接知识库：1-是，2-否 |
| `generate_data_instruct` | `text` | `` | 生成数据指令 |
| `generate_case_data` | `text` | `` | 生成测试案例数据 |


## Table: `sys_role_menu_relation_in_project`

**表注释**: 空间内角色菜单关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `role_id` | `bigint` | `NOT NULL` | 角色id |
| `menu_id` | `bigint` | `NOT NULL` | 菜单id |


## Table: `sys_stage_key_project`

**表注释**: 阶段版本重点项目


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `stageversion_id` | `bigint` | `` | 阶段版本Id |
| `vp_stageversion_id` | `bigint` | `` | vp阶段版本Id |
| `stageversion_name` | `character` | `varying(255)` | 阶段版本名称 |
| `project_name` | `character` | `varying(255)` | 项目名称 |
| `project_sort` | `integer` | `` | 项目排序 |
| `cr_id` | `bigint` | `` | CR Id |
| `vp_cr_id` | `bigint` | `` | vp cr id |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `cr_code` | `character` | `varying(255)` | CR编号 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间  |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |


## Table: `sys_stageversion`

**表注释**: 阶段版本


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id  |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间  |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `stageversion_name` | `character` | `varying(255)` | 阶段版本名称 |
| `description` | `character` | `varying(500)` | 描述 |
| `deply_month` | `integer` | `` | 阶段版本月份 |
| `del_flag` | `character(1)` | `` | 删除状态 0:正常 1:删除 |
| `source_from` | `integer` | `` | 数据来源0:在系统创建 1:VP同步 |
| `deply_year` | `integer` | `` | 上线年度 |
| `deploy_time` | `timestamp` | `without time zone` | 上线时间 |
| `baseline_code` | `character` | `varying(32)` | 发版基线号 |
| `baseline_scope` | `character` | `varying(255)` | 发版范围 |
| `chief` | `character` | `varying(32)` | 负责人 |
| `remark` | `character` | `varying(255)` | 备注 |
| `audit_status` | `character(1)` | `` | 审核状态0未审核,1已审核,2审核中,3审核不通过 |
| `crvali_date` | `timestamp` | `without time zone` | 需求审定 |
| `setuppro_date` | `timestamp` | `without time zone` | 要求立项完成时间 |
| `business_date` | `timestamp` | `without time zone` | 要求商务完成时间 |
| `deploy_date` | `timestamp` | `without time zone` | 开发 |
| `sit_date` | `timestamp` | `without time zone` | 要求SIT完成时间 |
| `uat1_date` | `timestamp` | `without time zone` | UAT第一轮开始 |
| `uat2_date` | `timestamp` | `without time zone` | UAT第二轮开始 |
| `show_date` | `timestamp` | `without time zone` | 演练时间开始 |
| `comp_date` | `timestamp` | `without time zone` | 投产时间 |
| `townb_date` | `timestamp` | `without time zone` | 村镇银行 |
| `test_deploy_start_date` | `timestamp` | `without time zone` | 测试部署时间_开始 |
| `test_deploy_end_date` | `timestamp` | `without time zone` | 测试部署时间_结束 |
| `vp_stageversion_id` | `bigint` | `` | vp的阶段版本Id |


## Table: `sys_stageversion_config`

**表注释**: 阶段版本配置


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `stageversion_id` | `bigint` | `NOT NULL` | 阶段版本主键 |
| `vp_stageversion_id` | `bigint` | `` | vp的阶段版本Id |
| `stageversion_name` | `character` | `varying(255)` | 阶段版本名称 |
| `sort` | `integer` | `NOT NULL` | 排序序号 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间  |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |


## Table: `sys_track_action`

**表注释**: 跟踪活动表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(256)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(256)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目组id |
| `topic_id` | `character` | `varying(255)` | 关联主题id |
| `topic_type` | `character` | `varying(32)` | 关联主题类型 主题类型，对应字典编码。包括：需求、测分、用例、脚本 |
| `opt_content_json` | `text` | `` | 活动内容 json. |
| `opt_user_nick_name` | `character` | `varying(64)` | 操作人昵称 |
| `opt_user_id` | `bigint` | `` | 操作人Id |
| `del_flag` | `character(1)` | `` | 删除标记 0正常,1删除 |


## Table: `sys_track_remark`

**表注释**: 跟踪评论回复表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(256)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(256)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目组id |
| `parent_id` | `bigint` | `` | 父评论id 设计上支持盖楼，但不实现 |
| `topic_id` | `character` | `varying(100)` | 关联主题id |
| `topic_type` | `character` | `varying(32)` | 关联主题类型 主题类型，对应字典编码。包括：需求、测分、用例、脚本 |
| `comment_content_json` | `text` | `` | 评论内容json 富文本对象。涉及附件 |
| `opt_user_nick_name` | `character` | `varying(64)` | 评论人昵称 |
| `opt_user_id` | `bigint` | `` | 操作人Id |
| `del_flag` | `character(1)` | `` | 删除标记 0正常,1删除 |


## Table: `sys_user`

**表注释**: 用户表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `username` | `character` | `varying(64) NOT NULL` | 用户名 |
| `password` | `character` | `varying(255) NOT NULL` | 密码 |
| `salt` | `character` | `varying(255) DEFAULT NULL::character varying` | 随机盐 |
| `real_name` | `character` | `varying(64) NOT NULL` | 真实名称 |
| `nike_name` | `character` | `varying(64) NOT NULL` | 昵称 |
| `phone` | `character` | `varying(20) DEFAULT NULL::character varying` | 电话号码 |
| `description` | `character` | `varying(255) DEFAULT NULL::character varying` | 用户简介 |
| `avatar` | `character` | `varying(255) DEFAULT NULL::character varying` | 头像 |
| `gender` | `integer` | `` | 性别 0:男 1:女 |
| `lock_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 用户状态：0-正常，9-锁定 |
| `expire_time` | `timestamp` | `without time zone` | 到期时间 |
| `user_type` | `character(1)` | `DEFAULT '0'::bpchar` | 用户类型：0-普通用户，1-集体用户 |
| `user_source` | `integer` | `DEFAULT 0` | 用户来源0:在系统创建 1:其他导入 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `leader_id` | `bigint` | `` | 领导id |
| `password_flag` | `integer` | `DEFAULT 0` | 修改密码标识 0: 首次登录未修改密码	非0: 已修改密码 |
| `obsoleted_flag` | `character(1)` | `` | 离职标识：0-正常，1-离职 |


## Table: `sys_user_enterprise_relation`

**表注释**: 用户和企业关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `dept_id` | `bigint` | `NOT NULL` | 部门id |
| `user_id` | `bigint` | `NOT NULL` | 人员id |
| `work_org_code` | `character` | `varying(100)` | 工作所处部门 |
| `org_code` | `character` | `varying(100)` | 部门编码 |
| `user_classify` | `character(1)` | `` | 用户类型 0-行员，1-龙盈，2-外包 |


## Table: `sys_user_group`

**表注释**: 项目组基本信息


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_group_id` | `bigint` | `NOT NULL` | 主键id |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `user_group_name` | `character` | `varying(128) DEFAULT NULL::character varying` | 用户组名称 |
| `description` | `character` | `varying(255) DEFAULT NULL::character varying` | 用户组描述 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_user_group_relation`

**表注释**: 用户和用户组关联关系


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` | 用户id |
| `user_group_id` | `bigint` | `NOT NULL` | 用户组id |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_user_post`

**表注释**: 用户与岗位关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` | 用户ID |
| `post_id` | `bigint` | `NOT NULL` | 岗位ID |


## Table: `sys_user_project_relation`

**表注释**: 用户和项目关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` | 用户id |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `project_id` | `bigint` | `NOT NULL` | 项目id |
| `default_project` | `integer` | `DEFAULT 0 NOT NULL` | 默认空间 0: 不是默认 1: 是默认" |


## Table: `sys_system_under_test`

**表注释**: 被测系统信息


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `system_id` | `bigint` | `NOT NULL` | 系统id |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `system_code` | `character` | `varying(100)` | 系统编码 |
| `system_name` | `character` | `varying(255)` | 系统名称 |
| `system_url` | `character` | `varying(255)` | 系统链接 |
| `system_manager_id` | `bigint` | `` | 系统负责人id |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `important_level` | `character(1)` | `DEFAULT '2'::bpchar` | 0-重要，1-准重要，2-普通 |
| `source` | `character(1)` | `DEFAULT '1'::bpchar` | 0-不是来源vp，1-是来源vp |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `project_id` | `bigint` | `` | 项目id |
| `test_manager_id` | `bigint` | `` | 测试负责人id |
| `risk_expert_id` | `bigint` | `` | 风险专家id |
| `system_dev_dept_name` | `character` | `varying(500)` | 系统开发处室 |


## Table: `sys_user_role_relation`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` | 用户id |
| `role_id` | `bigint` | `NOT NULL` | 角色id |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_user_role_relation_copy`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` |  |
| `role_id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `NOT NULL` |  |


## Table: `sys_user_sut_relation`

**表注释**: 用户和被测系统关系


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` | 用户id |
| `system_id` | `bigint` | `NOT NULL` | 被测系统id |
| `enterprise_id` | `bigint` | `NOT NULL` | 所属企业id |
| `person_in_charge` | `tinyint` | `DEFAULT 0` |  |


## Table: `sys_version_merged_issue`

**表注释**: 版本归并问题单


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `issue_id` | `bigint` | `NOT NULL` | 主键 |
| `create_by` | `character` | `varying(64)` | 创建者 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `bill_no` | `character` | `varying(50)` | 版本变更申请单单号 |
| `title` | `character` | `varying(500)` | 主题摘要 |
| `change_basis` | `text` | `` | 变更依据 |
| `system_name` | `text` | `` | 系统名称 |
| `plan_start_time` | `timestamp` | `without time zone` | 计划开始时间 |
| `plan_end_time` | `timestamp` | `without time zone` | 计划结束时间 |
| `process_state` | `character` | `varying(20)` | 流程状态（比如运行中或已完成或已撤销等） |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `sys_workload_config`

**表注释**: 工作量配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `workload_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `year` | `bigint` | `` | 所属年份 |
| `date_config` | `date` | `` | 日期配置 |
| `workload_status` | `integer` | `` | 状态：0未提交，1已提交 |
| `del_flag` | `character(1)` | `` | 0-正常，1-删除 |
| `sit_workload` | `integer` | `` | SIT工作量 |
| `uat_workload` | `integer` | `` | UAT工作量 |


## Table: `system_metrics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `system_id` | `bigint` | `` | 系统id |
| `system_name` | `character` | `varying(150)` | 系统名称 |
| `system_manager_id` | `bigint` | `` | 系统负责人 |
| `system_manager_dept_id` | `bigint` | `` | 系统负责人部门Id |
| `system_manager_dept_name` | `character` | `varying(150)` | 系统负责人处室 |
| `create_time` | `date` | `` | 保存时间 |
| `sit_case_lib_asset_reuse_rate` | `real` | `` | SIT案例库资产复用率 |
| `uat_case_lib_asset_reuse_rate` | `real` | `` | UAT案例库资产复用率 |
| `case_lib_fresh_case_rate` | `real` | `` | 资产库案例保鲜率 |
| `issue_density_rate` | `real` | `` | 缺陷密度 |
| `product_risk_reuse_rate` | `real` | `` | 产品风险复用率 |
| `product_risk_lib_fresh_rate` | `real` | `` | 产品风险库保险率 |
| `product_risk_level_rate` | `real` | `` | 产品风险等级占比 |
| `relation_risk_issue_rate` | `real` | `` | 关联风险缺陷占比 |
| `sit_case_lib_referenced_count` | `integer` | `` | 案例库中SIT系统下被引用案例数量 |
| `sit_case_lib_count` | `integer` | `` | 案例库中SIT系统下案例总数 |
| `uat_case_lib_referenced_count` | `integer` | `` | 案例库中UAT系统下被引用案例数量 |
| `uat_case_lib_count` | `integer` | `` | 案例库中UAT系统下案例总数 |
| `system_add_update_delete_case_count` | `integer` | `` | 系统下更新新增删除案例数量 |
| `system_original_case_count` | `integer` | `` | 系统下原有案例数量 |
| `system_effective_issue_count` | `integer` | `` | 系统有效缺陷总数 |
| `system_total_function_point_count` | `integer` | `` | 系统总功能点数 |
| `system_risk_referenced_count` | `integer` | `` | 风险库中系统下被引用的风险数量 |
| `system_risk_count` | `integer` | `` | 风险库中系统下风险总数 |
| `system_add_update_delete_lib_risk_count` | `integer` | `` | 系统下更新新增删除风险数量 |
| `system_original_risk_count` | `integer` | `` | 系统下原有风险数量 |
| `auto_test_case_lib_cover_rate` | `real` | `` | 案例库自动化测试案例覆盖率 |
| `auto_test_case_lib_reuse_rate` | `real` | `` | 自动化案例库资产复用率 |
| `sit_interface_script_rate` | `real` | `` | SIT接口场景化脚本率 |
| `uat_interface_script_rate` | `real` | `` | UAT接口场景化脚本率 |
| `sit_auto_script_fresh_rate` | `real` | `` | SIT自动化脚本保鲜率 |
| `uat_auto_script_fresh_rate` | `real` | `` | UAT自动化脚本保鲜率 |
| `sit_auto_execute_count` | `integer` | `` | SIT自动化执行总次数 |
| `uat_auto_execute_count` | `integer` | `` | UAT自动化执行总次数 |
| `sit_case_execute_count` | `integer` | `` | SIT测试案例执行总次数 |
| `uat_case_execute_count` | `integer` | `` | UAT测试案例执行总次数 |


## Table: `system_relation_maintenance`

**表注释**: 系统关系维护表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `DEFAULT 1619927771602984961::bigint` |  |
| `project_id` | `bigint` | `DEFAULT 1` |  |
| `system_id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(128)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(128)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `system_name` | `character` | `varying(128) NOT NULL` | 系统名称 |
| `relation_id` | `character` | `varying(128)` | 关联id，来源性能平台 |
| `relation_user_id` | `bigint` | `` | 关联人员所属id |
| `system_source` | `character(1)` | `DEFAULT 1` | 被测系统来源：1-vp，2-非vp |
| `reaches_id` | `bigint` | `` | 渠道ID |
| `hierarchy` | `character` | `varying(128)` | 系统层级结构 |


## Table: `task_metrics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `cr_id` | `bigint` | `` | CRId |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `cr_code` | `character` | `varying(255)` | CR编码 |
| `cr_online_time` | `timestamp` | `without time zone` | CR上线时间 |
| `task_id` | `bigint` | `` | 任务Id |
| `task_name` | `character` | `varying(500)` | 任务名称 |
| `case_id` | `character` | `varying(50)` | 案例Id |
| `case_name` | `character` | `varying(500)` | 案例名称 |
| `case_designer_id` | `bigint` | `` | 案例设计人Id |
| `case_designer_name` | `character` | `varying(255)` | 案例设计人名称 |
| `case_designer_group_name` | `character` | `varying(255)` | 案例设计人组别 |
| `exec_status` | `integer` | `` | 执行状态 |
| `auto_exec_flag` | `boolean` | `` | 是否自动化执行 |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `test_auto_back_task_statistics_report`

**表注释**: 自动化回归统计报表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `stageversion_name` | `character` | `varying(255)` | 阶段版本名称 |
| `system_id` | `bigint` | `` | 系统id |
| `system_name` | `character` | `varying(255)` | 系统名称 |
| `sit_case_count` | `integer` | `DEFAULT 0` | sit案例数 |
| `sit_case_manual_count` | `integer` | `DEFAULT 0` | sit手工案例数 |
| `sit_case_automatic_count` | `integer` | `DEFAULT 0` | sit自动化案例数 |
| `sit_case_exec_count` | `integer` | `DEFAULT 0` | sit案例执行数 |
| `sit_case_exec_success_count` | `integer` | `DEFAULT 0` | sit案例执行成功数 |
| `sit_case_manual_exec_count` | `integer` | `DEFAULT 0` | sit案例手工执行数 |
| `sit_case_manual_exec_success_count` | `integer` | `DEFAULT 0` | sit案例手工执行成功数 |
| `sit_case_automatic_exec_count` | `integer` | `DEFAULT 0` | sit案例自动化执行数 |
| `sit_case_automatic_exec_success_count` | `integer` | `DEFAULT 0` | sit案例自动化执行成功数 |
| `uat_case_count` | `integer` | `DEFAULT 0` | uat案例数 |
| `uat_case_manual_count` | `integer` | `DEFAULT 0` | uat手工案例数 |
| `uat_case_automatic_count` | `integer` | `DEFAULT 0` | uat自动化案例数 |
| `uat_case_exec_count` | `integer` | `DEFAULT 0` | uat案例执行数 |
| `uat_case_exec_success_count` | `integer` | `DEFAULT 0` | uat案例执行成功数 |
| `uat_case_manual_exec_count` | `integer` | `DEFAULT 0` | uat案例手工执行数 |
| `uat_case_manual_exec_success_count` | `integer` | `DEFAULT 0` | uat案例手工执行成功数 |
| `uat_case_automatic_exec_count` | `integer` | `DEFAULT 0` | uat案例自动化执行数 |
| `uat_case_automatic_exec_success_count` | `integer` | `DEFAULT 0` | uat案例自动化执行成功数 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `case_count` | `integer` | `` | 案例总数 |
| `manual_case_count` | `integer` | `` | 手工案例总数 |
| `auto_case_count` | `integer` | `` | 自动化案例总数 |
| `case_exec_count` | `integer` | `` | 案例执行总数 |
| `case_exec_passed_count` | `integer` | `` | 案例执行成功总数 |
| `manual_exec_count` | `integer` | `` | 手工执行总数 |
| `manual_exec_passed_count` | `integer` | `` | 手工执行成功总数 |
| `auto_exec_count` | `integer` | `` | 自动化执行总数 |
| `auto_exec_passed_count` | `integer` | `` | 自动化执行成功总数 |


## Table: `test_auto_cr_statistics_report`

**表注释**: 自动化CR统计报表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `stageversion_name` | `character` | `varying(255)` | 阶段版本名称 |
| `cr_id` | `bigint` | `` | cr id |
| `cr_name` | `character` | `varying` | cr名称 |
| `cr_code` | `character` | `varying` | cr编码 |
| `plan_status` | `character(1)` | `DEFAULT '0'::bpchar` | 计划状态 0:未开始 1:进行中 2:已完成 |
| `system_id` | `bigint` | `` | 系统id |
| `system_name` | `character` | `varying(255)` | 系统名称 |
| `smoke_flag` | `character(1)` | `` | 是否冒烟 0：否 1：是 |
| `sit_case_count` | `integer` | `DEFAULT 0` | sit案例数 |
| `sit_case_manual_count` | `integer` | `DEFAULT 0` | sit手工案例数 |
| `sit_case_automatic_count` | `integer` | `DEFAULT 0` | sit自动化案例数 |
| `sit_case_exec_count` | `integer` | `DEFAULT 0` | sit案例执行数 |
| `sit_case_exec_success_count` | `integer` | `DEFAULT 0` | sit案例执行成功数 |
| `sit_case_manual_exec_count` | `integer` | `DEFAULT 0` | sit案例手工执行数 |
| `sit_case_manual_exec_success_count` | `integer` | `DEFAULT 0` | sit案例手工执行成功数 |
| `sit_case_automatic_exec_count` | `integer` | `DEFAULT 0` | sit案例自动化执行数 |
| `sit_case_automatic_exec_success_count` | `integer` | `DEFAULT 0` | sit案例自动化执行成功数 |
| `uat_case_count` | `integer` | `DEFAULT 0` | uat案例数 |
| `uat_case_manual_count` | `integer` | `DEFAULT 0` | uat手工案例数 |
| `uat_case_automatic_count` | `integer` | `DEFAULT 0` | uat自动化案例数 |
| `uat_case_exec_count` | `integer` | `DEFAULT 0` | uat案例执行数 |
| `uat_case_exec_success_count` | `integer` | `DEFAULT 0` | uat案例执行成功数 |
| `uat_case_manual_exec_count` | `integer` | `DEFAULT 0` | uat案例手工执行数 |
| `uat_case_manual_exec_success_count` | `integer` | `DEFAULT 0` | uat案例手工执行成功数 |
| `uat_case_automatic_exec_count` | `integer` | `DEFAULT 0` | uat案例自动化执行数 |
| `uat_case_automatic_exec_success_count` | `integer` | `DEFAULT 0` | uat案例自动化执行成功数 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `case_count` | `integer` | `` | 案例总数 |
| `manual_case_count` | `integer` | `` | 手工案例总数 |
| `auto_case_count` | `integer` | `` | 自动化案例总数 |
| `case_exec_count` | `integer` | `` | 案例执行总数 |
| `case_exec_passed_count` | `integer` | `` | 案例执行成功总数 |
| `manual_exec_count` | `integer` | `` | 手工执行总数 |
| `manual_exec_passed_count` | `integer` | `` | 手工执行成功总数 |
| `auto_exec_count` | `integer` | `` | 自动化执行总数 |
| `auto_exec_passed_count` | `integer` | `` | 自动化执行成功总数 |
| `user_name` | `character` | `varying(100)` | 用户名 |
| `group_name` | `character` | `varying(100)` | 组别 |


## Table: `test_case`

**表注释**: 测试用例


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `case_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `bigint` | `` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `bigint` | `` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `case_code` | `character` | `varying(255)` | 用例编号 |
| `dir_id` | `bigint` | `` | 用例目录id |
| `case_test_type` | `integer` | `` | 测试类型：功能测试，数据字典配置 |
| `case_type` | `integer` | `` | 用例类型,流程案例，功能案例，接口案例，UI案例 |
| `case_priority` | `integer` | `` | 用例重要度：1:高2:中3:低,数据字典 |
| `case_exec_type` | `integer` | `` | 用例执行方式：1手工，2自动化 |
| `case_side_type` | `integer` | `` | 用例性质：0：正例，1反例 |
| `case_name` | `character` | `varying(255)` | 用例名称 |
| `case_desc` | `character` | `varying(1000)` | 用例描述 |
| `case_prior` | `character` | `varying(1000)` | 用例前置条件 |
| `case_detail_json` | `character` | `varying(1000)` | 用例详情json |
| `case_file_json` | `character` | `varying(1000)` | 用例附件json |
| `case_remark` | `character` | `varying(1000)` | 用例备注 |
| `transaction_type` | `integer` | `` | 交易类型，0：金融交易，1：非金融交易。 |
| `model_type` | `integer` | `` | 模式，0：日间，1：夜间 |
| `smoke_flag` | `character(1)` | `` | 是否冒烟 0否 1是 |
| `story_id` | `bigint` | `` | 需求id |
| `cr_id` | `bigint` | `` | CR-id |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `cr_story_id` | `bigint` | `` | 测试需求编号 |
| `system_id` | `bigint` | `` | 被测系统id |
| `first_module_id` | `bigint` | `` | 一级模块id |
| `second_module_id` | `bigint` | `` | 二级模块id |
| `cycledate_type` | `integer` | `` | cycle日期类型，取数据字典 |
| `cycledate_plan` | `character` | `varying(255)` | cycle日期安排 |
| `cycledate` | `character` | `varying(255)` | cycle日期 |
| `case_stage_type` | `character` | `varying(255)` | 阶段版本标识，比如uat，sit |
| `case_designer_id` | `bigint` | `` | 用例设计者id |
| `history` | `integer` | `` | 历史版本，0：否，1：是 |
| `history_version` | `bigint` | `` | 历史版本号 |
| `review_status` | `integer` | `` | 评审状态 |
| `design_status` | `integer` | `` | 设计状态 |
| `exec_status` | `integer` | `` | 执行状态，最新的状态 |
| `storage_status` | `integer` | `` | 入库状态 |
| `source_from` | `integer` | `` | 数据来源 0:在系统创建 1:文件导入，2案例库导入 |
| `del_flag` | `character(1)` | `` | 删除状态 0:正常 1:删除 |


## Table: `test_case_check_record`

**表注释**: 测试案例规范检查记录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `check_record_id` | `bigint` | `NOT NULL` | 检查记录id |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `create_by` | `character` | `varying(32)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(32)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `cr_id` | `bigint` | `` | CR主键 |
| `check_name` | `character` | `varying(255)` | 检查名称 |
| `check_status` | `character` | `varying(5)` | 检查状态；1-检查中；2-已完成 |
| `process_case_ratio` | `character` | `varying(255)` | 流程案例正反例分布；正例：反例 |
| `function_case_ratio` | `character` | `varying(255)` | 功能案例正反例分布；正例：反例 |
| `intetface_case_ratio` | `character` | `varying(255)` | 接口案例正反例分布；正例：反例 |
| `ui_case_ratio` | `character` | `varying(255)` | UI案例正反例分布；正例：反例 |
| `del_flag` | `character(1)` | `` | 删除类型；0-正常，1-删除 |
| `case_stage_type` | `character` | `varying(20)` | 测试阶段；sit/uat |
| `case_check_type` | `character` | `varying` | 检查类型，默认是CR下某个阶段所有案例检查，case_warehousing：案例入库检查 |
| `check_primary_key` | `character` | `varying` | 不同检查类型的主键，例如：案例入库检查存的是评审Id |


## Table: `test_case_check_result`

**表注释**: 测试案例规范检查结果表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `check_result_id` | `bigint` | `NOT NULL` | 检查结果id |
| `create_by` | `character` | `varying(32)` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(32)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `check_record_id` | `bigint` | `` | 检查记录id |
| `case_id` | `character` | `varying(50)` | 案例id |
| `field_name` | `character` | `varying(255)` | 字段名称 |
| `field_value` | `character` | `varying(255)` | 字段值 |
| `description` | `character` | `varying(255)` | 问题描述 |
| `del_flag` | `character(1)` | `` | 删除类型；0-正常，1-删除 |


## Table: `test_case_dir`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `dir_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `create_by` | `character` | `varying(64)` |  |
| `update_by` | `character` | `varying(64)` |  |
| `parent_id` | `bigint` | `` |  |
| `dir_code` | `character` | `varying(64)` |  |
| `dir_name` | `character` | `varying(255)` |  |
| `cr_id` | `bigint` | `` |  |
| `stage_type` | `character` | `varying(64)` |  |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `dir_type` | `character` | `varying(32)` |  |
| `dir_order` | `integer` | `` |  |


## Table: `test_case_issue`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `case_id` | `bigint` | `` |  |
| `issue_id` | `bigint` | `` |  |


## Table: `test_dir`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `dir_id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `create_by` | `character` | `varying(64)` |  |
| `update_by` | `character` | `varying(64)` |  |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` |  |
| `parent_id` | `bigint` | `` |  |
| `dir_name` | `character` | `varying(255)` |  |
| `dir_code` | `character` | `varying(64)` |  |
| `dir_type` | `character` | `varying(32)` |  |
| `dir_order` | `integer` | `` |  |
| `data_class` | `character` | `varying(255)` |  |
| `data_id` | `character` | `varying(255)` |  |
| `dir_flag` | `tinyint` | `` |  |
| `source_data_id` | `character` | `varying(255)` | 来源的对象id |
| `source_data_class` | `character` | `varying(255)` | 来源的全限类型 |
| `dir_desc` | `character` | `varying(255)` | 目录描述 |


## Table: `test_library`

**表注释**: 案例资产库表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `library_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `library_name` | `character` | `varying(64)` | 案例库名称 |
| `library_code` | `character` | `varying(64)` | 案例库编码 |
| `library_desc` | `character` | `varying(800)` | 案例库描述 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `library_type` | `integer` | `` | 资产库类型：1测试案例，2测试数据，3测试文件 |


## Table: `test_library_dir`

**表注释**: 案例资产库左侧树表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `dir_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `parent_id` | `bigint` | `` | 父模块id |
| `dir_code` | `character` | `varying(64)` | 目录树编码 |
| `dir_name` | `character` | `varying(64)` | 目录树名称 |
| `dir_order` | `integer` | `` | 同级目录排序 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `library_id` | `bigint` | `` | 资产库id |


## Table: `test_risk_expert`

**表注释**: 风险专家信息表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `user_id` | `bigint` | `NOT NULL` | 人员id |
| `username` | `character` | `varying(64)` | 用户名 |
| `real_name` | `character` | `varying(64)` | 真实姓名 |
| `manage_system_number` | `integer` | `` | 管理的系统数量 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |


## Table: `test_system_module_info`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `data_id` | `character` | `varying(100) NOT NULL` | 数据对象id |
| `data_class` | `character` | `varying(255) NOT NULL` | 对象类型 |
| `system_id` | `bigint` | `NOT NULL` | 被测系统id |
| `first_module_id` | `bigint` | `NOT NULL` | 一级模块id |
| `second_module_id` | `bigint` | `DEFAULT 0` | 二级模块id |


## Table: `test_task_case_relation`

**表注释**: 测试任务与用例关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `task_id` | `bigint` | `NOT NULL` | 任务id |
| `case_id` | `character` | `varying NOT NULL` | 用例id |
| `case_order` | `integer` | `` | 用例排序标识 执行任务编排用例时使用 |
| `exec_status` | `integer` | `` | 当前任务下用例的最新执行状态 |
| `exec_user` | `bigint` | `` | 执行人 |
| `latest_exec_time` | `timestamp` | `without time zone` | 最新执行时间 |
| `cr_id` | `bigint` | `` | crId,注：当任务是回归任务的时候cr_id为空 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `task_type` | `tinyint` | `` | 任务类型 |
| `stage_type` | `character` | `varying(50)` | 阶段类型 |
| `case_exec_type` | `integer` | `` | 用例执行方式：1-手工，2-自动化 |


## Table: `test_task_dir_relation`

**表注释**: 任务目录关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `task_id` | `bigint` | `NOT NULL` | 任务id |
| `dir_id` | `bigint` | `NOT NULL` | 目录id |


## Table: `test_task_exec_info`

**表注释**: 测试任务对用用例的执行情况


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `task_id` | `bigint` | `NOT NULL` | 任务id |
| `total_case` | `integer` | `DEFAULT 0` | 任务绑定的用例个数 |
| `passed` | `integer` | `DEFAULT 0` | 用例通过数 |
| `failed` | `integer` | `DEFAULT 0` | 用例失败树 |
| `block` | `integer` | `DEFAULT 0` | 用例阻塞数 |
| `pending` | `integer` | `DEFAULT 0` | 用例未执行数 |
| `execing` | `integer` | `` | 用例执行中数 |


## Table: `test_task`

**表注释**: 测试任务


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `task_id` | `bigint` | `NOT NULL` | 任务id |
| `create_by` | `character` | `varying(32)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(32)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `plan_id` | `bigint` | `` | 关联计划id |
| `parent_id` | `bigint` | `` | 父id |
| `cr_id` | `bigint` | `` | 需求id，可以是cr_id或者工单id |
| `stage_activity_type` | `integer` | `` | 阶段下活动id |
| `stage_type` | `character` | `varying(255)` | 阶段类型， 比如UAT, SIT |
| `task_type` | `bigint` | `` | 任务类型 冒烟，回归。 |
| `exec_time` | `integer` | `` | 执行轮次,取数据字典。 |
| `task_test_type` | `bigint` | `` | 测试类型 对应字典表计划任务测试类型。包括：功能测试、接口测试、兼容测试、性能测试、探索测试、用户体验测试、稳定性测试、安全测试 |
| `task_code` | `character` | `varying(255)` | 任务code |
| `task_name` | `character` | `varying(255)` | 任务名称 |
| `task_desc` | `text` | `` | 任务描述 |
| `task_create_user_id` | `bigint` | `` | 任务创建人 |
| `task_exec_user_id` | `bigint` | `` | 任务执行人 |
| `task_exec_type` | `bigint` | `` | 任务执行方式 任务执行方式，对应字典表的任务执行方式，对测试执行任务有效。包括：手工、自动化 |
| `plan_task_start_time` | `timestamp` | `without time zone` | 计划开始日期 |
| `plan_task_end_time` | `timestamp` | `without time zone` | 计划结束日期 |
| `actual_start_time` | `timestamp` | `without time zone` | 实际开始时间 自动填充：状态变迁：未开始——进行中； |
| `actual_end_time` | `timestamp` | `without time zone` | 实际结束时间 自动填充：状态变迁：进行中——已完成； |
| `percentage` | `numeric(32` | `` | 任务进度 |
| `complete_status` | `integer` | `` | 完成状态 0:未开始 1:进行中 2:已完成 |
| `task_file_json` | `character` | `varying(1000)` | 任务附件json [{"fileId":xx,"fileName":"xxx","fileSize":"xxx","downloadUrl":"xxx"},{"fileId":xx,"fileName":"xxx","fileSize":"xxx","downloadUrl":"xxx"}] |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 删除状态 0:正常 1:删除 |
| `circuit_start_time` | `timestamp` | `without time zone` | 线路图开始时间 |
| `circuit_end_time` | `timestamp` | `without time zone` | 线路图结束时间 |
| `stage_version_id` | `bigint` | `` |  |
| `system_id` | `bigint` | `` | 系统id |
| `system_env` | `character` | `varying(50)` | 系统环境 |
| `stats_method` | `character` | `varying(255) DEFAULT 'statsWeek'::character varying` |  |


## Table: `version_change_basis`

**表注释**: 版本变更依据表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `issue_id` | `character` | `varying(50) NOT NULL` | 缺陷id |
| `issue_no` | `character` | `varying(20)` | 缺陷编号 |
| `issue_name` | `character` | `varying(1000)` | 标题 |
| `system_name` | `character` | `varying(255)` | 所属系统 |
| `stageversion_name` | `character` | `varying(255)` | 阶段版本名称 |
| `issue_status_name` | `character` | `varying(100)` | 缺陷状态 |
| `template_name` | `character` | `varying(100)` | 缺陷流程分类 |
| `problem_type` | `character` | `varying(30)` | 问题分类 |
| `create_by` | `character` | `varying(64)` | 缺陷创建人 |
| `create_time` | `timestamp` | `without time zone` | 缺陷创建时间 |
| `update_by` | `character` | `varying(64)` | 版本变更更新人 |
| `update_time` | `timestamp` | `without time zone` | 版本变更更新时间 |


## Table: `version_change_basis_config`

**表注释**: 版本变更依据配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `config_id` | `bigint` | `NOT NULL` | 配置id |
| `stageversion_ids` | `character` | `varying(1000)` | 阶段版本ids |
| `issue_status_ids` | `character` | `varying(1000)` | 缺陷状态ids |
| `template_ids` | `character` | `varying(500)` | 缺陷流程分类ids |
| `problem_types` | `character` | `varying(500)` | 问题分类ids |
| `issue_noes` | `character` | `varying(1000)` | 缺陷编号ids |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `workitem_field`

**表注释**: 事项属性表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `workitem_field_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(255)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(255)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `field_key` | `character` | `varying(32)` | 字段唯一标识 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `field_name` | `character` | `varying(128)` | 字段名称 |
| `column_name` | `character` | `varying(256)` | 列名 |
| `field_type_code` | `character` | `varying(64)` | 字段类型 |
| `field_default_value` | `character` | `varying(128)` | 默认值 |
| `field_desc` | `character` | `varying(2048)` | 字段描述 |
| `system_flag` | `smallint` | `` | 1=系统(不可修改)，0=自定义 |
| `category` | `character` | `varying(32)` | 分类：需求，用例、脚本。。。。。等 |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 2:停用 |
| `other_option` | `character` | `varying(255)` | 存放标识,有值代表需要请求远程地址。 |
| `base_flag` | `integer` | `` | 0是基础字段，1是自定义字段 |
| `list_config_flag` | `integer` | `` | 是否是表头字段  0-否 1-是 |
| `search_config_flag` | `integer` | `` | 是否是搜索字段 0-否 1-是 |


## Table: `workitem_field_list_config`

**表注释**: 页搜索配置表-系统级别


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `field_id` | `bigint` | `NOT NULL` | 页面搜索属性 字段id |
| `show_flag` | `integer` | `` | 页面搜索属性 是否展示 0-展示 1不展示 |
| `default_flag` | `integer` | `` | 页面搜索属性 是否是默认 0-是 1-不是 |
| `sort_flag` | `integer` | `` | 页面搜索属性 排序 |
| `page_type` | `character` | `varying(100) NOT NULL` | 页面搜索属性 页面分类 |
| `field_width` | `integer` | `` | 页面搜索属性 字段展示宽度 |
| `sort_field_flag` | `integer` | `` | 是否是排序字段 0-是  1-不是 |


## Table: `workitem_field_option`

**表注释**: 字段选项值


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(255)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(255)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `template_id` | `bigint` | `DEFAULT (0)::bigint` | 选项值所属模板Id |
| `workitem_field_id` | `bigint` | `` | 自定义字段id 自定义字段id |
| `field_option_code` | `character` | `varying(64)` | 字段选项编码 字段选项编码 |
| `filed_option_name` | `character` | `varying(256)` | 字段选项名称 字段选项名称 |
| `filed_option_position` | `integer` | `` | 字段排序值 字段排序 |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 2:停用 |


## Table: `workitem_field_search_config`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `field_id` | `bigint` | `NOT NULL` |  |
| `show_flag` | `integer` | `` |  |
| `default_flag` | `integer` | `` |  |
| `sort_flag` | `integer` | `` |  |
| `page_type` | `character` | `varying(100) NOT NULL` |  |
| `field_width` | `integer` | `` |  |
| `field_value` | `character` | `varying(1000)` |  |
| `search_type` | `integer` | `` |  |
| `group_bind_flag` | `integer` | `` | 是否是筛选组绑定字段 0-是  1-不是 |
| `size_limit` | `integer` | `` | 多选选项个数限制，为null不限制 |


## Table: `workitem_field_template`

**表注释**: 模板字段关联表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying` | 更信任 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `template_id` | `bigint` | `` | 模板id |
| `workitem_field_id` | `bigint` | `` | 自定义字段id |
| `field_default_value` | `character` | `varying(128) DEFAULT NULL::character varying` | 字段默认值 |
| `required` | `tinyint` | `` | 页面是否必填 1：必填；0：非必填 |
| `show_when_create` | `tinyint` | `` | 页面新建是否显示 1:显示；0：隐藏 |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `fold_flag` | `smallint` | `` | 是否可折叠， 0：可折叠 1:不可折叠 |


## Table: `workitem_status`

**表注释**: 事项状态


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `status_id` | `bigint` | `NOT NULL` | 事项状态主键ID |
| `create_by` | `character` | `varying(255)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(255)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目组id |
| `status_name` | `character` | `varying(128)` | 事项状态名称 |
| `status_code` | `character` | `varying(128)` | 事项状态类型 |
| `status_desc` | `character` | `varying(128)` | 事项状态描述 |
| `status_sort` | `integer` | `` | 事项状态排序 |
| `system_flag` | `smallint` | `` | 1=系统(不可修改)，0=自定义 |
| `del_flag` | `character(1)` | `DEFAULT 0` | 删除状态 0:正常 1:删除 |
| `status_scope` | `character` | `varying(255)` | 状态作用范围 |


## Table: `workitem_template`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `template_id` | `bigint` | `NOT NULL` |  |
| `create_by` | `character` | `varying(255)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(255)` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `template_name` | `character` | `varying(128)` |  |
| `template_code` | `character` | `varying(128)` |  |
| `template_desc` | `character` | `varying(128)` |  |
| `project_default` | `smallint` | `` |  |
| `system_flag` | `smallint` | `` |  |
| `del_flag` | `character(1)` | `DEFAULT 0` |  |
| `type_id` | `bigint` | `` | 事项类型id |
| `sys_config` | `integer` | `` | 是否是系统配置流程 0-是  1-否 |
| `show_flag` | `tinyint` | `` | 是否显示 |


## Table: `workitem_template_status`

**表注释**: 状态和流程关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `template_id` | `bigint` | `` | 模板id |
| `create_by` | `bigint` | `` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `bigint` | `` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业id  |
| `project_id` | `bigint` | `` | 项目组id  |
| `status_id` | `bigint` | `` | 状态id |
| `status_sort` | `integer` | `` | 状态排序 |
| `start_flag` | `integer` | `` | 是否是初始状态：1:是,0否 |


## Table: `workitem_template_type`

**表注释**: 工作事项类型表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `type_id` | `bigint` | `NOT NULL` | 主键id |
| `create_by` | `character` | `varying(125) DEFAULT NULL::character varying` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(125) DEFAULT NULL::character varying` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `type_name` | `character` | `varying(255) NOT NULL` | 事项类型名称 |
| `system_flag` | `tinyint` | `` | 是否是系统类型 |
| `type_desc` | `character` | `varying(255) DEFAULT NULL::character varying` | 描述 |
| `enterprise_id` | `bigint` | `` | 企业id |
| `project_id` | `bigint` | `` | 项目id |
| `type_code` | `character` | `varying(125)` | 事项类型区别码 |


## Table: `sys_role`

**表注释**: 系统角色表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `role_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 修改时间 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建者 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `enterprise_id` | `bigint` | `NOT NULL` | 企业id |
| `project_id` | `bigint` | `DEFAULT 0 NOT NULL` | 项目id |
| `role_name` | `character` | `varying(64) NOT NULL` | 角色名称 |
| `role_code` | `character` | `varying(64) NOT NULL` | 角色code |
| `role_desc` | `character` | `varying(255) DEFAULT NULL::character varying` | 角色描述 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `role_type` | `smallint` | `` | 角色类型 系统内置角色，1-超级管理员，2-企业创建者，3-企业管理者，4-企业成员，5-项目管理者，6-项目成员，7-项目普通成员[只读]，8-自定义角色，由创建者决定，9-OTHER,其他角色未知 |
| `role_scope` | `character` | `varying` | 角色范围：system代表系统，custom代表自定义 |
| `role_source` | `integer` | `` | 角色来源 0：当前系统创建 1：vp系统同步 |


## Table: `sys_role_menu_relation`

**表注释**: 角色菜单关系表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `role_id` | `bigint` | `NOT NULL` | 角色id |
| `menu_id` | `bigint` | `NOT NULL` | 菜单id |
| `enterprise_id` | `bigint` | `` | 企业Id |
| `project_id` | `bigint` | `` | 项目id |
| `CONSTRAINT` | `sys_role_menu_role_id_fkey` | `FOREIGN KEY (role_id) REFERENCES sys_role(role_id)` |  |


## Table: `ai_requirement_generate_record`

**表注释**: AI生成测试需求点记录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `create_by` | `character` | `varying(255)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_by` | `character` | `varying(255)` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `del_flag` | `character(1)` | `DEFAULT 0` | 0-正常，1-删除 |
| `generate_code` | `character` | `varying(100)` | 生成编号 |
| `interface_name` | `character` | `varying(255)` | 接口名称 |
| `cr_id` | `bigint` | `` | CR-ID |
| `stage_type` | `character` | `varying(100)` | 测试阶段：sit、uat |
| `system_id` | `bigint` | `` |  |
| `first_module_id` | `bigint` | `` |  |
| `second_module_id` | `bigint` | `` |  |
| `prompt_id` | `bigint` | `` |  |
| `prompt_name` | `character` | `varying(500)` | 测试需求点类型 |
| `generate_count` | `integer` | `` | 生成数量 |
| `adopt_count` | `integer` | `` | 采纳数量 |
| `node_id` | `character` | `varying(100)` | 接口节点id |


## Table: `story_cr_risk_statistics_report`

**表注释**: CR风险统计报表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `create_by` | `character` | `varying(255)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_by` | `character` | `varying(255)` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `cr_id` | `bigint` | `` | CR-ID |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `system_id` | `bigint` | `` |  |
| `stage_version_id` | `bigint` | `` | CR所属阶段版本id |
| `library_risk_count` | `integer` | `DEFAULT 0` | 从资产库引入风险数量 |
| `major_risk_count` | `integer` | `DEFAULT 0` | 重大风险数量 |
| `high_risk_count` | `integer` | `DEFAULT 0` | 较大风险数量 |
| `moderate_risk_count` | `integer` | `DEFAULT 0` | 一般风险数量 |
| `low_risk_count` | `integer` | `DEFAULT 0` | 轻微风险数量 |


## Table: `ai_case_generate_record`

**表注释**: AI生成记案例录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `create_by` | `character` | `varying(255)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_by` | `character` | `varying(255)` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `del_flag` | `character(1)` | `DEFAULT 0` | 0-正常，1-删除 |
| `generate_code` | `character` | `varying(100)` | 生成编号 |
| `interface_name` | `character` | `varying(255)` | 接口名称 |
| `cr_id` | `bigint` | `` | CR-ID |
| `case_stage_type` | `character` | `varying(100)` | 测试阶段：sit、uat |
| `system_id` | `bigint` | `` |  |
| `first_module_id` | `bigint` | `` |  |
| `second_module_id` | `bigint` | `` |  |
| `prompt_id` | `bigint` | `` |  |
| `prompt_name` | `character` | `varying(500)` | 测试需求点类型 |
| `generate_count` | `integer` | `` | 生成数量 |
| `is_full_adopt_count` | `integer` | `` | 完全采纳数量 |
| `is_not_full_adopt_count` | `integer` | `` | 部分采纳数量 |


## Table: `ai_knowledge_generate_record`

**表注释**: 知识库生成记录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `create_by` | `character` | `varying(255)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_by` | `character` | `varying(255)` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `del_flag` | `character(1)` | `DEFAULT 0` | 0-正常，1-删除 |
| `generate_code` | `character` | `varying(100)` | 生成编号 |
| `interface_name` | `character` | `varying(255)` | 接口名称 |
| `cr_id` | `bigint` | `` | CR-ID |
| `stage_type` | `character` | `varying(100)` | 测试阶段：sit、uat |
| `system_id` | `bigint` | `` |  |
| `first_module_id` | `bigint` | `` |  |
| `second_module_id` | `bigint` | `` |  |
| `prompt_id` | `bigint` | `` |  |
| `prompt_name` | `character` | `varying(500)` | 测试需求点类型 |
| `generate_count` | `integer` | `` | 生成数量 |
| `adopt_count` | `integer` | `` | 采纳数量 |


## Table: `test_auto_cr_user_statistics_report`

**表注释**: 自动化CR统计报表(用户)


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | id |
| `stageversion_id` | `bigint` | `` | 阶段版本id |
| `stageversion_name` | `character` | `varying(255) DEFAULT NULL::character varying` | 阶段版本名称 |
| `cr_id` | `bigint` | `` | cr id |
| `cr_name` | `character` | `varying(255) DEFAULT NULL::character varying` | cr名称 |
| `cr_code` | `character` | `varying(255) DEFAULT NULL::character varying` | cr编码 |
| `plan_status` | `integer` | `DEFAULT 0` | 计划状态 0:未开始 1:进行中 2:已完成 |
| `stage_type` | `character` | `varying(10) DEFAULT NULL::character varying` | 测试阶段 |
| `system_id` | `bigint` | `` | 系统id |
| `system_name` | `character` | `varying(255) DEFAULT NULL::character varying` | 系统名称 |
| `smoke_flag` | `integer` | `` | 是否冒烟 0：否 1：是 |
| `user_id` | `bigint` | `` | userId |
| `user_real_name` | `character` | `varying(255) DEFAULT NULL::character varying` | 用户名称 |
| `user_name` | `character` | `varying(255) DEFAULT NULL::character varying` | 用户账号 |
| `group_name` | `character` | `varying(255) DEFAULT NULL::character varying` | 用户组别 |
| `case_count` | `integer` | `` | 案例数 |
| `auto_case_count` | `integer` | `` | 自动化案例数 |
| `auto_case_from_library_count` | `integer` | `` | 引入的资产库自动化案例数 |
| `case_exec_count` | `integer` | `` | 案例执行数 |
| `case_exec_passed_count` | `integer` | `` | 案例执行成功数 |
| `auto_exec_count` | `integer` | `` | 自动化执行数 |
| `auto_exec_passed_count` | `integer` | `` | 自动化执行成功数 |
| `auto_exec_interface_case_count` | `integer` | `` | 自动化执行数(接口) |
| `auto_exec_interface_case_passed_count` | `integer` | `` | 自动化执行成功数(接口) |
| `stats_date` | `character` | `varying(20) DEFAULT NULL::character varying` | 统计数据日期 |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `story_cr`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | CR需求主键ID |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |
| `vp_cr_id` | `bigint` | `` | CRID |
| `cr_code` | `character` | `varying(255)` | CR编码 |
| `cr_name` | `character` | `varying(255)` | CR名称 |
| `cr_proposer_id` | `bigint` | `` | CR提出人-人员ID |
| `cr_perincharge_id` | `bigint` | `` | CR负责人-人员ID |
| `cr_type` | `character` | `varying(255)` | 需求类型 ： 1 技术类(新业务需求)、2 技术类(小需求)、3 技术类(优化需求)、4 技术类、5 业务类(新建系统/系统重构)、6 业务类(新业务需求)、7 业务类(微需求)、8 业务类(小需求)、 9 业务类(分行特色需求)、 10 业务类(优化需求),11 技术类 |
| `cr_status` | `character` | `varying(255)` | CR状态，1正常，3取消，6关闭，7超期取消 |
| `cr_urgent` | `character` | `varying(255)` | CR紧急程度 1特急 2紧急 3一般 |
| `cr_urgent_state` | `character` | `varying(255)` | CR紧急状态 0正常 1紧急 |
| `agile_flag` | `character` | `varying(255)` | 是否敏捷，1是，其他否 |
| `business_flag` | `character` | `varying(255)` | 是否商务完成，1完成，0未完成 |
| `cr_processing_link` | `character` | `varying(500)` | 当前处理环节 |
| `cr_stageversion_id` | `bigint` | `` | 阶段版本id |
| `cr_online_time` | `timestamp` | `without time zone` | 上线时间 |
| `test_manager_id` | `bigint` | `` | 测试经理-人员ID |
| `test_contact_id` | `bigint` | `` | 测试联系人-人员ID |
| `cr_review_id` | `bigint` | `` | CR需求评审人-人员ID |
| `sit_exec_id` | `bigint` | `` | sit实施经理-人员ID |
| `uat_exec_id` | `bigint` | `` | uat实施经理-人员ID |
| `sit_plan_start_date` | `timestamp` | `without time zone` | sit计划开始时间 |
| `sit_plan_end_date` | `timestamp` | `without time zone` | sit计划结束时间 |
| `uat_plan_start_date` | `timestamp` | `without time zone` | uat计划开始时间 |
| `uat_plan_end_date` | `timestamp` | `without time zone` | uat计划结束时间 |
| `cr_summary` | `text` | `` | CR描述 |
| `sit_cr_plan_start_date` | `timestamp` | `without time zone` | sit cr发布管理开始时间 |
| `sit_cr_plan_end_date` | `timestamp` | `without time zone` | sit cr发布管理结束时间 |
| `uat_cr_plan_start_date` | `timestamp` | `without time zone` | uat cr发布管理开始时间 |
| `uat_cr_plan_end_date` | `timestamp` | `without time zone` | uat cr发布管理结束时间 |
| `sit_manager_team` | `character` | `varying(255)` | sit执行团队 |
| `uat_manager_team` | `character` | `varying(255)` | uat执行团队 |
| `del_flag` | `character(1)` | `DEFAULT '0'::bpchar` | 0-正常，1-删除 |
| `source` | `character(1)` | `DEFAULT '1'::bpchar` | 0-不是来源vp，1-是来源vp |
| `cr_group` | `character` | `varying(255)` | CR分组(0:全部,1:分配给我的，2:我创建的，3:我关注的) |
| `risk_level` | `character(1)` | `` | 风险级别 0低, 1中, 2高 |
| `process_id` | `bigint` | `` | 流程id |
| `plan_status` | `character(1)` | `DEFAULT '0'::bpchar` | 计划状态 0:未开始 1:进行中 2:已完成 |
| `work_order_evidence` | `character(1)` | `` | 是否反馈证迹	0: 否  1: 是 |
| `work_order_receipt_date` | `timestamp` | `without time zone` | 接收日期 |
| `work_order_source` | `character` | `varying(64)` | 工单来源 |
| `remark` | `character` | `varying(255)` | 备注 |
| `work_order_commit_ir` | `character(1)` | `` | 是否提交IR 0: 否  1: 是 |
| `story_type` | `character(1)` | `` | 需求类型	0: CR  1: 工单 |
| `work_order_itil_type` | `character(1)` | `` | itil类型	0: 优化建议单  1: 生产支持单 |
| `work_order_itil_code` | `character` | `varying(255)` | itil编号 |
| `work_order_dept` | `character` | `varying(255)` | 相关处室 |
| `work_order_tir_code` | `character` | `varying(255)` | tir编号 |
| `is_requirement` | `character` | `varying(255)` | 是否有特殊要求 |
| `requirement_describe` | `character` | `varying(255)` | 特殊要求描述 |
| `is_review` | `character` | `varying(10)` | 是否需要测服评审，0否，1是 |
| `sit_in_time` | `timestamp` | `without time zone` | Sit准入时间 |
| `sit_out_time` | `timestamp` | `without time zone` | Sit准出时间 |
| `cr_analyst_id` | `bigint` | `` | CR分析人-人员ID |
| `functioncut_state` | `character(1)` | `` | 功能切分是否完成  1完成，0未完成 |
| `planview_flag` | `character(1)` | `` | 计划评审是否完成  1完成，0未完成 |
| `new_sit` | `character(1)` | `` | 是否被测试中心承接  1承接，0不承接 |
| `integration_manager_id` | `bigint` | `` | 系统集成测试管理人-人员ID |
| `key_project_flag` | `integer` | `DEFAULT 0` | 是否是重点项目 0-不是  1-是 |
| `account_change_flag` | `integer` | `` | 是否涉及账务变动 0-不是  1-是 |
| `impact_customer_flag` | `integer` | `` | 改造是否直接影响客户 0-不是  1-是 |
| `process_change_description` | `character` | `varying(1500)` | 流程变更说明 |
| `execute_users` | `character` | `varying(500)` | 执行人员 |
| `cr_chieforg_name` | `character` | `varying(50)` | CR牵头开发处室名称 |
| `cr_put_dep_name` | `character` | `varying(50)` | 需求提出部门名称 |
| `sit_admittance_start_time` | `timestamp` | `with time zone` | CR最后一次进入到系统集成测试准入的时间 |
| `uat_publish_end_time` | `timestamp` | `with time zone` | 用户验收测试发布管理际完成的时间 |


## Table: `ai_generate_statistics`

**表注释**: AI生成统计结果表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `enterprise_id` | `bigint` | `` |  |
| `project_id` | `bigint` | `` |  |
| `create_by` | `character` | `varying(255)` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `update_by` | `character` | `varying(255)` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `interface_name` | `character` | `varying(255)` | 接口名称 |
| `interface_id` | `bigint` | `` |  |
| `cr_id` | `bigint` | `` | CR-ID |
| `stage_type` | `character` | `varying(100)` | 测试阶段：sit、uat |
| `system_id` | `bigint` | `` |  |
| `first_module_id` | `bigint` | `` |  |
| `second_module_id` | `bigint` | `` |  |
| `prompt_name` | `character` | `varying(500)` | 提示词类型 |
| `requirement_count` | `integer` | `DEFAULT 0` | 测试需求点总数 |
| `requirement_generate_count` | `integer` | `DEFAULT 0` | 测试需求点生成总数 |
| `requirement_generate_adopt_count` | `integer` | `DEFAULT 0` | 测试需求点，采纳总数 |
| `requirement_adopt_keep_count` | `integer` | `DEFAULT 0` | 测试需求点，采纳留存数 |
| `full_adopt_requirement_count` | `integer` | `DEFAULT 0` | 测试需求点，完全采纳总数 |
| `not_full_adopt_requirement_count` | `integer` | `DEFAULT 0` | 测试需求点，不完全采纳总数 |
| `requirement_adopt_rate` | `numeric(10` | `` | 测试需求点，采纳率 |
| `requirement_cover_rate` | `numeric(10` | `` | 测试需求点，覆盖率 |
| `requirement_available_rate` | `numeric(10` | `` | 测试需求点，直接可用率 |
| `case_count` | `integer` | `DEFAULT 0` | 案例总数 |
| `case_generate_count` | `integer` | `DEFAULT 0` | 案例生成总数 |
| `case_generate_adopt_count` | `integer` | `DEFAULT 0` | 案例，采纳总数 |
| `case_keep_adopt_count` | `integer` | `DEFAULT 0` | 案例，采纳留存数 |
| `full_adopt_case_count` | `integer` | `DEFAULT 0` | 案例，完全采纳总数 |
| `not_full_adopt_case_count` | `integer` | `DEFAULT 0` | 案例，不完全采纳总数 |
| `case_adopt_rate` | `numeric(10` | `` | 案例，采纳率 |
| `case_cover_rate` | `numeric(10` | `` | 案例，覆盖率 |
| `case_available_rate` | `numeric(10` | `` |  |
| `ai_case_issue_rate` | `numeric(10` | `` | 生成案例，关联缺陷占比 |
| `rule_count` | `integer` | `DEFAULT 0` | 规则总数（生成） |
| `rule_adopt_count` | `integer` | `DEFAULT 0` | 规则采纳数 |
| `rule_adopt_rate` | `numeric(10` | `` | 规则采纳数率 |


## Table: `ai_requirement_data_record`

**表注释**: 测试需求点生成数据记录表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `requirement_id` | `bigint` | `NOT NULL` |  |
| `create_time` | `timestamp(6)` | `without time zone` |  |
| `create_by` | `character` | `varying(100)` |  |
| `update_time` | `timestamp(6)` | `without time zone` |  |
| `update_by` | `character` | `varying(100)` |  |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目组ID |
| `cr_id` | `bigint` | `` | CR-ID |
| `stage_type` | `character` | `varying(100)` | CR名称 |
| `requirement_name` | `character` | `varying(1500)` | 需求点名字 |
| `requirement_desc` | `character` | `varying(500)` | 需求点描述 |
| `system_id` | `bigint` | `` | 系统id |
| `first_module_id` | `bigint` | `` | 一级模块id |
| `second_module_id` | `bigint` | `` | 二级模块id |
| `interface_name` | `character` | `varying(500)` | 测试接口名称 |
| `priority` | `integer` | `` | 重要性：1-高，2-中，3-低 |
| `prompt_id` | `bigint` | `` | 测试需求点类型ID |
| `prompt_name` | `character` | `varying(250)` | 测试需求点类型 |
| `node_id` | `character` | `varying(64)` | 接口节点ID |
| `adopt_type` | `character` | `varying(5)` | 采纳类型，1-采纳 2-部分采纳 3-不采纳 |
| `generate_code` | `character` | `varying(100)` | 生成编号 |
| `stageversion_id` | `bigint` | `` |  |


## Table: `external_tool_config`

**表注释**: 外部工具配置表


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `tool_id` | `bigint` | `NOT NULL` | 工具id |
| `tool_name` | `character` | `varying(200)` | 工具名称 |
| `tool_desc` | `character` | `varying(200)` | 描述 |
| `tool_type` | `integer` | `` | 工具类型（1：数据准备平台 2：自定义工具） |
| `business_env` | `character` | `varying(255)` | 业务环境 |
| `data_product` | `character` | `varying(50)` | 数据产品 |
| `valid_flag` | `integer` | `` | 是否有效（0：无效 1：有效） |
| `return_field` | `text` | `` | 返回字段 |
| `param` | `character` | `varying(500)` | 参数 |
| `return_content_example` | `text` | `` | 返回内容示例配置 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `enterprise_id` | `bigint` | `` | 企业ID |
| `project_id` | `bigint` | `` | 项目ID |


## Table: `test_auto_back_task_user_statistics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` |  |
| `stageversion_id` | `bigint` | `` |  |
| `stageversion_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `task_id` | `bigint` | `` |  |
| `task_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `task_status` | `bigint` | `` |  |
| `stats_method` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `case_stage_type` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `system_id` | `bigint` | `` |  |
| `system_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `user_id` | `bigint` | `` |  |
| `user_real_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `user_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `group_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `dept_id` | `bigint` | `` |  |
| `dept_name` | `character` | `varying(100) DEFAULT NULL::character varying` |  |
| `case_count` | `integer` | `DEFAULT 0` |  |
| `manual_case_count` | `integer` | `DEFAULT 0` |  |
| `auto_case_count` | `integer` | `DEFAULT 0` |  |
| `case_exec_count` | `integer` | `DEFAULT 0` |  |
| `case_exec_passed_count` | `integer` | `DEFAULT 0` |  |
| `manual_exec_count` | `integer` | `DEFAULT 0` |  |
| `manual_exec_passed_count` | `integer` | `DEFAULT 0` |  |
| `auto_exec_count` | `integer` | `DEFAULT 0` |  |
| `auto_exec_passed_count` | `integer` | `DEFAULT 0` |  |
| `inter_face_auto_exec_count` | `integer` | `DEFAULT 0` |  |
| `inter_face_auto_exec_passed_count` | `integer` | `DEFAULT 0` |  |
| `create_by` | `character` | `varying(64) DEFAULT NULL::character varying` |  |
| `create_time` | `timestamp` | `without time zone` |  |
| `update_by` | `character` | `varying(64) DEFAULT NULL::character varying` |  |
| `update_time` | `timestamp` | `without time zone` |  |
| `stats_date` | `character` | `varying(100) DEFAULT NULL::character varying` |  |


## Table: `test_auto_inspect_statistics_report`

| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | 主键id |
| `task_id` | `bigint` | `` | 任务id |
| `task_name` | `character` | `varying(255)` | 任务标题 |
| `task_type` | `tinyint` | `` | 任务类型 |
| `task_status` | `tinyint` | `` | 任务状态 |
| `task_system_id` | `bigint` | `` | 任务关联系统Id |
| `task_system_name` | `character` | `varying(255)` | 系统名称 |
| `case_system_id` | `bigint` | `` | 案例关联系统Id |
| `case_system_name` | `character` | `varying(255)` | 案例关联系统名称 |
| `case_stage_type` | `character` | `varying(10)` | 测试阶段 |
| `user_id` | `bigint` | `` | 用户id |
| `user_real_name` | `character` | `varying(100)` | 用户名称 |
| `user_name` | `character` | `varying(100)` | 用户账号 |
| `dept_id` | `bigint` | `` | 部门id |
| `dept_name` | `character` | `varying(255)` | 部门名称 |
| `group_name` | `character` | `varying(100)` | 用户组别 |
| `stats_date` | `character` | `varying(100)` | 最后一次执行时间 |
| `case_exec_count` | `integer` | `` | 案例执行数 |
| `case_exec_success_count` | `integer` | `` | 案例执行成功数 |
| `case_auto_exec_count` | `integer` | `` | 自动化执行过数 |
| `case_auto_exec_success_count` | `integer` | `` | 自动化执行成功过数 |
| `case_interface_auto_exec_count` | `integer` | `` | 接口自动化执行过数 |
| `case_interface_auto_exec_success_count` | `integer` | `` | 接口自动化执行过成功数 |
| `create_by` | `character` | `varying(64)` | 创建人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_by` | `character` | `varying(64)` | 更新人 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |


## Table: `outside_tool_data_num`

**表注释**: 外部工具数据统计情况


| 列名 | 数据类型 | 约束 | 注释 |
|-------------|-----------|-------------|-------------|
| `id` | `bigint` | `NOT NULL` | id |
| `create_by` | `character` | `varying(100)` | 创建人 |
| `update_by` | `character` | `varying(100)` | 更新人 |
| `create_time` | `timestamp` | `without time zone` | 创建时间 |
| `update_time` | `timestamp` | `without time zone` | 更新时间 |
| `case_id` | `character` | `varying NOT NULL` | 案例id |
| `generate_data_num` | `integer` | `` | 生成数据条数 |
| `matching_data_num` | `integer` | `` | 匹配数据条数 |
| `accept_data_num` | `integer` | `` | 采纳数据条数 |

