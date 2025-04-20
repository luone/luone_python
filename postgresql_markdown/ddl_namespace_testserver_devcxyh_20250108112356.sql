

-- Name: testserver_devcxyh; Type: Schema; Schema:  ;

CREATE SCHEMA testserver_devcxyh ;

SET search_path = testserver_devcxyh ;



-- Name: platform_component_id_sequence; Type: Sequence; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

 CREATE SEQUENCE platform_component_id_sequence
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 NO MAXVALUE 
 CACHE 1;

-- Name: platform_version_id_sequence; Type: Sequence; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

 CREATE SEQUENCE platform_version_id_sequence
 START  WITH  1
 INCREMENT  BY  1
 NO MINVALUE  
 NO MAXVALUE 
 CACHE 1;

-- Name: ai_token_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_token_config (
    token_id bigint NOT NULL,
    create_by character varying(50),
    update_by character varying(50),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    enterprise_id bigint,
    project_id bigint,
    tokens integer,
    del_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN ai_token_config.token_id IS 'token_id';
COMMENT ON COLUMN ai_token_config.create_by IS '创建人';
COMMENT ON COLUMN ai_token_config.update_by IS '更新人';
COMMENT ON COLUMN ai_token_config.create_time IS '创建时间';
COMMENT ON COLUMN ai_token_config.update_time IS '更新时间';
COMMENT ON COLUMN ai_token_config.enterprise_id IS '企业id';
COMMENT ON COLUMN ai_token_config.project_id IS '项目id';
COMMENT ON COLUMN ai_token_config.tokens IS 'token长度参数';
COMMENT ON COLUMN ai_token_config.del_flag IS '删除类型： 0-正常，1-删除';
ALTER TABLE ai_token_config ADD CONSTRAINT ai_token_config_pkey PRIMARY KEY USING ubtree  (token_id) WITH (storage_type=USTORE);

-- Name: auto_exec_configure; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE auto_exec_configure (
    conf_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT '0'::bpchar,
    exec_style character(1),
    exec_type character(1),
    send_mail character(1),
    task_id bigint NOT NULL,
    script_type character varying(100) NOT NULL,
    cron character varying(50),
    single_count integer,
    total_count integer,
    cycle_start_time timestamp without time zone,
    cycle_end_time timestamp without time zone,
    exec_num integer DEFAULT 0,
    exec_status character(1) DEFAULT '0'::bpchar,
    timed_type integer,
    exec_json_info text,
    enabled boolean,
    custom_job_rule character varying(1000),
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE auto_exec_configure IS '执行配置表';
COMMENT ON COLUMN auto_exec_configure.conf_id IS '执行配置id';
COMMENT ON COLUMN auto_exec_configure.create_by IS '创建人';
COMMENT ON COLUMN auto_exec_configure.update_by IS '更新人';
COMMENT ON COLUMN auto_exec_configure.create_time IS '创建时间';
COMMENT ON COLUMN auto_exec_configure.update_time IS '更新时间';
COMMENT ON COLUMN auto_exec_configure.del_flag IS '是否删除 0-不是，1-是';
COMMENT ON COLUMN auto_exec_configure.exec_style IS '执行策略 0-立即执行，1-定时执行';
COMMENT ON COLUMN auto_exec_configure.exec_type IS '执行类型 0-串行 1-随机';
COMMENT ON COLUMN auto_exec_configure.send_mail IS '是否发送邮件 0-否 1-是';
COMMENT ON COLUMN auto_exec_configure.task_id IS '执行任务id';
COMMENT ON COLUMN auto_exec_configure.script_type IS '关联脚本种类';
COMMENT ON COLUMN auto_exec_configure.cron IS '七子表达式';
COMMENT ON COLUMN auto_exec_configure.single_count IS '单个执行次数';
COMMENT ON COLUMN auto_exec_configure.total_count IS '执行总次数';
COMMENT ON COLUMN auto_exec_configure.cycle_start_time IS '执行周期-开始时间';
COMMENT ON COLUMN auto_exec_configure.cycle_end_time IS '执行周期-结束时间';
COMMENT ON COLUMN auto_exec_configure.exec_num IS '执行的真实次数';
COMMENT ON COLUMN auto_exec_configure.exec_status IS '执行状态 0-未执行，1-执行中，2-未执行';
COMMENT ON COLUMN auto_exec_configure.timed_type IS '定时类型 0-指定时间，1-定点时间，3-周期执行';
COMMENT ON COLUMN auto_exec_configure.exec_json_info IS '提测参数json';
COMMENT ON COLUMN auto_exec_configure.enabled IS '是否启用';
COMMENT ON COLUMN auto_exec_configure.custom_job_rule IS '周期执行配置策略';
COMMENT ON COLUMN auto_exec_configure.project_id IS '项目组id';
COMMENT ON COLUMN auto_exec_configure.enterprise_id IS '企业id';
ALTER TABLE auto_exec_configure ADD CONSTRAINT auto_exec_configure_pkey PRIMARY KEY USING ubtree  (conf_id) WITH (storage_type=USTORE);

-- Name: auto_exec_info; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE auto_exec_info (
    exec_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT '0'::bpchar,
    task_id bigint NOT NULL,
    script_type character varying(100) NOT NULL,
    conf_id bigint NOT NULL,
    exec_style character(1),
    exec_type character(1),
    exec_status character(1) DEFAULT '0'::bpchar,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    exec_duration character varying(100),
    exec_user_id bigint,
    exec_conf_json text,
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE auto_exec_info IS '执行配置表';
COMMENT ON COLUMN auto_exec_info.exec_id IS '执行配置id';
COMMENT ON COLUMN auto_exec_info.create_by IS '创建人';
COMMENT ON COLUMN auto_exec_info.update_by IS '更新人';
COMMENT ON COLUMN auto_exec_info.create_time IS '创建时间';
COMMENT ON COLUMN auto_exec_info.update_time IS '更新时间';
COMMENT ON COLUMN auto_exec_info.del_flag IS '是否删除 0-不是，1-是';
COMMENT ON COLUMN auto_exec_info.task_id IS '执行任务id';
COMMENT ON COLUMN auto_exec_info.script_type IS '关联脚本种类';
COMMENT ON COLUMN auto_exec_info.conf_id IS '配置id';
COMMENT ON COLUMN auto_exec_info.exec_style IS '执行策略 0-立即执行，1-定时执行';
COMMENT ON COLUMN auto_exec_info.exec_type IS '执行类型 0-串行 1-随机';
COMMENT ON COLUMN auto_exec_info.exec_status IS '执行状态 0-未执行  1-执行中  2-成功  3-失败  4-停止';
COMMENT ON COLUMN auto_exec_info.start_time IS '执行开始时间';
COMMENT ON COLUMN auto_exec_info.end_time IS '执行结束时间';
COMMENT ON COLUMN auto_exec_info.exec_duration IS '执行时长';
COMMENT ON COLUMN auto_exec_info.exec_user_id IS '执行人';
COMMENT ON COLUMN auto_exec_info.exec_conf_json IS '执行配置的json';
COMMENT ON COLUMN auto_exec_info.project_id IS '项目组id';
COMMENT ON COLUMN auto_exec_info.enterprise_id IS '企业id';
ALTER TABLE auto_exec_info ADD CONSTRAINT auto_exec_info_pkey PRIMARY KEY USING ubtree  (exec_id) WITH (storage_type=USTORE);

-- Name: case_metrics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE case_metrics_report (
    id bigint NOT NULL,
    cr_id bigint,
    cr_name character varying(255),
    cr_code character varying(255),
    cr_online_time timestamp without time zone,
    case_id character varying(50),
    case_name character varying(2000),
    case_designer_id bigint,
    case_designer_name character varying(255),
    case_designer_group_name character varying(255),
    related_issue character varying(50),
    auto_exec_flag boolean,
    case_stage_type character varying(10),
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone,
    system_id bigint,
    system_name character varying(255),
    system_manager_dept_id bigint,
    system_manager_dept_name character varying(255),
    first_module_id bigint,
    first_module_name character varying(255),
    second_module_id bigint,
    second_module_name character varying(255),
    stage_version_id bigint,
    stage_version_name character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN case_metrics_report.id IS '主键id';
COMMENT ON COLUMN case_metrics_report.cr_id IS 'CRId';
COMMENT ON COLUMN case_metrics_report.cr_name IS 'CR名称';
COMMENT ON COLUMN case_metrics_report.cr_code IS 'CR编码';
COMMENT ON COLUMN case_metrics_report.cr_online_time IS 'CR上线时间';
COMMENT ON COLUMN case_metrics_report.case_id IS '案例Id';
COMMENT ON COLUMN case_metrics_report.case_name IS '案例名称';
COMMENT ON COLUMN case_metrics_report.case_designer_id IS '案例设计人Id';
COMMENT ON COLUMN case_metrics_report.case_designer_name IS '案例设计人名称';
COMMENT ON COLUMN case_metrics_report.case_designer_group_name IS '案例设计人组别';
COMMENT ON COLUMN case_metrics_report.related_issue IS '关联缺陷';
COMMENT ON COLUMN case_metrics_report.auto_exec_flag IS '是否自动化案例';
COMMENT ON COLUMN case_metrics_report.case_stage_type IS '阶段版本标识(sit,uat)';
COMMENT ON COLUMN case_metrics_report.create_by IS '创建人';
COMMENT ON COLUMN case_metrics_report.create_time IS '创建时间';
COMMENT ON COLUMN case_metrics_report.update_by IS '更新人';
COMMENT ON COLUMN case_metrics_report.update_time IS '更新时间';
COMMENT ON COLUMN case_metrics_report.system_id IS '系统ID';
COMMENT ON COLUMN case_metrics_report.system_name IS '系统名称';
COMMENT ON COLUMN case_metrics_report.system_manager_dept_id IS '系统负责人所属处室id';
COMMENT ON COLUMN case_metrics_report.system_manager_dept_name IS '系统负责人所属处室名称';
COMMENT ON COLUMN case_metrics_report.first_module_id IS '一级模块ID';
COMMENT ON COLUMN case_metrics_report.first_module_name IS '一级模块名称';
COMMENT ON COLUMN case_metrics_report.second_module_id IS '二级模块ID';
COMMENT ON COLUMN case_metrics_report.second_module_name IS '二级模块名称';
COMMENT ON COLUMN case_metrics_report.stage_version_id IS '阶段版本';
COMMENT ON COLUMN case_metrics_report.stage_version_name IS '阶段版本名称';
ALTER TABLE case_metrics_report ADD CONSTRAINT case_metrics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: cockpit_common_function; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE cockpit_common_function (
    cockpit_id character varying(64) NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    name character varying(128),
    power_name character varying(128) NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE cockpit_common_function IS '驾驶舱常用功能配置表';
COMMENT ON COLUMN cockpit_common_function.cockpit_id IS '驾驶舱Id';
COMMENT ON COLUMN cockpit_common_function.name IS '功能名称';
COMMENT ON COLUMN cockpit_common_function.power_name IS '权限名称';
ALTER TABLE cockpit_common_function ADD CONSTRAINT cockpit_common_function_pk PRIMARY KEY USING ubtree  (cockpit_id, power_name) WITH (storage_type=USTORE);

-- Name: cr_actual_release_manage_time; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE cr_actual_release_manage_time (
    cr_id bigint NOT NULL,
    sit_actual_release_manage_time timestamp(6) without time zone,
    uat_actual_release_manage_time timestamp(6) without time zone,
    import_date timestamp(6) without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE cr_actual_release_manage_time IS 'CR实际发布管理时间表';
COMMENT ON COLUMN cr_actual_release_manage_time.cr_id IS 'CRid';
COMMENT ON COLUMN cr_actual_release_manage_time.sit_actual_release_manage_time IS 'sit实际发布管理时间';
COMMENT ON COLUMN cr_actual_release_manage_time.uat_actual_release_manage_time IS 'uat实际发布管理时间';
COMMENT ON COLUMN cr_actual_release_manage_time.import_date IS '导入时间';
ALTER TABLE cr_actual_release_manage_time ADD CONSTRAINT cr_actual_release_manage_time_pkey PRIMARY KEY USING ubtree  (cr_id) WITH (storage_type=USTORE);

-- Name: cr_metrics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE cr_metrics_report (
    cr_id bigint NOT NULL,
    cr_name character varying(255),
    stage_version_id bigint,
    stage_version_name character varying(255),
    cr_proposer_dept_name character varying(200),
    dev_dept_name character varying(200),
    cr_online_time timestamp without time zone,
    delayed_release_flag boolean,
    sit_test_case_reuse_rate real,
    uat_test_case_reuse_rate real,
    sit_positive_negative_ratio real,
    uat_positive_negative_ratio real,
    sit_test_case_density numeric(10,2),
    uat_test_case_density real,
    sit_req_change_test_case_change_rate real,
    uat_req_change_test_case_change_rate real,
    sit_test_case_hit_rate real,
    uat_test_case_hit_rate real,
    sit_effective_defect_rate real,
    uat_effective_defect_rate real,
    defect_escape_rate real,
    uat_accepted_flag boolean,
    sit_accepted_flag boolean,
    test_phase_req_change_flag boolean,
    sit_smoke_test_passed_rate real,
    uat_smoke_test_passed_rate real,
    sit_smoke_test_flag boolean,
    sit_smoke_test_all_passed_flag boolean,
    uat_smoke_test_flag boolean,
    uat_smoke_test_all_passed_flag boolean,
    sit_delayed_release_flag boolean,
    uat_delayed_release_flag boolean,
    code_defect_percentage real,
    avg_defect_resolution_time real,
    code_type_defect_rate real,
    requirement_type_defect_rate real,
    env_type_defect_rate real,
    optimization_type_defect_rate real,
    design_type_defect_rate real,
    data_type_defect_rate real,
    param_type_defect_rate real,
    fun_spec_type_defect_rate real,
    itil_type_defect_rate real,
    delayed_defect_resolution_percentage real,
    blocked_defect_rate real,
    critical_major_defect_percentage real,
    defect_rejection_rate real,
    uat_compliant_flag boolean,
    product_risk_level_distribution_percentage real,
    sit_cr_testing_duration real,
    uat_cr_testing_duration real,
    excessive_micro_flag boolean,
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone,
    micro_flag boolean,
    issue_density real,
    risk_issue_rate real,
    cr_type character varying(200),
    cr_process_name character varying(200),
    cr_automated_case_execute_count integer,
    cr_case_execute_count integer,
    cr_automated_test_execute_rate real,
    cr_sit_automated_case_execute_count integer,
    cr_sit_case_execute_count integer,
    cr_sit_automated_test_execute_rate real,
    cr_uat_automated_case_execute_count integer,
    cr_uat_case_execute_count integer,
    cr_uat_automated_test_execute_rate real,
    automated_test_flag boolean,
    cr_automated_case_count integer,
    cr_case_count integer,
    cr_automated_test_case_converage_rate real,
    sit_automated_test_case_from_case_library_count integer,
    sit_automated_test_case_count integer,
    sit_automated_test_case_reuse_rate real,
    uat_automated_test_case_from_case_library_count integer,
    uat_automated_test_case_count integer,
    uat_automated_test_case_reuse_rate real,
    cr_risk_count integer,
    risk_issue_count integer,
    product_risk_level_distribution_count integer,
    critical_major_defect_count integer,
    sit_lib_case_import_count integer,
    sit_case_count integer,
    uat_lib_case_import_count integer,
    uat_case_count integer,
    sit_positive_count integer,
    sit_negative_count integer,
    uat_positive_count integer,
    uat_negative_count integer,
    sit_second_module_count integer,
    uat_second_module_count integer,
    sit_case_relate_issue_count integer,
    uat_case_relate_issue_count integer,
    sit_effective_issue_count integer,
    sit_issue_count integer,
    uat_effective_issue_count integer,
    uat_issue_count integer,
    code_defect_count integer,
    effective_issue_count integer,
    requirement_type_defect_count integer,
    env_type_defect_count integer,
    optimization_type_defect_count integer,
    design_type_defect_count integer,
    data_type_defect_count integer,
    param_type_defect_count integer,
    fun_spec_type_defect_count integer,
    itil_type_defect_count integer,
    blocked_defect_count integer,
    other_type_defect_count integer,
    have_question_effective_issue_count integer,
    sit_req_change_case_count integer,
    uat_req_change_case_count integer,
    total_functional_points integer,
    agile_flag character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN cr_metrics_report.cr_name IS 'CR名称';
COMMENT ON COLUMN cr_metrics_report.stage_version_id IS '阶段版本id';
COMMENT ON COLUMN cr_metrics_report.stage_version_name IS '阶段版本名称';
COMMENT ON COLUMN cr_metrics_report.cr_proposer_dept_name IS '需求提出部门';
COMMENT ON COLUMN cr_metrics_report.dev_dept_name IS '开发处室';
COMMENT ON COLUMN cr_metrics_report.cr_online_time IS 'CR上线时间';
COMMENT ON COLUMN cr_metrics_report.delayed_release_flag IS '是否延期发布';
COMMENT ON COLUMN cr_metrics_report.sit_test_case_reuse_rate IS 'SIT 测试案例复用率';
COMMENT ON COLUMN cr_metrics_report.uat_test_case_reuse_rate IS 'UAT 测试案例复用率';
COMMENT ON COLUMN cr_metrics_report.sit_positive_negative_ratio IS 'SIT 正向/反向案例比';
COMMENT ON COLUMN cr_metrics_report.uat_positive_negative_ratio IS 'UAT 正向/反向案例比';
COMMENT ON COLUMN cr_metrics_report.sit_test_case_density IS 'SIT 案例密度';
COMMENT ON COLUMN cr_metrics_report.uat_test_case_density IS 'UAT 案例密度';
COMMENT ON COLUMN cr_metrics_report.sit_req_change_test_case_change_rate IS 'SIT 需求变更测试案例变更率';
COMMENT ON COLUMN cr_metrics_report.uat_req_change_test_case_change_rate IS 'UAT 需求变更测试案例变更率';
COMMENT ON COLUMN cr_metrics_report.sit_test_case_hit_rate IS 'SIT 测试案例命中率';
COMMENT ON COLUMN cr_metrics_report.uat_test_case_hit_rate IS 'UAT 测试案例命中率';
COMMENT ON COLUMN cr_metrics_report.sit_effective_defect_rate IS 'SIT 有效缺陷率';
COMMENT ON COLUMN cr_metrics_report.uat_effective_defect_rate IS 'UAT 有效缺陷率';
COMMENT ON COLUMN cr_metrics_report.defect_escape_rate IS '缺陷逃逸率';
COMMENT ON COLUMN cr_metrics_report.uat_accepted_flag IS 'UAT 是否承接且投产';
COMMENT ON COLUMN cr_metrics_report.sit_accepted_flag IS 'SIT 是否承接且投产';
COMMENT ON COLUMN cr_metrics_report.test_phase_req_change_flag IS '是否测试阶段需求变更';
COMMENT ON COLUMN cr_metrics_report.sit_smoke_test_passed_rate IS 'SIT 冒烟测试通过率';
COMMENT ON COLUMN cr_metrics_report.uat_smoke_test_passed_rate IS 'UAT 冒烟测试通过率';
COMMENT ON COLUMN cr_metrics_report.sit_smoke_test_flag IS 'SIT 是否有冒烟测试';
COMMENT ON COLUMN cr_metrics_report.sit_smoke_test_all_passed_flag IS 'SIT 冒烟测试是否全部通过';
COMMENT ON COLUMN cr_metrics_report.uat_smoke_test_flag IS ' UAT 是否有冒烟测试';
COMMENT ON COLUMN cr_metrics_report.uat_smoke_test_all_passed_flag IS ' UAT 冒烟测试是否全部通过';
COMMENT ON COLUMN cr_metrics_report.sit_delayed_release_flag IS 'SIT 是否延期上版';
COMMENT ON COLUMN cr_metrics_report.uat_delayed_release_flag IS ' UAT 是否延期上版';
COMMENT ON COLUMN cr_metrics_report.code_defect_percentage IS '代码类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.avg_defect_resolution_time IS '缺陷平均停留时长';
COMMENT ON COLUMN cr_metrics_report.code_type_defect_rate IS '代码类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.requirement_type_defect_rate IS '需求类类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.env_type_defect_rate IS '环境类类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.optimization_type_defect_rate IS '优化类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.design_type_defect_rate IS '设计类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.data_type_defect_rate IS '数据类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.param_type_defect_rate IS '参数类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.fun_spec_type_defect_rate IS '功能规格类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.itil_type_defect_rate IS 'itil类缺陷占比';
COMMENT ON COLUMN cr_metrics_report.delayed_defect_resolution_percentage IS '缺陷延迟修复占比';
COMMENT ON COLUMN cr_metrics_report.blocked_defect_rate IS '阻塞缺陷率';
COMMENT ON COLUMN cr_metrics_report.critical_major_defect_percentage IS '致命/严重缺陷占比';
COMMENT ON COLUMN cr_metrics_report.defect_rejection_rate IS '缺陷不通过率';
COMMENT ON COLUMN cr_metrics_report.uat_compliant_flag IS '用户验收测试是否达标';
COMMENT ON COLUMN cr_metrics_report.product_risk_level_distribution_percentage IS '产品风险等级占比';
COMMENT ON COLUMN cr_metrics_report.sit_cr_testing_duration IS '单个 CR 在 SIT 阶段执行测试时长';
COMMENT ON COLUMN cr_metrics_report.uat_cr_testing_duration IS '单个 CR 在 UAT 阶段执行测试时长';
COMMENT ON COLUMN cr_metrics_report.excessive_micro_flag IS '是否属于超标微需求';
COMMENT ON COLUMN cr_metrics_report.create_by IS '创建人';
COMMENT ON COLUMN cr_metrics_report.create_time IS '创建时间';
COMMENT ON COLUMN cr_metrics_report.update_by IS '更新人';
COMMENT ON COLUMN cr_metrics_report.update_time IS '更新时间';
COMMENT ON COLUMN cr_metrics_report.micro_flag IS '是否是微需求';
COMMENT ON COLUMN cr_metrics_report.issue_density IS '缺陷密度';
COMMENT ON COLUMN cr_metrics_report.risk_issue_rate IS '关联风险缺陷占比';
COMMENT ON COLUMN cr_metrics_report.cr_type IS 'cr类型';
COMMENT ON COLUMN cr_metrics_report.cr_process_name IS '测试过程类型';
COMMENT ON COLUMN cr_metrics_report.cr_automated_case_execute_count IS 'CR自动化案例执行总次数';
COMMENT ON COLUMN cr_metrics_report.cr_case_execute_count IS 'CR案例执行总次数';
COMMENT ON COLUMN cr_metrics_report.cr_automated_test_execute_rate IS 'CR自动化测试执行占比';
COMMENT ON COLUMN cr_metrics_report.cr_sit_automated_case_execute_count IS 'CR-SIT自动化案例执行总次数';
COMMENT ON COLUMN cr_metrics_report.cr_sit_case_execute_count IS 'CR-SIT案例执行总次数';
COMMENT ON COLUMN cr_metrics_report.cr_sit_automated_test_execute_rate IS 'CR-SIT自动化测试执行占比';
COMMENT ON COLUMN cr_metrics_report.cr_uat_automated_case_execute_count IS 'CR-UAT自动化案例执行总次数';
COMMENT ON COLUMN cr_metrics_report.cr_uat_case_execute_count IS 'CR-UAT案例执行总次数';
COMMENT ON COLUMN cr_metrics_report.cr_uat_automated_test_execute_rate IS 'CR-UAT自动化测试执行占比';
COMMENT ON COLUMN cr_metrics_report.automated_test_flag IS '是否应用自动化测试';
COMMENT ON COLUMN cr_metrics_report.cr_automated_case_count IS 'CR自动化案例数量';
COMMENT ON COLUMN cr_metrics_report.cr_case_count IS 'CR案例总数';
COMMENT ON COLUMN cr_metrics_report.cr_automated_test_case_converage_rate IS 'CR自动化测试案例覆盖率';
COMMENT ON COLUMN cr_metrics_report.sit_automated_test_case_from_case_library_count IS 'sit从案例库引入自动化案例总数';
COMMENT ON COLUMN cr_metrics_report.sit_automated_test_case_count IS 'sit自动化案例总数';
COMMENT ON COLUMN cr_metrics_report.sit_automated_test_case_reuse_rate IS 'SIT自动化测试案例复用率';
COMMENT ON COLUMN cr_metrics_report.uat_automated_test_case_from_case_library_count IS 'uat从案例库引入自动化案例总数';
COMMENT ON COLUMN cr_metrics_report.uat_automated_test_case_count IS 'uat自动化案例总数';
COMMENT ON COLUMN cr_metrics_report.uat_automated_test_case_reuse_rate IS 'UAT自动化测试案例复用率';
COMMENT ON COLUMN cr_metrics_report.cr_risk_count IS 'CR风险总数';
COMMENT ON COLUMN cr_metrics_report.risk_issue_count IS '关联风险缺陷数量';
COMMENT ON COLUMN cr_metrics_report.product_risk_level_distribution_count IS '重大/较大产品风险个数';
COMMENT ON COLUMN cr_metrics_report.critical_major_defect_count IS '阻塞和严重缺陷总数';
COMMENT ON COLUMN cr_metrics_report.sit_lib_case_import_count IS 'SIT从案例库引入案例数量';
COMMENT ON COLUMN cr_metrics_report.sit_case_count IS 'SIT案例总数';
COMMENT ON COLUMN cr_metrics_report.uat_lib_case_import_count IS 'UAT从案例库引入案例数量';
COMMENT ON COLUMN cr_metrics_report.uat_case_count IS 'UAT案例总数';
COMMENT ON COLUMN cr_metrics_report.sit_positive_count IS 'SIT正向案例数';
COMMENT ON COLUMN cr_metrics_report.sit_negative_count IS 'SIT反向案例数';
COMMENT ON COLUMN cr_metrics_report.uat_positive_count IS 'SIT正向案例数';
COMMENT ON COLUMN cr_metrics_report.uat_negative_count IS 'SIT反向案例数';
COMMENT ON COLUMN cr_metrics_report.sit_second_module_count IS 'SIT案例二级模块数';
COMMENT ON COLUMN cr_metrics_report.uat_second_module_count IS 'UAT案例二级模块数';
COMMENT ON COLUMN cr_metrics_report.sit_case_relate_issue_count IS 'SIT案例关联的缺陷总数';
COMMENT ON COLUMN cr_metrics_report.uat_case_relate_issue_count IS 'UAT案例关联的缺陷总数';
COMMENT ON COLUMN cr_metrics_report.sit_effective_issue_count IS 'SIT有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.sit_issue_count IS 'SIT缺陷总数';
COMMENT ON COLUMN cr_metrics_report.uat_effective_issue_count IS 'UAT有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.uat_issue_count IS 'UAT缺陷总数';
COMMENT ON COLUMN cr_metrics_report.code_defect_count IS '代码类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.effective_issue_count IS '有效缺陷总数';
COMMENT ON COLUMN cr_metrics_report.requirement_type_defect_count IS '需求类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.env_type_defect_count IS '环境类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.optimization_type_defect_count IS '优化类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.design_type_defect_count IS '设计类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.data_type_defect_count IS '数据类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.param_type_defect_count IS '参数类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.fun_spec_type_defect_count IS '功能规格类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.itil_type_defect_count IS 'itil类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.blocked_defect_count IS '阻塞缺陷数量';
COMMENT ON COLUMN cr_metrics_report.other_type_defect_count IS '其他类有效缺陷数';
COMMENT ON COLUMN cr_metrics_report.have_question_effective_issue_count IS '有问题分类有效缺陷总数';
COMMENT ON COLUMN cr_metrics_report.sit_req_change_case_count IS 'SIT需求变更案例数量';
COMMENT ON COLUMN cr_metrics_report.uat_req_change_case_count IS 'UAT需求变更案例数量';
COMMENT ON COLUMN cr_metrics_report.total_functional_points IS '总功能点数';
COMMENT ON COLUMN cr_metrics_report.agile_flag IS '是否敏捷，1是，其他否';
ALTER TABLE cr_metrics_report ADD CONSTRAINT cr_metrics_report_pkey PRIMARY KEY USING ubtree  (cr_id) WITH (storage_type=USTORE);

-- Name: cr_file; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE cr_file (
    id bigint NOT NULL,
    create_by character varying(256),
    create_time timestamp without time zone,
    update_by character varying(256),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    file_type integer,
    file_name character varying(256),
    file_path character varying(256),
    file_version character varying(10),
    vp_flag integer,
    sub_flag integer,
    del_flag character(1),
    system_name character varying(256),
    sub_time timestamp without time zone,
    vp_cr_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE cr_file IS 'CR文档表';
COMMENT ON COLUMN cr_file.id IS '主键id';
COMMENT ON COLUMN cr_file.create_by IS '创建人';
COMMENT ON COLUMN cr_file.create_time IS '创建时间';
COMMENT ON COLUMN cr_file.update_by IS '更新人';
COMMENT ON COLUMN cr_file.update_time IS '更新时间';
COMMENT ON COLUMN cr_file.enterprise_id IS '企业Id';
COMMENT ON COLUMN cr_file.project_id IS '项目组id';
COMMENT ON COLUMN cr_file.cr_id IS 'crId';
COMMENT ON COLUMN cr_file.file_type IS '文件类型 0：需求规格说明书，1：概要设计说明书，2：业务需求书，3：详细设计说明书，4：项目需求用户验收测试报告，5：项目系统集成测试报告，6：整体测试计划';
COMMENT ON COLUMN cr_file.file_name IS '文件名';
COMMENT ON COLUMN cr_file.file_path IS '下载路径';
COMMENT ON COLUMN cr_file.file_version IS '版本号';
COMMENT ON COLUMN cr_file.vp_flag IS '来源 0：本地，1：vp';
COMMENT ON COLUMN cr_file.sub_flag IS '提交vp标识 0：未提交，1：已提交';
COMMENT ON COLUMN cr_file.del_flag IS '删除标识 0：未删除，1：已删除';
COMMENT ON COLUMN cr_file.system_name IS '所属系统';
COMMENT ON COLUMN cr_file.sub_time IS '提交vp时间';
COMMENT ON COLUMN cr_file.vp_cr_id IS 'vp的crId';
ALTER TABLE cr_file ADD CONSTRAINT cr_file_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: custom_report_field_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE custom_report_field_relation (
    template_id bigint NOT NULL,
    field_id bigint NOT NULL,
    sort_flag integer,
    show_flag integer DEFAULT 1,
    default_flag integer DEFAULT 1
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE custom_report_field_relation IS '自定义报表模板和字段关系表';
COMMENT ON COLUMN custom_report_field_relation.template_id IS '自定义报表主键id';
COMMENT ON COLUMN custom_report_field_relation.field_id IS '字段id';
COMMENT ON COLUMN custom_report_field_relation.sort_flag IS '排序';
COMMENT ON COLUMN custom_report_field_relation.show_flag IS '显示标识';
COMMENT ON COLUMN custom_report_field_relation.default_flag IS '默认是否展示';
ALTER TABLE custom_report_field_relation ADD CONSTRAINT custom_report_field_relation_pk PRIMARY KEY USING ubtree  (template_id, field_id) WITH (storage_type=USTORE);

-- Name: custom_report_template; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE custom_report_template (
    template_id bigint NOT NULL,
    create_by character varying(255),
    create_time timestamp without time zone,
    update_by character varying(255),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    template_name character varying(128),
    template_code character varying(128),
    template_desc character varying(128),
    project_default smallint,
    system_flag smallint,
    del_flag character(1) DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE custom_report_template IS '自定义报表模板';
COMMENT ON COLUMN custom_report_template.template_id IS '主键id';
COMMENT ON COLUMN custom_report_template.create_by IS '创建人';
COMMENT ON COLUMN custom_report_template.create_time IS '创建时间';
COMMENT ON COLUMN custom_report_template.update_by IS '更新人';
COMMENT ON COLUMN custom_report_template.update_time IS '更新时间';
COMMENT ON COLUMN custom_report_template.enterprise_id IS '企业id';
COMMENT ON COLUMN custom_report_template.project_id IS '项目组id';
COMMENT ON COLUMN custom_report_template.template_name IS '模板名称';
COMMENT ON COLUMN custom_report_template.template_code IS '模板编码';
COMMENT ON COLUMN custom_report_template.template_desc IS '模板描述';
COMMENT ON COLUMN custom_report_template.project_default IS '项目初始值';
COMMENT ON COLUMN custom_report_template.system_flag IS '系统标识';
COMMENT ON COLUMN custom_report_template.del_flag IS '删除状态 0:正常 1:删除';
ALTER TABLE custom_report_template ADD CONSTRAINT custom_template_pk PRIMARY KEY USING ubtree  (template_id) WITH (storage_type=USTORE);

-- Name: evaluation_checks; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_checks (
    check_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT '0'::bpchar,
    plan_id bigint NOT NULL,
    task_id bigint,
    cr_id bigint NOT NULL,
    check_type integer NOT NULL,
    check_project integer NOT NULL,
    stage_type character varying(255),
    check_status integer,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_checks IS '后评价计划、任务检核项';
COMMENT ON COLUMN evaluation_checks.check_id IS '主键id';
COMMENT ON COLUMN evaluation_checks.create_by IS '创建人';
COMMENT ON COLUMN evaluation_checks.update_by IS '更新人';
COMMENT ON COLUMN evaluation_checks.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_checks.update_time IS '更新时间';
COMMENT ON COLUMN evaluation_checks.del_flag IS '删除标识';
COMMENT ON COLUMN evaluation_checks.plan_id IS '计划id';
COMMENT ON COLUMN evaluation_checks.task_id IS '任务id';
COMMENT ON COLUMN evaluation_checks.cr_id IS 'cr的id';
COMMENT ON COLUMN evaluation_checks.check_type IS '检核项 0-计划，1-任务';
COMMENT ON COLUMN evaluation_checks.check_project IS '检核项 0-需求分析，1-案例设计，2-案例执行，3-评审，4-风险，5-缺陷，6-生产问题';
COMMENT ON COLUMN evaluation_checks.stage_type IS '测试阶段';
COMMENT ON COLUMN evaluation_checks.check_status IS '检查项状态 0:未分配 1:已分配 2:已完成';
COMMENT ON COLUMN evaluation_checks.enterprise_id IS '企业ID';
COMMENT ON COLUMN evaluation_checks.project_id IS '项目ID';
ALTER TABLE evaluation_checks ADD CONSTRAINT evaluation_checks_pkey PRIMARY KEY USING ubtree  (check_id) WITH (storage_type=USTORE);

-- Name: evaluation_issue; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_issue (
    issue_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1),
    enterprise_id bigint,
    project_id bigint,
    plan_id bigint,
    task_id bigint,
    cr_id bigint,
    stageversion_id bigint,
    stage_type character varying(10),
    issue_name character varying(500),
    issue_level character varying(10),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    issue_circulate_user text,
    issue_type character varying(50),
    sub_issue_type character varying(50),
    issue_description character varying(1500),
    issue_remark character varying(1500),
    issue_cause_reason character varying(1500),
    issue_suggestion character varying(1500),
    issue_feedback character varying(1500),
    process_id bigint,
    issue_status bigint,
    issue_code character varying(100),
    pre_issue_status bigint,
    issue_transfer_state character varying(50),
    close_flag tinyint,
    overdue_flag tinyint,
    status_code character varying(50),
    effective_flag tinyint,
    find_user bigint,
    receive_user bigint,
    enter_state_time timestamp without time zone,
    issue_level_update_time timestamp without time zone,
    back_space_user bigint,
    close_time timestamp without time zone,
    overdue_day integer,
    opt_ids character varying(1024),
    rectification_reason character varying(1500)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_issue IS '后评价质量跟踪';
COMMENT ON COLUMN evaluation_issue.issue_id IS '主键id';
COMMENT ON COLUMN evaluation_issue.create_by IS '创建人';
COMMENT ON COLUMN evaluation_issue.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_issue.update_by IS '更新人';
COMMENT ON COLUMN evaluation_issue.update_time IS '更新时间';
COMMENT ON COLUMN evaluation_issue.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN evaluation_issue.enterprise_id IS '企业id ';
COMMENT ON COLUMN evaluation_issue.project_id IS '项目组id ';
COMMENT ON COLUMN evaluation_issue.plan_id IS '所属计划';
COMMENT ON COLUMN evaluation_issue.task_id IS '所属任务';
COMMENT ON COLUMN evaluation_issue.cr_id IS '所属cr';
COMMENT ON COLUMN evaluation_issue.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN evaluation_issue.stage_type IS '测试阶段 sit/uat';
COMMENT ON COLUMN evaluation_issue.issue_name IS '标题';
COMMENT ON COLUMN evaluation_issue.issue_level IS '严重程度';
COMMENT ON COLUMN evaluation_issue.start_time IS '开始时间';
COMMENT ON COLUMN evaluation_issue.end_time IS '截止时间';
COMMENT ON COLUMN evaluation_issue.issue_circulate_user IS '传阅人';
COMMENT ON COLUMN evaluation_issue.issue_type IS '问题类型';
COMMENT ON COLUMN evaluation_issue.sub_issue_type IS '问题子类';
COMMENT ON COLUMN evaluation_issue.issue_description IS '问题描述';
COMMENT ON COLUMN evaluation_issue.issue_remark IS '备注';
COMMENT ON COLUMN evaluation_issue.issue_cause_reason IS '问题产生原因';
COMMENT ON COLUMN evaluation_issue.issue_suggestion IS '整改措施';
COMMENT ON COLUMN evaluation_issue.issue_feedback IS '整改反馈';
COMMENT ON COLUMN evaluation_issue.process_id IS '流程id';
COMMENT ON COLUMN evaluation_issue.issue_status IS '缺陷状态';
COMMENT ON COLUMN evaluation_issue.issue_code IS '问题编号';
COMMENT ON COLUMN evaluation_issue.pre_issue_status IS '上一个缺陷状态';
COMMENT ON COLUMN evaluation_issue.issue_transfer_state IS '缺陷流转状态 ：create、transferring、close';
COMMENT ON COLUMN evaluation_issue.close_flag IS '是否关闭 1:是 0:否';
COMMENT ON COLUMN evaluation_issue.overdue_flag IS '是否超期 1:是 0:否';
COMMENT ON COLUMN evaluation_issue.status_code IS '状态编码';
COMMENT ON COLUMN evaluation_issue.effective_flag IS '是否有效 1:是 0:否';
COMMENT ON COLUMN evaluation_issue.find_user IS '发现人';
COMMENT ON COLUMN evaluation_issue.receive_user IS '接收人';
COMMENT ON COLUMN evaluation_issue.enter_state_time IS '状态变更时时间';
COMMENT ON COLUMN evaluation_issue.issue_level_update_time IS '重要程度变更时时间';
COMMENT ON COLUMN evaluation_issue.back_space_user IS '回退人';
COMMENT ON COLUMN evaluation_issue.close_time IS '缺陷关闭时间';
COMMENT ON COLUMN evaluation_issue.overdue_day IS '超期天数';
COMMENT ON COLUMN evaluation_issue.opt_ids IS '状态流转操作人';
COMMENT ON COLUMN evaluation_issue.rectification_reason IS '整改原因';
ALTER TABLE evaluation_issue ADD CONSTRAINT evaluation_issue_pkey PRIMARY KEY USING ubtree  (issue_id) WITH (storage_type=USTORE);

-- Name: evaluation_plan; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_plan (
    plan_id bigint NOT NULL,
    create_by bigint,
    create_time timestamp without time zone,
    update_by bigint,
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT '0'::bpchar,
    enterprise_id bigint,
    project_id bigint,
    plan_title character varying(64),
    stageversion_id bigint,
    plan_desc character varying(2000),
    plan_status integer,
    plan_start_time timestamp without time zone,
    plan_end_time timestamp without time zone,
    actual_start_time timestamp without time zone,
    actual_end_time timestamp without time zone,
    creator_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_plan IS '后评价计划表';
COMMENT ON COLUMN evaluation_plan.plan_id IS '主键id';
COMMENT ON COLUMN evaluation_plan.create_by IS '创建人';
COMMENT ON COLUMN evaluation_plan.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_plan.update_by IS '更新人';
COMMENT ON COLUMN evaluation_plan.update_time IS '更新时间';
COMMENT ON COLUMN evaluation_plan.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN evaluation_plan.enterprise_id IS '企业id ';
COMMENT ON COLUMN evaluation_plan.project_id IS '项目组id ';
COMMENT ON COLUMN evaluation_plan.plan_title IS '计划标题';
COMMENT ON COLUMN evaluation_plan.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN evaluation_plan.plan_desc IS '计划描述';
COMMENT ON COLUMN evaluation_plan.plan_status IS '计划状态，0未开始，1进行中，2已完成';
COMMENT ON COLUMN evaluation_plan.plan_start_time IS '计划开始时间';
COMMENT ON COLUMN evaluation_plan.plan_end_time IS '计划结束时间';
COMMENT ON COLUMN evaluation_plan.actual_start_time IS '实际开始时间';
COMMENT ON COLUMN evaluation_plan.actual_end_time IS '实际结束时间';
COMMENT ON COLUMN evaluation_plan.creator_id IS '创建人id';
ALTER TABLE evaluation_plan ADD CONSTRAINT evaluation_plan_pkey PRIMARY KEY USING ubtree  (plan_id) WITH (storage_type=USTORE);

-- Name: evaluation_plan_cr; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_plan_cr (
    create_by bigint,
    create_time timestamp without time zone,
    update_by bigint,
    update_time timestamp without time zone,
    plan_id bigint,
    cr_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN evaluation_plan_cr.create_by IS '创建人';
COMMENT ON COLUMN evaluation_plan_cr.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_plan_cr.update_by IS '更新人';
COMMENT ON COLUMN evaluation_plan_cr.update_time IS '更新时间';
COMMENT ON COLUMN evaluation_plan_cr.plan_id IS '计划id ';
COMMENT ON COLUMN evaluation_plan_cr.cr_id IS 'crid ';

-- Name: evaluation_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_report (
    report_id bigint NOT NULL,
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT '0'::bpchar,
    enterprise_id bigint,
    project_id bigint,
    create_id bigint,
    report_title character varying(64),
    stageversion_id bigint,
    report_summary character varying(1000),
    check_issue_list character varying(1000),
    report_status integer,
    report_version character varying(1000),
    report_cr_content character varying(10000),
    report_sit_content character varying(10000),
    report_uat_content character varying(10000),
    report_issue_content character varying(10000),
    issue_desc character varying(10000),
    issue_change_desc character varying(10000),
    stage_type character varying(10),
    check_issue_url character varying(100),
    report_url character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_report IS '后评价报告';
COMMENT ON COLUMN evaluation_report.report_id IS '主键id';
COMMENT ON COLUMN evaluation_report.create_by IS '创建人';
COMMENT ON COLUMN evaluation_report.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_report.update_by IS '更新人';
COMMENT ON COLUMN evaluation_report.update_time IS '更新时间';
COMMENT ON COLUMN evaluation_report.del_flag IS '删除标识 0：未删除，1：已删除';
COMMENT ON COLUMN evaluation_report.enterprise_id IS '企业Id';
COMMENT ON COLUMN evaluation_report.project_id IS '项目组id';
COMMENT ON COLUMN evaluation_report.create_id IS '创建人id';
COMMENT ON COLUMN evaluation_report.report_title IS '报告标题';
COMMENT ON COLUMN evaluation_report.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN evaluation_report.report_summary IS '报告概述';
COMMENT ON COLUMN evaluation_report.check_issue_list IS '检核项问题排名前5';
COMMENT ON COLUMN evaluation_report.report_status IS '报告状态';
COMMENT ON COLUMN evaluation_report.report_version IS '报告版本';
COMMENT ON COLUMN evaluation_report.report_cr_content IS 'cr维度概述包括概述，图片地址，数据';
COMMENT ON COLUMN evaluation_report.report_sit_content IS 'sit维度概述包括概述，图片地址，数据';
COMMENT ON COLUMN evaluation_report.report_uat_content IS 'uat维度概述包括概述，图片地址，数据';
COMMENT ON COLUMN evaluation_report.report_issue_content IS '问题维度概述包括概述，图片地址，数据';
COMMENT ON COLUMN evaluation_report.issue_desc IS '问题原因分析';
COMMENT ON COLUMN evaluation_report.issue_change_desc IS '问题整改措施';
COMMENT ON COLUMN evaluation_report.stage_type IS '测试阶段 sit/uat';
COMMENT ON COLUMN evaluation_report.check_issue_url IS '检核问题表url';
COMMENT ON COLUMN evaluation_report.report_url IS '报告地址';
ALTER TABLE evaluation_report ADD CONSTRAINT evaluation_report_pkey PRIMARY KEY USING ubtree  (report_id) WITH (storage_type=USTORE);

-- Name: evaluation_report_plan; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_report_plan (
    report_id bigint NOT NULL,
    plan_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_report_plan IS '后评价报告和计划关系表';
COMMENT ON COLUMN evaluation_report_plan.report_id IS '报告id';
COMMENT ON COLUMN evaluation_report_plan.plan_id IS '计划id';
COMMENT ON COLUMN evaluation_report_plan.create_by IS '创建人';
COMMENT ON COLUMN evaluation_report_plan.update_by IS '更新人';
COMMENT ON COLUMN evaluation_report_plan.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_report_plan.update_time IS '更新时间';
ALTER TABLE evaluation_report_plan ADD CONSTRAINT evaluation_report_plan_pkey PRIMARY KEY USING ubtree  (report_id, plan_id) WITH (storage_type=USTORE);

-- Name: evaluation_task; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_task (
    task_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT '0'::bpchar,
    enterprise_id bigint,
    project_id bigint,
    task_name character varying(100),
    stageversion_id bigint,
    task_status integer,
    task_exec_id bigint,
    task_start_time timestamp without time zone,
    task_end_time timestamp without time zone,
    actual_start_time timestamp without time zone,
    actual_end_time timestamp without time zone,
    plan_id bigint,
    creator_id bigint,
    general_comment character varying(2000),
    task_description character varying(2000),
    overdue_day integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_task IS '后评价任务';
COMMENT ON COLUMN evaluation_task.task_id IS '任务id';
COMMENT ON COLUMN evaluation_task.create_by IS '创建人';
COMMENT ON COLUMN evaluation_task.update_by IS '更新人';
COMMENT ON COLUMN evaluation_task.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_task.update_time IS '更新时间';
COMMENT ON COLUMN evaluation_task.del_flag IS '删除标识';
COMMENT ON COLUMN evaluation_task.enterprise_id IS '企业id';
COMMENT ON COLUMN evaluation_task.project_id IS '项目组id';
COMMENT ON COLUMN evaluation_task.task_name IS '任务名称';
COMMENT ON COLUMN evaluation_task.stageversion_id IS '阶段版本';
COMMENT ON COLUMN evaluation_task.task_status IS '任务状态';
COMMENT ON COLUMN evaluation_task.task_exec_id IS '实施人id';
COMMENT ON COLUMN evaluation_task.task_start_time IS '任务计划开始时间';
COMMENT ON COLUMN evaluation_task.task_end_time IS '任务计划结束时间';
COMMENT ON COLUMN evaluation_task.actual_start_time IS '实际开始时间';
COMMENT ON COLUMN evaluation_task.actual_end_time IS '实际结束时间';
COMMENT ON COLUMN evaluation_task.plan_id IS '计划id';
COMMENT ON COLUMN evaluation_task.creator_id IS '创建人id';
COMMENT ON COLUMN evaluation_task.general_comment IS '任务总评';
COMMENT ON COLUMN evaluation_task.task_description IS '描述';
COMMENT ON COLUMN evaluation_task.overdue_day IS '超期天数';

-- Name: evaluation_task_cr; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE evaluation_task_cr (
    task_id bigint NOT NULL,
    cr_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE evaluation_task_cr IS '后评价任务和cr关系表';
COMMENT ON COLUMN evaluation_task_cr.task_id IS '任务id';
COMMENT ON COLUMN evaluation_task_cr.cr_id IS 'cr的id';
COMMENT ON COLUMN evaluation_task_cr.create_by IS '创建人';
COMMENT ON COLUMN evaluation_task_cr.update_by IS '更新人';
COMMENT ON COLUMN evaluation_task_cr.create_time IS '创建时间';
COMMENT ON COLUMN evaluation_task_cr.update_time IS '更新时间';
ALTER TABLE evaluation_task_cr ADD CONSTRAINT evaluation_task_cr_pkey PRIMARY KEY USING ubtree  (task_id, cr_id) WITH (storage_type=USTORE);

-- Name: event_case_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE event_case_relation (
    event_id bigint,
    case_id character varying(50),
    case_name character varying(1000),
    case_side_type integer,
    case_type integer,
    case_code character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE event_case_relation IS '生产事件关联案例表';
COMMENT ON COLUMN event_case_relation.event_id IS '生产事件id';
COMMENT ON COLUMN event_case_relation.case_id IS '案例id';
COMMENT ON COLUMN event_case_relation.case_name IS '案例名称';
COMMENT ON COLUMN event_case_relation.case_side_type IS '正反例';
COMMENT ON COLUMN event_case_relation.case_type IS '案例类型';
COMMENT ON COLUMN event_case_relation.case_code IS '案例编码';

-- Name: event_issue_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE event_issue_relation (
    event_id bigint,
    issue_id character varying(50),
    issue_no character varying(100),
    issue_name character varying(1000),
    issue_status bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE event_issue_relation IS '生产事件关联缺陷表';
COMMENT ON COLUMN event_issue_relation.event_id IS '生产事件id';
COMMENT ON COLUMN event_issue_relation.issue_id IS '缺陷id';
COMMENT ON COLUMN event_issue_relation.issue_no IS '缺陷编号';
COMMENT ON COLUMN event_issue_relation.issue_name IS '缺陷名称';
COMMENT ON COLUMN event_issue_relation.issue_status IS '缺陷状态';

-- Name: event_risk_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE event_risk_relation (
    event_id bigint,
    risk_id character varying(50),
    risk_code character varying(100),
    risk_name character varying(1000)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE event_risk_relation IS '生产事件关联风险表';
COMMENT ON COLUMN event_risk_relation.event_id IS '生产事件id';
COMMENT ON COLUMN event_risk_relation.risk_id IS '风险id';
COMMENT ON COLUMN event_risk_relation.risk_code IS '风险编号';
COMMENT ON COLUMN event_risk_relation.risk_name IS '风险名称';

-- Name: group_metrics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE group_metrics_report (
    id bigint NOT NULL,
    group_id bigint,
    group_name character varying(128),
    create_by character varying(100),
    create_time date,
    update_by character varying(100),
    update_time date,
    lib_auto_case_count integer,
    lib_case_count integer,
    lib_auto_case_cover_rate real,
    sit_group_add_delete_update_after_exec_once_script_count integer,
    uat_group_add_delete_update_after_exec_once_script_count integer,
    sit_group_original_auto_script_count integer,
    uat_group_original_auto_script_count integer,
    sit_group_scenarioization_script_count integer,
    uat_group_scenarioization_script_count integer,
    sit_group_all_auto_script_count integer,
    uat_group_all_auto_script_count integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN group_metrics_report.id IS '主键id';
COMMENT ON COLUMN group_metrics_report.group_id IS '组别id';
COMMENT ON COLUMN group_metrics_report.group_name IS '组别名称';
COMMENT ON COLUMN group_metrics_report.create_by IS '创建人';
COMMENT ON COLUMN group_metrics_report.create_time IS '创建时间';
COMMENT ON COLUMN group_metrics_report.update_by IS '更新人';
COMMENT ON COLUMN group_metrics_report.update_time IS '更新时间';
COMMENT ON COLUMN group_metrics_report.lib_auto_case_count IS '案例库自动化案例总数';
COMMENT ON COLUMN group_metrics_report.lib_case_count IS '案例库案例总数';
COMMENT ON COLUMN group_metrics_report.lib_auto_case_cover_rate IS '案例库自动化测试案例覆盖率';
COMMENT ON COLUMN group_metrics_report.sit_group_add_delete_update_after_exec_once_script_count IS 'SIT组别增删改且改后至少执行一次的脚本数量';
COMMENT ON COLUMN group_metrics_report.uat_group_add_delete_update_after_exec_once_script_count IS 'UAT组别增删改且改后至少执行一次的脚本数量';
COMMENT ON COLUMN group_metrics_report.sit_group_original_auto_script_count IS 'SIT组别原有自动化脚本数量';
COMMENT ON COLUMN group_metrics_report.uat_group_original_auto_script_count IS 'UAT组别原有自动化脚本数量';
COMMENT ON COLUMN group_metrics_report.sit_group_scenarioization_script_count IS 'SIT组别下打过场景化脚本标签的脚本数量';
COMMENT ON COLUMN group_metrics_report.uat_group_scenarioization_script_count IS 'UAT组别下打过场景化脚本标签的脚本数量';
COMMENT ON COLUMN group_metrics_report.sit_group_all_auto_script_count IS 'SIT组别下所有自动化脚本数量';
COMMENT ON COLUMN group_metrics_report.uat_group_all_auto_script_count IS 'UAT组别下所有自动化脚本数量';
ALTER TABLE group_metrics_report ADD CONSTRAINT group_metrics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: import_user_role_test; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE import_user_role_test (
    userresourceid bigint,
    usergroupresourceid bigint,
    name character varying(256),
    username character varying(256),
    "number" character varying(256),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE import_user_role_test IS '老测服人员角色关系生产导入数据';
COMMENT ON COLUMN import_user_role_test.userresourceid IS '人员id';
COMMENT ON COLUMN import_user_role_test.usergroupresourceid IS '角色id';
COMMENT ON COLUMN import_user_role_test.name IS '角色名称';
COMMENT ON COLUMN import_user_role_test.username IS '用户名称';
COMMENT ON COLUMN import_user_role_test."number" IS '用户账号';
COMMENT ON COLUMN import_user_role_test.enterprise_id IS '企业Id';
COMMENT ON COLUMN import_user_role_test.project_id IS '项目id';

-- Name: issue_delete_info; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE issue_delete_info (
    issue_id character varying(50) NOT NULL,
    issue_no character varying(50),
    delete_time timestamp(6) without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE issue_delete_info IS '缺陷删除记录表';
COMMENT ON COLUMN issue_delete_info.issue_id IS '缺陷id';
COMMENT ON COLUMN issue_delete_info.issue_no IS '缺陷编号';
COMMENT ON COLUMN issue_delete_info.delete_time IS '删除时间';
ALTER TABLE issue_delete_info ADD CONSTRAINT issue_delete_info_pkey PRIMARY KEY USING ubtree  (issue_id) WITH (storage_type=USTORE);

-- Name: issue_metrics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE issue_metrics_report (
    issue_id character varying(50) NOT NULL,
    issue_name character varying(1000),
    issue_no character varying(50),
    problem_type character varying(100),
    cr_id bigint,
    cr_name character varying(255),
    cr_online_time timestamp without time zone,
    system_id bigint,
    system_name character varying(150),
    system_manager_id bigint,
    system_manager_dept_id bigint,
    system_manager_dept_name character varying(255),
    stage_version_id bigint,
    stage_version_name character varying(150),
    stage_type character varying(50),
    valid_and_close_duration tinyint,
    repair_duration tinyint,
    block_flag boolean,
    serious_flag boolean,
    overdue_flag tinyint,
    passed_flag boolean,
    code_problem_flag boolean,
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN issue_metrics_report.issue_id IS '缺陷id';
COMMENT ON COLUMN issue_metrics_report.issue_name IS '缺陷名称';
COMMENT ON COLUMN issue_metrics_report.issue_no IS '缺陷编号';
COMMENT ON COLUMN issue_metrics_report.problem_type IS '问题分类';
COMMENT ON COLUMN issue_metrics_report.cr_id IS 'crId';
COMMENT ON COLUMN issue_metrics_report.cr_name IS 'CR名称';
COMMENT ON COLUMN issue_metrics_report.cr_online_time IS 'CR上线时间';
COMMENT ON COLUMN issue_metrics_report.system_id IS '缺陷所属系统';
COMMENT ON COLUMN issue_metrics_report.system_name IS '缺陷所属系统名称';
COMMENT ON COLUMN issue_metrics_report.system_manager_id IS '所属系统负责人处室';
COMMENT ON COLUMN issue_metrics_report.system_manager_dept_id IS '所属系统负责人处室Id';
COMMENT ON COLUMN issue_metrics_report.system_manager_dept_name IS '所属系统负责人所在处室';
COMMENT ON COLUMN issue_metrics_report.stage_version_id IS '所属阶段版本';
COMMENT ON COLUMN issue_metrics_report.stage_version_name IS '所属阶段版本名称';
COMMENT ON COLUMN issue_metrics_report.stage_type IS '测试阶段';
COMMENT ON COLUMN issue_metrics_report.valid_and_close_duration IS '有效且已关闭的停留时长';
COMMENT ON COLUMN issue_metrics_report.repair_duration IS '缺陷修复所用时长';
COMMENT ON COLUMN issue_metrics_report.block_flag IS '是否阻塞类缺陷';
COMMENT ON COLUMN issue_metrics_report.serious_flag IS '是否严重/致命缺陷';
COMMENT ON COLUMN issue_metrics_report.overdue_flag IS '是否超期 1:是 0:否';
COMMENT ON COLUMN issue_metrics_report.passed_flag IS '是否通过标识通过';
COMMENT ON COLUMN issue_metrics_report.code_problem_flag IS '是否是代码类问题';
COMMENT ON COLUMN issue_metrics_report.create_by IS '创建人';
COMMENT ON COLUMN issue_metrics_report.create_time IS '创建时间';
COMMENT ON COLUMN issue_metrics_report.update_by IS '更新人';
COMMENT ON COLUMN issue_metrics_report.update_time IS '更新时间';
ALTER TABLE issue_metrics_report ADD CONSTRAINT issue_metrics_report_pk PRIMARY KEY USING ubtree  (issue_id) WITH (storage_type=USTORE);

-- Name: library_risk_case_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE library_risk_case_relation (
    case_id character varying(50) NOT NULL,
    risk_id character varying(50) NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE library_risk_case_relation IS '资产库风险案例关联表';
COMMENT ON COLUMN library_risk_case_relation.case_id IS '检查结果id';
COMMENT ON COLUMN library_risk_case_relation.risk_id IS '企业id';
ALTER TABLE library_risk_case_relation ADD CONSTRAINT library_risk_case_relation_pk PRIMARY KEY USING ubtree  (case_id, risk_id) WITH (storage_type=USTORE);

-- Name: month_test_metrics; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE month_test_metrics (
    id bigint NOT NULL,
    create_time date,
    sit_test_case_capacity real,
    uat_test_case_capacity real,
    sit_issue_efficacy real,
    uat_issue_efficacy real,
    sit_fun_test_efficacy real,
    uat_fun_test_efficacy real,
    cr_sit_test_efficacy real,
    cr_uat_test_efficacy real,
    product_risk_reuse_rate real,
    product_risk_lib_fresh_rate real,
    case_lib_reuse_rate real,
    case_lib_fresh_rate real,
    auto_test_case_lib_reuse_rate real,
    case_lib_sit_reuse_rate real,
    case_lib_uat_reuse_rate real,
    interface_test_case_lib_cover_rate real,
    ui_test_case_lib_cover_rate real,
    sit_interface_script_rate real,
    uat_interface_script_rate real,
    sit_auto_script_fresh_rate real,
    uat_auto_script_fresh_rate real,
    sit_auto_execute_count integer,
    uat_auto_execute_count integer,
    sit_case_execute_count integer,
    uat_case_execute_count integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN month_test_metrics.id IS '主键';
COMMENT ON COLUMN month_test_metrics.create_time IS '创建时间';
COMMENT ON COLUMN month_test_metrics.sit_test_case_capacity IS 'sit测试案例产能';
COMMENT ON COLUMN month_test_metrics.uat_test_case_capacity IS 'uat测试案例产能';
COMMENT ON COLUMN month_test_metrics.sit_issue_efficacy IS 'sit缺陷效能';
COMMENT ON COLUMN month_test_metrics.uat_issue_efficacy IS 'uat缺陷效能';
COMMENT ON COLUMN month_test_metrics.sit_fun_test_efficacy IS 'sit功能点测试效能';
COMMENT ON COLUMN month_test_metrics.uat_fun_test_efficacy IS 'uat功能点测试效能';
COMMENT ON COLUMN month_test_metrics.cr_sit_test_efficacy IS 'sit阶段cr测试效能';
COMMENT ON COLUMN month_test_metrics.cr_uat_test_efficacy IS 'uat阶段cr测试效能';
COMMENT ON COLUMN month_test_metrics.product_risk_reuse_rate IS '产品风险复用率';
COMMENT ON COLUMN month_test_metrics.product_risk_lib_fresh_rate IS '产品风险库保鲜率';
COMMENT ON COLUMN month_test_metrics.case_lib_reuse_rate IS '案例资产复用率';
COMMENT ON COLUMN month_test_metrics.case_lib_fresh_rate IS '案例库案例保鲜率';
COMMENT ON COLUMN month_test_metrics.auto_test_case_lib_reuse_rate IS '自动化案例资产复用率';
COMMENT ON COLUMN month_test_metrics.case_lib_sit_reuse_rate IS '案例库SIT资产复用率';
COMMENT ON COLUMN month_test_metrics.case_lib_uat_reuse_rate IS '案例库UAT资产复用率';
COMMENT ON COLUMN month_test_metrics.interface_test_case_lib_cover_rate IS '接口测试案例库自动化案例覆盖率';
COMMENT ON COLUMN month_test_metrics.ui_test_case_lib_cover_rate IS 'UI测试案例库自动化案例覆盖率';
COMMENT ON COLUMN month_test_metrics.sit_interface_script_rate IS 'SIT接口场景化脚本率';
COMMENT ON COLUMN month_test_metrics.uat_interface_script_rate IS 'UAT接口场景化脚本率';
COMMENT ON COLUMN month_test_metrics.sit_auto_script_fresh_rate IS 'SIT自动化脚本保鲜率';
COMMENT ON COLUMN month_test_metrics.uat_auto_script_fresh_rate IS 'UAT自动化脚本保鲜率';
COMMENT ON COLUMN month_test_metrics.sit_auto_execute_count IS 'SIT自动化执行总次数';
COMMENT ON COLUMN month_test_metrics.uat_auto_execute_count IS 'UAT自动化执行总次数';
COMMENT ON COLUMN month_test_metrics.sit_case_execute_count IS 'SIT测试案例执行总次数';
COMMENT ON COLUMN month_test_metrics.uat_case_execute_count IS 'UAT测试案例执行总次数';

-- Name: non_funcation_system_stratum; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_funcation_system_stratum (
    stratum_id bigint NOT NULL,
    enterprise_id bigint DEFAULT 1619927771602984961::bigint,
    project_id bigint DEFAULT 1,
    create_by character varying(128),
    create_time timestamp without time zone,
    update_by character varying(128),
    update_time timestamp without time zone,
    name character varying(128),
    index integer,
    parent_id bigint NOT NULL,
    stratum_type character varying(32),
    is_shroud character(1) DEFAULT '0'::bpchar
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_funcation_system_stratum IS '非功能系统层级表';
COMMENT ON COLUMN non_funcation_system_stratum.name IS '层级名称';
COMMENT ON COLUMN non_funcation_system_stratum.index IS '序号';
COMMENT ON COLUMN non_funcation_system_stratum.parent_id IS '父节点ID，没有父节点默ID认为0';
COMMENT ON COLUMN non_funcation_system_stratum.stratum_type IS '节点类型：stratum--层，reaches--渠道';
COMMENT ON COLUMN non_funcation_system_stratum.is_shroud IS '是否隐藏，0-不隐藏，1-隐藏';
ALTER TABLE non_funcation_system_stratum ADD CONSTRAINT non_funcation_system_stratum_pk PRIMARY KEY USING ubtree  (stratum_id) WITH (storage_type=USTORE);

-- Name: non_functional_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_config (
    config_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    http_transcribe_tps1 integer,
    http_transcribe_tps2 integer,
    http_transcribe_tps3 integer,
    http_transcribe_tps4 integer,
    http_transcribe_tps5 integer,
    http_transcribe_tps6 integer,
    http_transcribe_repsonse_time1 integer,
    http_transcribe_repsonse_time2 integer,
    http_transcribe_repsonse_time3 integer,
    http_transcribe_repsonse_time4 integer,
    http_service_tps1 integer,
    http_service_tps2 integer,
    http_service_tps3 integer,
    http_service_tps4 integer,
    http_service_tps5 integer,
    http_service_tps6 integer,
    http_service_repsonse_time1 integer,
    http_service_repsonse_time2 integer,
    http_service_repsonse_time3 integer,
    http_service_repsonse_time4 integer,
    tcp_tps1 integer,
    tcp_tps2 integer,
    tcp_tps3 integer,
    tcp_tps4 integer,
    tcp_tps5 integer,
    tcp_tps6 integer,
    tcp_repsonse_time1 integer,
    tcp_repsonse_time2 integer,
    tcp_repsonse_time3 integer,
    tcp_repsonse_time4 integer,
    tong_tps1 integer,
    tong_tps2 integer,
    tong_tps3 integer,
    tong_tps4 integer,
    tong_tps5 integer,
    tong_tps6 integer,
    tong_repsonse_time1 integer,
    tong_repsonse_time2 integer,
    tong_repsonse_time3 integer,
    tong_repsonse_time4 integer,
    tps_rating_weight integer,
    response_time_rating_weight integer,
    test_cycle_weight integer,
    demand_quality_weight integer,
    issue_repair_cycle_weight integer,
    quality_rating_weight integer,
    test_process_rating_weight integer,
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_config IS '非功能评分关系表';
COMMENT ON COLUMN non_functional_config.config_id IS '配置id';
COMMENT ON COLUMN non_functional_config.create_by IS '创建者';
COMMENT ON COLUMN non_functional_config.create_time IS '创建时间';
COMMENT ON COLUMN non_functional_config.update_by IS '更新人';
COMMENT ON COLUMN non_functional_config.update_time IS '修改时间';
COMMENT ON COLUMN non_functional_config.http_transcribe_tps1 IS 'HTTP(录制)TPS阈值1';
COMMENT ON COLUMN non_functional_config.http_transcribe_tps2 IS 'HTTP(录制)TPS阈值2';
COMMENT ON COLUMN non_functional_config.http_transcribe_tps3 IS 'HTTP(录制)TPS阈值3';
COMMENT ON COLUMN non_functional_config.http_transcribe_tps4 IS 'HTTP(录制)TPS阈值4';
COMMENT ON COLUMN non_functional_config.http_transcribe_tps5 IS 'HTTP(录制)TPS阈值5';
COMMENT ON COLUMN non_functional_config.http_transcribe_tps6 IS 'HTTP(录制)TPS阈值6';
COMMENT ON COLUMN non_functional_config.http_transcribe_repsonse_time1 IS 'HTTP(录制)响应时间阈值1';
COMMENT ON COLUMN non_functional_config.http_transcribe_repsonse_time2 IS 'HTTP(录制)响应时间阈值2';
COMMENT ON COLUMN non_functional_config.http_transcribe_repsonse_time3 IS 'HTTP(录制)响应时间阈值3';
COMMENT ON COLUMN non_functional_config.http_transcribe_repsonse_time4 IS 'HTTP(录制)响应时间阈值4';
COMMENT ON COLUMN non_functional_config.http_service_tps1 IS 'HTTP(接口)TPS阈值1';
COMMENT ON COLUMN non_functional_config.http_service_tps2 IS 'HTTP(接口)TPS阈值2';
COMMENT ON COLUMN non_functional_config.http_service_tps3 IS 'HTTP(接口)TPS阈值3';
COMMENT ON COLUMN non_functional_config.http_service_tps4 IS 'HTTP(接口)TPS阈值4';
COMMENT ON COLUMN non_functional_config.http_service_tps5 IS 'HTTP(接口)TPS阈值5';
COMMENT ON COLUMN non_functional_config.http_service_tps6 IS 'HTTP(接口)TPS阈值6';
COMMENT ON COLUMN non_functional_config.http_service_repsonse_time1 IS 'HTTP(接口)响应时间阈值1';
COMMENT ON COLUMN non_functional_config.http_service_repsonse_time2 IS 'HTTP(接口)响应时间阈值2';
COMMENT ON COLUMN non_functional_config.http_service_repsonse_time3 IS 'HTTP(接口)响应时间阈值3';
COMMENT ON COLUMN non_functional_config.http_service_repsonse_time4 IS 'HTTP(接口)响应时间阈值4';
COMMENT ON COLUMN non_functional_config.tcp_tps1 IS 'TcpTPS阈值1';
COMMENT ON COLUMN non_functional_config.tcp_tps2 IS 'TcpTPS阈值2';
COMMENT ON COLUMN non_functional_config.tcp_tps3 IS 'TcpTPS阈值3';
COMMENT ON COLUMN non_functional_config.tcp_tps4 IS 'TcpTPS阈值4';
COMMENT ON COLUMN non_functional_config.tcp_tps5 IS 'TcpTPS阈值5';
COMMENT ON COLUMN non_functional_config.tcp_tps6 IS 'TcpTPS阈值6';
COMMENT ON COLUMN non_functional_config.tcp_repsonse_time1 IS 'Tcp响应时间阈值1';
COMMENT ON COLUMN non_functional_config.tcp_repsonse_time2 IS 'Tcp响应时间阈值2';
COMMENT ON COLUMN non_functional_config.tcp_repsonse_time3 IS 'Tcp响应时间阈值3';
COMMENT ON COLUMN non_functional_config.tcp_repsonse_time4 IS 'Tcp响应时间阈值4';
COMMENT ON COLUMN non_functional_config.tong_tps1 IS 'Tong中间件TPS阈值1';
COMMENT ON COLUMN non_functional_config.tong_tps2 IS 'Tong中间件TPS阈值2';
COMMENT ON COLUMN non_functional_config.tong_tps3 IS 'Tong中间件TPS阈值3';
COMMENT ON COLUMN non_functional_config.tong_tps4 IS 'Tong中间件TPS阈值4';
COMMENT ON COLUMN non_functional_config.tong_tps5 IS 'Tong中间件TPS阈值5';
COMMENT ON COLUMN non_functional_config.tong_tps6 IS 'Tong中间件TPS阈值6';
COMMENT ON COLUMN non_functional_config.tong_repsonse_time1 IS 'Tong中间件响应时间阈值1';
COMMENT ON COLUMN non_functional_config.tong_repsonse_time2 IS 'Tong中间件响应时间阈值2';
COMMENT ON COLUMN non_functional_config.tong_repsonse_time3 IS 'Tong中间件响应时间阈值3';
COMMENT ON COLUMN non_functional_config.tong_repsonse_time4 IS 'Tong中间件响应时间阈值4';
COMMENT ON COLUMN non_functional_config.tps_rating_weight IS 'TPS得分权重';
COMMENT ON COLUMN non_functional_config.response_time_rating_weight IS '平均响应时间得分权重';
COMMENT ON COLUMN non_functional_config.test_cycle_weight IS '测试周期权重';
COMMENT ON COLUMN non_functional_config.demand_quality_weight IS '需求质量得分权重';
COMMENT ON COLUMN non_functional_config.issue_repair_cycle_weight IS '缺陷修复周期得分权重';
COMMENT ON COLUMN non_functional_config.quality_rating_weight IS '系统质量评分权重';
COMMENT ON COLUMN non_functional_config.test_process_rating_weight IS '测试过程评分权重';
COMMENT ON COLUMN non_functional_config.project_id IS '项目组id';
COMMENT ON COLUMN non_functional_config.enterprise_id IS '企业id';
ALTER TABLE non_functional_config ADD CONSTRAINT non_functional_config_pkey PRIMARY KEY USING ubtree  (config_id) WITH (storage_type=USTORE);

-- Name: non_functional_project; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_project (
    plan_id bigint NOT NULL,
    system_id bigint,
    enterprise_id bigint DEFAULT 1619927771602984961::bigint,
    project_id bigint DEFAULT 1,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    vp_code character varying(64),
    name character varying(256),
    plan_status character varying(64),
    test_user_name character varying(64),
    change_type character varying(64),
    start_time bigint,
    plan_completion_time timestamp without time zone,
    case_number character varying(16),
    test_type character(1),
    application_user character varying(128),
    application_state character varying(128),
    issue_number integer DEFAULT 0,
    stage_version character varying(64),
    is_history character(1) DEFAULT 2
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_project IS '非功能项目管理表';
COMMENT ON COLUMN non_functional_project.plan_id IS '计划id';
COMMENT ON COLUMN non_functional_project.vp_code IS 'vp编号';
COMMENT ON COLUMN non_functional_project.name IS '项目名称';
COMMENT ON COLUMN non_functional_project.plan_status IS '计划状态';
COMMENT ON COLUMN non_functional_project.test_user_name IS '测试负责人';
COMMENT ON COLUMN non_functional_project.change_type IS '变更类型';
COMMENT ON COLUMN non_functional_project.start_time IS '开始时间';
COMMENT ON COLUMN non_functional_project.plan_completion_time IS '计划完成时间';
COMMENT ON COLUMN non_functional_project.case_number IS '脚本数量';
COMMENT ON COLUMN non_functional_project.test_type IS '测试类型：1-阶段版本，2-专项测试';
COMMENT ON COLUMN non_functional_project.application_user IS '需求提出人';
COMMENT ON COLUMN non_functional_project.application_state IS '需求提出部门';
COMMENT ON COLUMN non_functional_project.issue_number IS '缺陷总数';
COMMENT ON COLUMN non_functional_project.stage_version IS '阶段版本';
COMMENT ON COLUMN non_functional_project.is_history IS '历史迁移数据标识：1-是，2-不是';
ALTER TABLE non_functional_project ADD CONSTRAINT non_functional_project_pk PRIMARY KEY USING ubtree  (plan_id) WITH (storage_type=USTORE);

-- Name: non_functional_rating_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_rating_relation (
    non_functional_task_id bigint NOT NULL,
    system_quality_rating double precision,
    test_process_rating double precision,
    system_type integer,
    tps_value integer,
    response_time_value integer,
    issue_value integer,
    issue_score double precision,
    demand_end_time timestamp without time zone,
    environmenttal_readiness_time timestamp without time zone,
    test_completion_time timestamp without time zone,
    demand_integrity_score double precision,
    case_coverage_score double precision,
    demand_change_frequency_score double precision,
    issue_resolution_cycle character varying(10),
    system_quality_level character varying(10),
    test_process_level character varying(10),
    comprehensive_score double precision,
    comprehensive_evaluation_level character varying(10)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_rating_relation IS '非功能评分关系表';
COMMENT ON COLUMN non_functional_rating_relation.non_functional_task_id IS '非功能任务id';
COMMENT ON COLUMN non_functional_rating_relation.system_quality_rating IS '系统质量评分';
COMMENT ON COLUMN non_functional_rating_relation.test_process_rating IS '测试实施过程评分';
COMMENT ON COLUMN non_functional_rating_relation.system_type IS '系统类别 1：Http(录制) 2：Http(接口) 3：TCP 4：Tong中间件';
COMMENT ON COLUMN non_functional_rating_relation.tps_value IS 'TPS数值';
COMMENT ON COLUMN non_functional_rating_relation.response_time_value IS '平均响应时间';
COMMENT ON COLUMN non_functional_rating_relation.issue_value IS '缺陷数值';
COMMENT ON COLUMN non_functional_rating_relation.issue_score IS '缺陷得分';
COMMENT ON COLUMN non_functional_rating_relation.demand_end_time IS '需求截止日期';
COMMENT ON COLUMN non_functional_rating_relation.environmenttal_readiness_time IS '环境就绪时间';
COMMENT ON COLUMN non_functional_rating_relation.test_completion_time IS '要求测试完成时间';
COMMENT ON COLUMN non_functional_rating_relation.demand_integrity_score IS '需求完整度得分';
COMMENT ON COLUMN non_functional_rating_relation.case_coverage_score IS '案例覆盖率得分';
COMMENT ON COLUMN non_functional_rating_relation.demand_change_frequency_score IS '需求变更次数得分';
COMMENT ON COLUMN non_functional_rating_relation.issue_resolution_cycle IS '平均缺陷解决周期';
COMMENT ON COLUMN non_functional_rating_relation.system_quality_level IS '系统质量等级';
COMMENT ON COLUMN non_functional_rating_relation.test_process_level IS '测试实施过程等级';
COMMENT ON COLUMN non_functional_rating_relation.comprehensive_score IS '综合评分';
COMMENT ON COLUMN non_functional_rating_relation.comprehensive_evaluation_level IS '综合评价等级';
ALTER TABLE non_functional_rating_relation ADD CONSTRAINT non_functional_rating_relation_pkey PRIMARY KEY USING ubtree  (non_functional_task_id) WITH (storage_type=USTORE);

-- Name: non_functional_result; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_result (
    report_id bigint NOT NULL,
    system_id bigint,
    plan_id bigint,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    test_env character varying(128),
    test_protocol character varying(128),
    tps character varying(64),
    art character varying(64),
    rating_tag character(1),
    test_result character varying(128)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_result IS '非功能项目测试结果表';
COMMENT ON COLUMN non_functional_result.system_id IS '系统id';
COMMENT ON COLUMN non_functional_result.plan_id IS '计划id';
COMMENT ON COLUMN non_functional_result.test_env IS '测试场景';
COMMENT ON COLUMN non_functional_result.test_protocol IS '测试协议';
COMMENT ON COLUMN non_functional_result.tps IS 'TPS';
COMMENT ON COLUMN non_functional_result.art IS 'ART';
COMMENT ON COLUMN non_functional_result.rating_tag IS '评级标记：1-是，2-否';
COMMENT ON COLUMN non_functional_result.test_result IS '测试结果';
ALTER TABLE non_functional_result ADD CONSTRAINT non_functional_result_pk PRIMARY KEY USING ubtree  (report_id) WITH (storage_type=USTORE);

-- Name: non_functional_stageversion; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_stageversion (
    id bigint NOT NULL,
    stage_version_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    stage_version_name character varying(128),
    del_flag character(1),
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_stageversion IS '非功能测试阶段表';
COMMENT ON COLUMN non_functional_stageversion.stage_version_id IS '非功能阶段版id';
COMMENT ON COLUMN non_functional_stageversion.stage_version_name IS '非功能阶段版名称';
COMMENT ON COLUMN non_functional_stageversion.del_flag IS '删除类型；0-正常，1-删除';
COMMENT ON COLUMN non_functional_stageversion.project_id IS '项目组id';
COMMENT ON COLUMN non_functional_stageversion.enterprise_id IS '企业id';
ALTER TABLE non_functional_stageversion ADD CONSTRAINT non_functional_stageversion_pk PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: non_functional_synchro; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_synchro (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    vp_number character varying(256),
    task_name character varying(256),
    status character varying(128),
    current_state_person character varying(128),
    relation_cr character varying(512),
    application_time timestamp without time zone,
    application_user character varying(128),
    application_state character varying(128),
    ask_for_test_completion_time timestamp without time zone,
    planned_test_deadline timestamp without time zone,
    actual_finish_time timestamp without time zone,
    test_category character varying(128),
    tele_phone character varying(128),
    staged_or_not_version character varying(128),
    version_implement character varying(128),
    system_name character varying(128),
    description character varying(2000),
    results_entry character varying(128),
    del_flag character(1),
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_synchro IS 'vp同步非功能任务表';
COMMENT ON COLUMN non_functional_synchro.id IS '非功能任务id';
COMMENT ON COLUMN non_functional_synchro.vp_number IS '任务编号';
COMMENT ON COLUMN non_functional_synchro.task_name IS '任务名称';
COMMENT ON COLUMN non_functional_synchro.status IS '状态';
COMMENT ON COLUMN non_functional_synchro.current_state_person IS '当前状态负责人';
COMMENT ON COLUMN non_functional_synchro.relation_cr IS '关联cr';
COMMENT ON COLUMN non_functional_synchro.application_time IS '申请时间';
COMMENT ON COLUMN non_functional_synchro.application_user IS '申请人';
COMMENT ON COLUMN non_functional_synchro.application_state IS '申请部门';
COMMENT ON COLUMN non_functional_synchro.ask_for_test_completion_time IS '要求测试完成时间';
COMMENT ON COLUMN non_functional_synchro.planned_test_deadline IS '计划测试截止时间';
COMMENT ON COLUMN non_functional_synchro.actual_finish_time IS '实际完成时间';
COMMENT ON COLUMN non_functional_synchro.test_category IS '测试类别';
COMMENT ON COLUMN non_functional_synchro.tele_phone IS '联系方式';
COMMENT ON COLUMN non_functional_synchro.staged_or_not_version IS '是否阶段版本（是、否）';
COMMENT ON COLUMN non_functional_synchro.version_implement IS '版本实现';
COMMENT ON COLUMN non_functional_synchro.system_name IS '系统名称';
COMMENT ON COLUMN non_functional_synchro.description IS '描述';
COMMENT ON COLUMN non_functional_synchro.results_entry IS '结果录入(未录入、已录入)';
COMMENT ON COLUMN non_functional_synchro.del_flag IS '删除类型；0-正常，1-删除';
COMMENT ON COLUMN non_functional_synchro.project_id IS '项目组id';
COMMENT ON COLUMN non_functional_synchro.enterprise_id IS '企业id';
ALTER TABLE non_functional_synchro ADD CONSTRAINT non_functional_synchro_pk PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: non_functional_system_reta; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_system_reta (
    id bigint NOT NULL,
    system_id bigint,
    system_name character varying(256),
    application_state character varying(128),
    transactions integer,
    immediate_response integer,
    availability integer,
    burst_response integer,
    code_quality integer,
    test_frequency integer,
    general_comment integer,
    reta_level character varying(5)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_system_reta IS '非功能项目测试结果表';
COMMENT ON COLUMN non_functional_system_reta.system_id IS '系统id';
COMMENT ON COLUMN non_functional_system_reta.system_name IS '系统名称';
COMMENT ON COLUMN non_functional_system_reta.application_state IS '所属处室';
COMMENT ON COLUMN non_functional_system_reta.transactions IS '交易处理能力';
COMMENT ON COLUMN non_functional_system_reta.immediate_response IS '即时响应能力';
COMMENT ON COLUMN non_functional_system_reta.availability IS '高可用能力';
COMMENT ON COLUMN non_functional_system_reta.burst_response IS '突发应对能力';
COMMENT ON COLUMN non_functional_system_reta.code_quality IS '代码质量能力';
COMMENT ON COLUMN non_functional_system_reta.test_frequency IS '测试频度评级';
COMMENT ON COLUMN non_functional_system_reta.general_comment IS '总评';
COMMENT ON COLUMN non_functional_system_reta.reta_level IS '总评级别：1-优秀，2-良好，3-及格，4-不及格';
ALTER TABLE non_functional_system_reta ADD CONSTRAINT non_functional_system_reta_pk PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: non_functional_test_task; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE non_functional_test_task (
    non_functional_task_id bigint NOT NULL,
    create_by character varying(128),
    create_time timestamp without time zone,
    update_by character varying(128),
    update_time timestamp without time zone,
    non_functional_stage_id bigint NOT NULL,
    task_number character varying(256),
    task_name character varying(512),
    current_work_content character varying(512),
    work_plan_of_this_week character varying(512),
    progress_percentage bigint,
    status character varying(256),
    current_issues character varying(256),
    total_number_of_defects bigint,
    number_of_unresolved_defects bigint,
    number_of_scenes_executed bigint,
    number_of_scenes_passed bigint,
    number_of_scenes_failed bigint,
    creator_id bigint,
    test_leader_id bigint,
    test_executor_id bigint,
    relation_cr character varying(256),
    application_time timestamp without time zone,
    application_user character varying(256),
    application_state character varying(256),
    launch_time timestamp without time zone,
    planned_test_deadline timestamp without time zone,
    number_of_test_cases bigint,
    key_project_or_not bigint,
    production_type character varying(256),
    test_scenario character varying(512),
    del_flag character(1),
    test_leader character varying(64),
    test_executor character varying(64),
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE non_functional_test_task IS '非功能测试任务表';
COMMENT ON COLUMN non_functional_test_task.non_functional_task_id IS '非功能任务id';
COMMENT ON COLUMN non_functional_test_task.non_functional_stage_id IS '非功能阶段版id';
COMMENT ON COLUMN non_functional_test_task.task_number IS '任务编号';
COMMENT ON COLUMN non_functional_test_task.task_name IS '任务名称';
COMMENT ON COLUMN non_functional_test_task.current_work_content IS '当前工作内容';
COMMENT ON COLUMN non_functional_test_task.work_plan_of_this_week IS '本周工作计划';
COMMENT ON COLUMN non_functional_test_task.progress_percentage IS '测试进度';
COMMENT ON COLUMN non_functional_test_task.status IS '状态';
COMMENT ON COLUMN non_functional_test_task.current_issues IS '当前问题';
COMMENT ON COLUMN non_functional_test_task.total_number_of_defects IS '缺陷总数';
COMMENT ON COLUMN non_functional_test_task.number_of_unresolved_defects IS '未解决缺陷总数';
COMMENT ON COLUMN non_functional_test_task.number_of_scenes_executed IS '待执行场景数';
COMMENT ON COLUMN non_functional_test_task.number_of_scenes_passed IS '已通过场景数';
COMMENT ON COLUMN non_functional_test_task.number_of_scenes_failed IS '未通过场景数';
COMMENT ON COLUMN non_functional_test_task.creator_id IS '创建人';
COMMENT ON COLUMN non_functional_test_task.test_leader_id IS '测试负责人';
COMMENT ON COLUMN non_functional_test_task.test_executor_id IS '测试执行人';
COMMENT ON COLUMN non_functional_test_task.relation_cr IS '关联cr';
COMMENT ON COLUMN non_functional_test_task.application_time IS '申请时间';
COMMENT ON COLUMN non_functional_test_task.application_user IS '申请人';
COMMENT ON COLUMN non_functional_test_task.application_state IS '申请部门';
COMMENT ON COLUMN non_functional_test_task.launch_time IS '上线时间';
COMMENT ON COLUMN non_functional_test_task.planned_test_deadline IS '计划测试截止时间';
COMMENT ON COLUMN non_functional_test_task.number_of_test_cases IS '测试案例数';
COMMENT ON COLUMN non_functional_test_task.key_project_or_not IS '是否重点项目,0:不是，1:是';
COMMENT ON COLUMN non_functional_test_task.production_type IS '投产类型';
COMMENT ON COLUMN non_functional_test_task.test_scenario IS '测试场景';
COMMENT ON COLUMN non_functional_test_task.del_flag IS '删除类型；0-正常，1-删除';
COMMENT ON COLUMN non_functional_test_task.test_leader IS '测试负责人账号';
COMMENT ON COLUMN non_functional_test_task.project_id IS '项目组id';
COMMENT ON COLUMN non_functional_test_task.enterprise_id IS '企业id';
ALTER TABLE non_functional_test_task ADD CONSTRAINT non_functional_test_task_pk PRIMARY KEY USING ubtree  (non_functional_task_id) WITH (storage_type=USTORE);

-- Name: platform_component_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE platform_component_config (
    component_id bigint DEFAULT nextval('platform_component_id_sequence'::regclass) NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    component_name character varying(100),
    code_lib_name character varying(100),
    charge_person bigint,
    del_flag character varying(10),
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN platform_component_config.component_id IS 'Id编号';
COMMENT ON COLUMN platform_component_config.enterprise_id IS '企业id';
COMMENT ON COLUMN platform_component_config.project_id IS '项目id';
COMMENT ON COLUMN platform_component_config.component_name IS '组件名称';
COMMENT ON COLUMN platform_component_config.code_lib_name IS '代码库名称';
COMMENT ON COLUMN platform_component_config.charge_person IS '负责人';
COMMENT ON COLUMN platform_component_config.del_flag IS '删除标识';
COMMENT ON COLUMN platform_component_config.create_by IS '创建人';
COMMENT ON COLUMN platform_component_config.create_time IS '创建时间';
COMMENT ON COLUMN platform_component_config.update_by IS '更新人';
COMMENT ON COLUMN platform_component_config.update_time IS '更新时间';
ALTER TABLE platform_component_config ADD CONSTRAINT platform_component_config_pkey PRIMARY KEY USING ubtree  (component_id) WITH (storage_type=USTORE);

-- Name: platform_version_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE platform_version_config (
    version_id integer DEFAULT nextval('platform_version_id_sequence'::regclass) NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    component_id bigint,
    version_no character varying(100),
    del_flag character varying(10),
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN platform_version_config.version_id IS 'Id编号';
COMMENT ON COLUMN platform_version_config.enterprise_id IS '企业id';
COMMENT ON COLUMN platform_version_config.project_id IS '项目id';
COMMENT ON COLUMN platform_version_config.component_id IS '组件id';
COMMENT ON COLUMN platform_version_config.version_no IS '版本号';
COMMENT ON COLUMN platform_version_config.del_flag IS '删除标识';
COMMENT ON COLUMN platform_version_config.create_by IS '创建人';
COMMENT ON COLUMN platform_version_config.create_time IS '创建时间';
COMMENT ON COLUMN platform_version_config.update_by IS '更新人';
COMMENT ON COLUMN platform_version_config.update_time IS '更新时间';
ALTER TABLE platform_version_config ADD CONSTRAINT platform_version_config_pkey PRIMARY KEY USING ubtree  (version_id) WITH (storage_type=USTORE);

-- Name: production_event_detail; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE production_event_detail (
    id bigint NOT NULL,
    event_id bigint,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    del_flag character(1) DEFAULT '0'::bpchar,
    event_leader_id bigint,
    event_group_id bigint,
    event_desc character varying(2000),
    analyze_user bigint,
    receive_user bigint,
    issue_type integer,
    business_cause_analyze character varying(2000),
    cr_code character varying(500),
    cr_id bigint,
    relate_system_id character varying(500),
    not_find_cause_type character varying(500),
    not_find_cause_analyze character varying(2000),
    not_find_root_cause_type character varying(500),
    not_find_root_cause_analyze character varying(2000),
    note1 character varying(500),
    note2 character varying(500),
    event_code character varying(500),
    improvement_measure character varying(500),
    improvement_measure_user_id bigint,
    improvement_measure_desc character varying(1000),
    measure_start_time timestamp without time zone,
    measure_end_time timestamp without time zone,
    review_status integer,
    review_option character varying(500),
    group_info character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE production_event_detail IS '生产事件详情表';
COMMENT ON COLUMN production_event_detail.id IS '主键id';
COMMENT ON COLUMN production_event_detail.event_id IS '生产事件主表id';
COMMENT ON COLUMN production_event_detail.create_by IS '创建人';
COMMENT ON COLUMN production_event_detail.create_time IS '创建时间';
COMMENT ON COLUMN production_event_detail.update_by IS '更新人';
COMMENT ON COLUMN production_event_detail.update_time IS '更新时间';
COMMENT ON COLUMN production_event_detail.enterprise_id IS '企业id ';
COMMENT ON COLUMN production_event_detail.project_id IS '项目组id ';
COMMENT ON COLUMN production_event_detail.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN production_event_detail.event_leader_id IS '组长';
COMMENT ON COLUMN production_event_detail.event_group_id IS '组别';
COMMENT ON COLUMN production_event_detail.event_desc IS '问题描述';
COMMENT ON COLUMN production_event_detail.analyze_user IS '生产问题分析人';
COMMENT ON COLUMN production_event_detail.receive_user IS '生产问题接收人';
COMMENT ON COLUMN production_event_detail.issue_type IS '问题类型 1.需求优化/优化建议，2.系统缺陷，3.版本部署问题，4.性能问题，5，第三方问题';
COMMENT ON COLUMN production_event_detail.business_cause_analyze IS '业务场景及原因分析';
COMMENT ON COLUMN production_event_detail.cr_code IS '关联CR号';
COMMENT ON COLUMN production_event_detail.cr_id IS '关联crId';
COMMENT ON COLUMN production_event_detail.relate_system_id IS '关联系统';
COMMENT ON COLUMN production_event_detail.not_find_cause_type IS '测试未发现原因分类 1: 被测功能未覆盖 2: 测试场景设计不充分 3: 测试用例未执行 4: 测试结果验证不充分 5: 测试范围缩减 6: 新增优化需求 7: 其他';
COMMENT ON COLUMN production_event_detail.not_find_cause_analyze IS '测试未发现原因分析';
COMMENT ON COLUMN production_event_detail.not_find_root_cause_type IS '测试未发现根问分类 1: 需求缺失 2: 需求变更未告知测试人员 3: 用例编写不规范 4: 业务只是欠缺 5: 测试技能掌握不熟练 6: 人为疏忽 7: 其他';
COMMENT ON COLUMN production_event_detail.not_find_root_cause_analyze IS '测试未发现根因分析';
COMMENT ON COLUMN production_event_detail.note1 IS '补充说明1';
COMMENT ON COLUMN production_event_detail.note2 IS '补充说明2';
COMMENT ON COLUMN production_event_detail.event_code IS '类似生产问题编号';
COMMENT ON COLUMN production_event_detail.improvement_measure IS '测试是否改进措施 1: 是 2: 否';
COMMENT ON COLUMN production_event_detail.improvement_measure_user_id IS '改进措施责任人';
COMMENT ON COLUMN production_event_detail.improvement_measure_desc IS '改进措施描述';
COMMENT ON COLUMN production_event_detail.measure_start_time IS '措施实施开始时间';
COMMENT ON COLUMN production_event_detail.measure_end_time IS '措施实施结束时间';
COMMENT ON COLUMN production_event_detail.review_status IS '初审状态 1-待评审 2-拒绝 3-通过';
COMMENT ON COLUMN production_event_detail.review_option IS '初审意见';
COMMENT ON COLUMN production_event_detail.group_info IS '组长组别名称信息';
ALTER TABLE production_event_detail ADD CONSTRAINT production_event_detail_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: question_case_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE question_case_relation (
    question_id character varying(32),
    case_id character varying(32),
    case_status character varying(64)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE question_case_relation IS '评审问题案例关联表';
COMMENT ON COLUMN question_case_relation.question_id IS '评审问题id';
COMMENT ON COLUMN question_case_relation.case_id IS '案例id';
COMMENT ON COLUMN question_case_relation.case_status IS '案例整改状态： 增补，修改，未整改';
CREATE INDEX question_case_relation_index ON question_case_relation USING ubtree (question_id, case_id) WITH (storage_type=USTORE) TABLESPACE pg_default;

-- Name: question_risk_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE question_risk_relation (
    question_id character varying(64),
    risk_id character varying(64),
    risk_status character varying(32)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE question_risk_relation IS '评审问题风险关联表';
COMMENT ON COLUMN question_risk_relation.question_id IS '评审问题id';
COMMENT ON COLUMN question_risk_relation.risk_id IS '风险id';
COMMENT ON COLUMN question_risk_relation.risk_status IS '风险整改状态';
CREATE INDEX question_risk_relation_index ON question_risk_relation USING ubtree (question_id, risk_id) WITH (storage_type=USTORE) TABLESPACE pg_default;

-- Name: report_info; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE report_info (
    report_id bigint NOT NULL,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    del_falg character(1),
    enterprise_id bigint,
    project_id bigint,
    report_tile character varying(255),
    report_code character varying(255),
    report_version character varying(255),
    cr_id bigint,
    stage_type character varying(255),
    stage_activity_type integer,
    report_source integer,
    upload_reason character varying(2048),
    report_impl_id bigint,
    report_create_id bigint,
    report_status integer,
    review_status integer,
    test_start_time timestamp without time zone,
    test_end_time timestamp without time zone,
    test_summary character varying(2000),
    test_conclusion character varying(2000),
    test_result_sug character varying(1000),
    test_result_summary character varying(1000),
    test_result character varying(1000),
    valid_result character varying(1000),
    report_valid_result character varying(255),
    micro_flag integer,
    uncompleted_test_case character varying(1000),
    unresolved_defect text,
    report_file character varying(255),
    report_name character varying(255),
    mcr_defect character varying(1000),
    review_person character varying(255),
    uat_no_check_flag integer DEFAULT 0,
    mcr_tester character varying(255),
    mcr_reviewer character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE report_info IS '测试报告';
COMMENT ON COLUMN report_info.report_id IS '主键id';
COMMENT ON COLUMN report_info.create_by IS '创建人';
COMMENT ON COLUMN report_info.create_time IS '创建时间';
COMMENT ON COLUMN report_info.update_by IS '更新人';
COMMENT ON COLUMN report_info.update_time IS '更新时间';
COMMENT ON COLUMN report_info.del_falg IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN report_info.enterprise_id IS '企业id';
COMMENT ON COLUMN report_info.project_id IS '项目组id';
COMMENT ON COLUMN report_info.report_tile IS '报告标题';
COMMENT ON COLUMN report_info.report_code IS '报告编号-预留';
COMMENT ON COLUMN report_info.report_version IS '报告版本';
COMMENT ON COLUMN report_info.cr_id IS 'crid';
COMMENT ON COLUMN report_info.stage_type IS '所属阶段比如SIT UAT';
COMMENT ON COLUMN report_info.stage_activity_type IS '所属活动';
COMMENT ON COLUMN report_info.report_source IS '0线上编写，1线下导入';
COMMENT ON COLUMN report_info.upload_reason IS '上传附件原因';
COMMENT ON COLUMN report_info.report_impl_id IS '实施人id';
COMMENT ON COLUMN report_info.report_create_id IS '创建人id';
COMMENT ON COLUMN report_info.report_status IS '报告状态';
COMMENT ON COLUMN report_info.review_status IS '评审状态';
COMMENT ON COLUMN report_info.test_start_time IS '测试开始时间';
COMMENT ON COLUMN report_info.test_end_time IS '测试结束时间';
COMMENT ON COLUMN report_info.test_summary IS '测试概述';
COMMENT ON COLUMN report_info.test_conclusion IS '测试结论';
COMMENT ON COLUMN report_info.test_result_sug IS '测试情况总结建议-SIT';
COMMENT ON COLUMN report_info.test_result_summary IS '测试情况总结描述-SIT';
COMMENT ON COLUMN report_info.test_result IS '测试情况总结-UAT';
COMMENT ON COLUMN report_info.valid_result IS '测试校验结论-json';
COMMENT ON COLUMN report_info.micro_flag IS '微需求标识，0：不是，1：微需求';
COMMENT ON COLUMN report_info.uncompleted_test_case IS '未完成测试案例情况';
COMMENT ON COLUMN report_info.unresolved_defect IS '未解决缺陷分析';
COMMENT ON COLUMN report_info.report_file IS '报告文件';
COMMENT ON COLUMN report_info.report_name IS '报告文件名';
COMMENT ON COLUMN report_info.mcr_defect IS '微需求缺陷';
COMMENT ON COLUMN report_info.review_person IS '评审人';
COMMENT ON COLUMN report_info.uat_no_check_flag IS 'uat不校验标识； 1：不校验，0：需要校验（默认）';
COMMENT ON COLUMN report_info.mcr_tester IS '微需求测试人';
COMMENT ON COLUMN report_info.mcr_reviewer IS '微需求审核人';
ALTER TABLE report_info ADD CONSTRAINT report_info_pkey PRIMARY KEY USING ubtree  (report_id) WITH (storage_type=USTORE);

-- Name: production_event; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE production_event (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    del_flag character(1) DEFAULT '0'::bpchar,
    event_code character varying(500),
    event_title character varying(500),
    event_dept character varying(500),
    event_level character varying(500),
    event_type character varying(500),
    event_system_id character varying(500),
    status integer,
    event_details text,
    event_cause text,
    event_solution text,
    issue_apply_time timestamp without time zone,
    status_update_time timestamp without time zone,
    source integer,
    audit_opinion character varying(500),
    event_receive_user text,
    event_status integer,
    typical integer DEFAULT 2,
    remark character varying(500)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE production_event IS '生产事件表';
COMMENT ON COLUMN production_event.id IS '主键id';
COMMENT ON COLUMN production_event.create_by IS '创建人';
COMMENT ON COLUMN production_event.create_time IS '创建时间';
COMMENT ON COLUMN production_event.update_by IS '更新人';
COMMENT ON COLUMN production_event.update_time IS '更新时间';
COMMENT ON COLUMN production_event.enterprise_id IS '企业id ';
COMMENT ON COLUMN production_event.project_id IS '项目组id ';
COMMENT ON COLUMN production_event.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN production_event.event_code IS '事件编号';
COMMENT ON COLUMN production_event.event_title IS '事件简描';
COMMENT ON COLUMN production_event.event_dept IS '申请机构';
COMMENT ON COLUMN production_event.event_level IS '事件等级 一般处理,优先处理,p0,p1,p2,p3,p4';
COMMENT ON COLUMN production_event.event_type IS '事件类型 1: 系统操作 2: 系统缺陷 3: 财务信息查询 4: 咨询服务 5: 应用系统缺陷类问题 6: 用户体验类问题 7: 运行环境类问题 8: 其他类问题 9: 需求缺陷类问题 10: 客户体验类 11: 系统功能类 12: 业务流程类 13: 制度类 14: 风险类 15: 硬件类问题 16: 网络类问题 17: 应用系统问题 18: 操作系统问题 19: 中间件问题 20: 数据库问题 21: 操作类问题 22: 变更问题 23:外联问题 24: 其他问题 25: 数据类问题 26: 安全类问题';
COMMENT ON COLUMN production_event.event_system_id IS '所属系统';
COMMENT ON COLUMN production_event.status IS '状态(流转) 1: 未分析 2: 待分配 3: 待分析 4: 初审 5: 待审核 6: 审核通过 7: 已结束 8: 初审(部分退回)';
COMMENT ON COLUMN production_event.event_details IS '事件详述';
COMMENT ON COLUMN production_event.event_cause IS '事件原因';
COMMENT ON COLUMN production_event.event_solution IS '事件解决方案';
COMMENT ON COLUMN production_event.issue_apply_time IS '问题申请时间';
COMMENT ON COLUMN production_event.status_update_time IS '状态更新时间';
COMMENT ON COLUMN production_event.source IS '来源 1: 手工创建 2: 模板导入 3: itil同步';
COMMENT ON COLUMN production_event.audit_opinion IS '审核意见';
COMMENT ON COLUMN production_event.event_receive_user IS '接收人';
COMMENT ON COLUMN production_event.event_status IS '事件状态 1: 待确认 2: 已关闭 3: 主办部门处理中 4: 总行服务台审核 5: 总行服务台受理 6: 处理中 7: 已退回';
COMMENT ON COLUMN production_event.typical IS '是否为典型 1: 是 2: 否';
COMMENT ON COLUMN production_event.remark IS '备注';
ALTER TABLE production_event ADD CONSTRAINT production_event_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: report_other; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE report_other (
    report_id bigint,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    report_code character varying(255),
    stage_type character varying(255),
    no_finish_reason character varying(1000),
    no_finish_sug character varying(1000),
    no_finish_note character varying(1000),
    issues_code character varying(25),
    issues_id bigint,
    issues_name character varying(50),
    issues_priority character varying(255),
    issues_reason character varying(1000),
    issues_impact character varying(1000),
    issues_plan character varying(1000),
    issues_distribution character varying(1000),
    issues_severity character varying(1000),
    issues_risk character varying(1000)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE report_other IS '测试报告-其他信息';
COMMENT ON COLUMN report_other.report_id IS '主键id';
COMMENT ON COLUMN report_other.create_by IS '创建人';
COMMENT ON COLUMN report_other.create_time IS '创建时间';
COMMENT ON COLUMN report_other.update_by IS '更新人';
COMMENT ON COLUMN report_other.update_time IS '更新时间';
COMMENT ON COLUMN report_other.enterprise_id IS '企业id';
COMMENT ON COLUMN report_other.project_id IS '项目组id';
COMMENT ON COLUMN report_other.report_code IS '报告编号-预留';
COMMENT ON COLUMN report_other.stage_type IS '所属阶段比如SIT UAT';
COMMENT ON COLUMN report_other.no_finish_reason IS '未完成原因';
COMMENT ON COLUMN report_other.no_finish_sug IS '未完成建议';
COMMENT ON COLUMN report_other.no_finish_note IS '未完成备注';
COMMENT ON COLUMN report_other.issues_code IS '缺陷号';
COMMENT ON COLUMN report_other.issues_id IS '缺陷id';
COMMENT ON COLUMN report_other.issues_name IS '缺陷名称';
COMMENT ON COLUMN report_other.issues_priority IS '缺陷重要度';
COMMENT ON COLUMN report_other.issues_reason IS '缺陷原因';
COMMENT ON COLUMN report_other.issues_impact IS '缺陷影响';
COMMENT ON COLUMN report_other.issues_plan IS '缺陷后续方案';
COMMENT ON COLUMN report_other.issues_distribution IS '缺陷分布-UAT';
COMMENT ON COLUMN report_other.issues_severity IS '缺陷级别-UAT';
COMMENT ON COLUMN report_other.issues_risk IS '缺陷风险-UAT';

-- Name: report_user_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE report_user_relation (
    report_id bigint,
    user_id bigint,
    user_type integer,
    user_name character varying(50)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE report_user_relation IS '测试报告-执行人关系表';
COMMENT ON COLUMN report_user_relation.report_id IS '报告id';
COMMENT ON COLUMN report_user_relation.user_id IS '用户id';
COMMENT ON COLUMN report_user_relation.user_type IS '1代表执行人';
COMMENT ON COLUMN report_user_relation.user_name IS '用户名';

-- Name: review_case_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE review_case_relation (
    review_id bigint,
    case_id character varying,
    case_order integer,
    review_status integer,
    change_type integer,
    change_reason integer,
    case_warehousing_modify_flag integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE review_case_relation IS '评审与用例关系表';
COMMENT ON COLUMN review_case_relation.review_id IS '评审id';
COMMENT ON COLUMN review_case_relation.case_id IS '用例id';
COMMENT ON COLUMN review_case_relation.case_order IS '用例排序标识-预留字段';
COMMENT ON COLUMN review_case_relation.review_status IS '预留字段';
COMMENT ON COLUMN review_case_relation.change_type IS '变更类型 0:增补 1:修改 2:删除';
COMMENT ON COLUMN review_case_relation.change_reason IS '变更原因 0:需求变更 1:补充测试';
COMMENT ON COLUMN review_case_relation.case_warehousing_modify_flag IS '案例入库标记原因是否更改 0或null：未更改 1：已更改';

-- Name: review_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE review_config (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64),
    update_by character varying(64),
    config_name character varying(64),
    stage_type character varying,
    review_type integer,
    config_desc character varying(255),
    review_scope character varying(1000),
    del_flag character(1) DEFAULT '0'::bpchar,
    review_scope_class character varying(255),
    counter_sign character(1),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE review_config IS '评审配置表';
COMMENT ON COLUMN review_config.id IS 'id';
COMMENT ON COLUMN review_config.create_time IS '创建时间';
COMMENT ON COLUMN review_config.update_time IS '修改时间';
COMMENT ON COLUMN review_config.create_by IS '创建者';
COMMENT ON COLUMN review_config.update_by IS '更新人';
COMMENT ON COLUMN review_config.config_name IS '评审流程名称';
COMMENT ON COLUMN review_config.stage_type IS '测试阶段 0:sit 1:uat';
COMMENT ON COLUMN review_config.review_type IS '评审类型 0:用例评审 1:报告评审';
COMMENT ON COLUMN review_config.config_desc IS '评审流程描述';
COMMENT ON COLUMN review_config.review_scope IS '流程配置范围 testManagerId:测试经理, crProposerId:CR提出人, crPerinchargeId:CR负责人, testContactId:测试联系人, crReviewId:需求评审责任人, crSystemIds:系统负责人, reviewCreator:评审发起人, sitExecId:sit实施经理, uatExecId:uat实施经理';
COMMENT ON COLUMN review_config.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN review_config.review_scope_class IS '流程配置所属的class';
COMMENT ON COLUMN review_config.counter_sign IS '会签 0：false 1：true';
COMMENT ON COLUMN review_config.enterprise_id IS '企业id';
COMMENT ON COLUMN review_config.project_id IS '项目id';
ALTER TABLE review_config ADD CONSTRAINT review_config_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: review_info; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE review_info (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    review_name character varying(255),
    review_code character varying(64),
    enterprise_id bigint,
    project_id bigint,
    review_method character(1),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    cr_id bigint,
    stage_type character varying(255),
    stage_activity_type integer,
    review_process_id bigint,
    report_id bigint,
    task_desc character varying(600),
    review_type character(1),
    create_user_id bigint,
    review_status character varying(64),
    del_flag character(1) DEFAULT '0'::bpchar,
    actual_start_time timestamp(6) without time zone,
    actual_end_time timestamp(6) without time zone,
    review_file character varying(1000),
    review_version character varying(10)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE review_info IS '评审表';
COMMENT ON COLUMN review_info.id IS 'id';
COMMENT ON COLUMN review_info.create_by IS '创建者';
COMMENT ON COLUMN review_info.create_time IS '创建时间';
COMMENT ON COLUMN review_info.update_by IS '更新人';
COMMENT ON COLUMN review_info.update_time IS '修改时间';
COMMENT ON COLUMN review_info.review_name IS '评审名称';
COMMENT ON COLUMN review_info.review_code IS '评审编码';
COMMENT ON COLUMN review_info.enterprise_id IS '企业id';
COMMENT ON COLUMN review_info.project_id IS '项目id';
COMMENT ON COLUMN review_info.review_method IS '评审方式 0:正式评审 1:非正式评审';
COMMENT ON COLUMN review_info.start_time IS '开始时间';
COMMENT ON COLUMN review_info.end_time IS '截止时间';
COMMENT ON COLUMN review_info.cr_id IS 'crId';
COMMENT ON COLUMN review_info.stage_type IS '测试阶段  sit,uat';
COMMENT ON COLUMN review_info.stage_activity_type IS '活动类型：同数据字典';
COMMENT ON COLUMN review_info.review_process_id IS '评审流程id';
COMMENT ON COLUMN review_info.report_id IS '报告id';
COMMENT ON COLUMN review_info.task_desc IS '任务描述';
COMMENT ON COLUMN review_info.review_type IS '评审类型 0:用例评审 1:报告评审';
COMMENT ON COLUMN review_info.create_user_id IS '创建评审人员id';
COMMENT ON COLUMN review_info.review_status IS '评审状态  -1:已撤回  0:未评审 1:评审中 2:评审通过 3:评审未通过';
COMMENT ON COLUMN review_info.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN review_info.actual_start_time IS '实际开始时间';
COMMENT ON COLUMN review_info.actual_end_time IS '实际结束时间';
COMMENT ON COLUMN review_info.review_file IS '评审附件路径';
COMMENT ON COLUMN review_info.review_version IS '评审版本号';
ALTER TABLE review_info ADD CONSTRAINT review_info_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: review_report_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE review_report_relation (
    review_id bigint,
    report_id character varying,
    report_order integer,
    review_status integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);

-- Name: review_user_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE review_user_relation (
    review_id bigint NOT NULL,
    user_id bigint NOT NULL,
    review_status character varying(64) DEFAULT '0'::bpchar,
    review_reason character varying(255),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64),
    update_by character varying(64),
    relation_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE review_user_relation IS '评审执行人关联表';
COMMENT ON COLUMN review_user_relation.review_id IS '评审表id';
COMMENT ON COLUMN review_user_relation.user_id IS '评审执行人userId';
COMMENT ON COLUMN review_user_relation.review_status IS '评审状态 0:未评审 1:评审中 2:评审通过 3:评审未通过';
COMMENT ON COLUMN review_user_relation.review_reason IS '评审原因';
COMMENT ON COLUMN review_user_relation.create_time IS '创建时间';
COMMENT ON COLUMN review_user_relation.update_time IS '更新时间';
COMMENT ON COLUMN review_user_relation.create_by IS '创建人';
COMMENT ON COLUMN review_user_relation.update_by IS '更新人';
COMMENT ON COLUMN review_user_relation.relation_id IS '关系表id';
ALTER TABLE review_user_relation ADD CONSTRAINT review_user_relation_pk PRIMARY KEY USING ubtree  (review_id, user_id) WITH (storage_type=USTORE);

-- Name: risk_case_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE risk_case_relation (
    id bigint NOT NULL,
    risk_id character varying(50),
    case_id character varying(50),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    is_library_case tinyint,
    case_code character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN risk_case_relation.id IS '主键';
COMMENT ON COLUMN risk_case_relation.risk_id IS '风险id';
COMMENT ON COLUMN risk_case_relation.case_id IS '案例id';
COMMENT ON COLUMN risk_case_relation.create_time IS '创建时间';
COMMENT ON COLUMN risk_case_relation.update_time IS '更新时间';
COMMENT ON COLUMN risk_case_relation.is_library_case IS '是否来源于案例库';
COMMENT ON COLUMN risk_case_relation.case_code IS '案例编号';
ALTER TABLE risk_case_relation ADD CONSTRAINT risk_case_relation_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: risk_factor_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE risk_factor_config (
    risk_factor_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    risk_factor character varying(500),
    score_two_min integer,
    score_two_max integer,
    expand_score_two_min integer,
    expand_score_two_max integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE risk_factor_config IS '风险因子表';
COMMENT ON COLUMN risk_factor_config.risk_factor_id IS '主键id';
COMMENT ON COLUMN risk_factor_config.create_by IS '创建人';
COMMENT ON COLUMN risk_factor_config.create_time IS '创建时间';
COMMENT ON COLUMN risk_factor_config.update_by IS '更新人';
COMMENT ON COLUMN risk_factor_config.update_time IS '更新时间';
COMMENT ON COLUMN risk_factor_config.enterprise_id IS '企业Id';
COMMENT ON COLUMN risk_factor_config.project_id IS '项目组id';
COMMENT ON COLUMN risk_factor_config.risk_factor IS '风险因子';
COMMENT ON COLUMN risk_factor_config.score_two_min IS '代表赋分2的最小值';
COMMENT ON COLUMN risk_factor_config.score_two_max IS '代表赋分2的最大值';
COMMENT ON COLUMN risk_factor_config.expand_score_two_min IS '代表赋分2的最小值（用于判断扩展区间使用）';
COMMENT ON COLUMN risk_factor_config.expand_score_two_max IS '代表赋分2的最大值（用于判断扩展区间使用）';
ALTER TABLE risk_factor_config ADD CONSTRAINT risk_factor_config_pkey PRIMARY KEY USING ubtree  (risk_factor_id) WITH (storage_type=USTORE);

-- Name: risk_issue_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE risk_issue_relation (
    id bigint NOT NULL,
    risk_id character varying(50),
    issue_id character varying(50),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    issue_no character varying(100),
    is_library_risk character varying(5) DEFAULT 2
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN risk_issue_relation.issue_no IS '缺陷编号';
COMMENT ON COLUMN risk_issue_relation.is_library_risk IS '是否来自资产库风险：1-是，2-不是';
ALTER TABLE risk_issue_relation ADD CONSTRAINT risk_issue_relation_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: risk_level_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE risk_level_config (
    risk_level_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    high_risk_max integer,
    high_risk_min integer,
    medium_risk_max integer,
    medium_risk_min integer,
    low_risk_max integer,
    low_risk_min integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE risk_level_config IS '风险等级表';
COMMENT ON COLUMN risk_level_config.risk_level_id IS '主键id';
COMMENT ON COLUMN risk_level_config.create_by IS '创建人';
COMMENT ON COLUMN risk_level_config.create_time IS '创建时间';
COMMENT ON COLUMN risk_level_config.update_by IS '更新人';
COMMENT ON COLUMN risk_level_config.update_time IS '更新时间';
COMMENT ON COLUMN risk_level_config.enterprise_id IS '企业Id';
COMMENT ON COLUMN risk_level_config.project_id IS '项目组id';
COMMENT ON COLUMN risk_level_config.high_risk_max IS '高风险最大值';
COMMENT ON COLUMN risk_level_config.high_risk_min IS '高风险最小值';
COMMENT ON COLUMN risk_level_config.medium_risk_max IS '中风险最大值';
COMMENT ON COLUMN risk_level_config.medium_risk_min IS '中风险最小值';
COMMENT ON COLUMN risk_level_config.low_risk_max IS '低风险最大值';
COMMENT ON COLUMN risk_level_config.low_risk_min IS '低风险最小值';
ALTER TABLE risk_level_config ADD CONSTRAINT risk_level_config_pkey PRIMARY KEY USING ubtree  (risk_level_id) WITH (storage_type=USTORE);

-- Name: status_transfer; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE status_transfer (
    id bigint NOT NULL,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    start_status_id bigint,
    end_status_id bigint,
    step_name character varying(255),
    step_sort integer,
    receiver_type integer,
    receiver_roles character varying(1000),
    receiver_ids character varying(1000),
    receiver_fields character varying(1000),
    template_id bigint,
    editable_fields character varying(500)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE status_transfer IS '缺陷状态流转表';
COMMENT ON COLUMN status_transfer.id IS '主键id';
COMMENT ON COLUMN status_transfer.create_by IS '创建人';
COMMENT ON COLUMN status_transfer.create_time IS '创建时间';
COMMENT ON COLUMN status_transfer.update_by IS '更新人';
COMMENT ON COLUMN status_transfer.update_time IS '更新时间';
COMMENT ON COLUMN status_transfer.enterprise_id IS '企业id';
COMMENT ON COLUMN status_transfer.project_id IS '项目组id';
COMMENT ON COLUMN status_transfer.start_status_id IS '状态开始Id';
COMMENT ON COLUMN status_transfer.end_status_id IS '状态结束Id';
COMMENT ON COLUMN status_transfer.step_name IS '步骤名称';
COMMENT ON COLUMN status_transfer.step_sort IS '步骤排序';
COMMENT ON COLUMN status_transfer.receiver_type IS '1角色，2指定字段 3用户ids';
COMMENT ON COLUMN status_transfer.receiver_roles IS '角色ids';
COMMENT ON COLUMN status_transfer.receiver_ids IS '字段名字';
COMMENT ON COLUMN status_transfer.receiver_fields IS '用户ids';
COMMENT ON COLUMN status_transfer.template_id IS '流程id';
COMMENT ON COLUMN status_transfer.editable_fields IS '可编辑的字段信息';
ALTER TABLE status_transfer ADD CONSTRAINT status_transfer_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: status_transfer_display_fields; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE status_transfer_display_fields (
    id bigint NOT NULL,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    transfer_id bigint,
    field_id bigint,
    field_display tinyint,
    field_position integer,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN status_transfer_display_fields.create_by IS '创建人';
COMMENT ON COLUMN status_transfer_display_fields.create_time IS '创建时间';
COMMENT ON COLUMN status_transfer_display_fields.update_by IS '更新人';
COMMENT ON COLUMN status_transfer_display_fields.update_time IS '更新时间';
COMMENT ON COLUMN status_transfer_display_fields.transfer_id IS '流转id';
COMMENT ON COLUMN status_transfer_display_fields.field_id IS '字段id';
COMMENT ON COLUMN status_transfer_display_fields.field_display IS '显示方式; 1: 显示只读,0: 不显示';
COMMENT ON COLUMN status_transfer_display_fields.field_position IS '排序';
COMMENT ON COLUMN status_transfer_display_fields.enterprise_id IS '企业Id';
COMMENT ON COLUMN status_transfer_display_fields.project_id IS '项目id';
ALTER TABLE status_transfer_display_fields ADD CONSTRAINT status_transfer_display_fields_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: status_transfer_fields; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE status_transfer_fields (
    id bigint NOT NULL,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    transfer_id bigint,
    field_id bigint,
    field_required tinyint,
    field_position integer,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE status_transfer_fields IS '缺陷状态流转表-字段';
COMMENT ON COLUMN status_transfer_fields.id IS '主键id';
COMMENT ON COLUMN status_transfer_fields.create_by IS '创建人';
COMMENT ON COLUMN status_transfer_fields.create_time IS '创建时间';
COMMENT ON COLUMN status_transfer_fields.update_by IS '更新人';
COMMENT ON COLUMN status_transfer_fields.update_time IS '更新时间';
COMMENT ON COLUMN status_transfer_fields.transfer_id IS '流转id';
COMMENT ON COLUMN status_transfer_fields.field_id IS '字段id';
COMMENT ON COLUMN status_transfer_fields.field_required IS '是否必填';
COMMENT ON COLUMN status_transfer_fields.field_position IS '排序';
COMMENT ON COLUMN status_transfer_fields.enterprise_id IS '企业Id';
COMMENT ON COLUMN status_transfer_fields.project_id IS '项目id';
ALTER TABLE status_transfer_fields ADD CONSTRAINT status_transfer_fields_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_allplan; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_allplan (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    cr_id bigint NOT NULL,
    overall_plan character varying(30),
    devepol_stage_start_time timestamp without time zone,
    devepol_stage_end_time timestamp without time zone,
    vp_cr_id bigint,
    project_id bigint,
    enterprise_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_allplan IS 'CR的整体计划表';
COMMENT ON COLUMN story_cr_allplan.id IS 'CR的整体计划主键ID';
COMMENT ON COLUMN story_cr_allplan.create_by IS '创建人';
COMMENT ON COLUMN story_cr_allplan.create_time IS '创建时间';
COMMENT ON COLUMN story_cr_allplan.update_by IS '更新人';
COMMENT ON COLUMN story_cr_allplan.update_time IS '更新时间';
COMMENT ON COLUMN story_cr_allplan.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_allplan.overall_plan IS '整体计划标识';
COMMENT ON COLUMN story_cr_allplan.devepol_stage_start_time IS '开发阶段计划开始时间';
COMMENT ON COLUMN story_cr_allplan.devepol_stage_end_time IS '开发阶段计划结束时间';
COMMENT ON COLUMN story_cr_allplan.vp_cr_id IS 'vp的crId';
COMMENT ON COLUMN story_cr_allplan.project_id IS '项目组id';
COMMENT ON COLUMN story_cr_allplan.enterprise_id IS '企业id';
ALTER TABLE story_cr_allplan ADD CONSTRAINT story_cr_allplan_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_evaluation_issue; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_evaluation_issue (
    cr_id bigint NOT NULL,
    parent_issue_id character varying(100),
    issue_id character varying(100),
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN story_cr_evaluation_issue.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_evaluation_issue.parent_issue_id IS '原缺陷id';
COMMENT ON COLUMN story_cr_evaluation_issue.issue_id IS '质量问题id';

-- Name: story_cr_follow; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_follow (
    cr_id bigint,
    user_id bigint,
    cr_type integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_follow IS '用户和cr关注表';
COMMENT ON COLUMN story_cr_follow.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_follow.user_id IS '系统id';
COMMENT ON COLUMN story_cr_follow.cr_type IS 'CR类型  0:cr  1:（非cr）工单';

-- Name: story_cr_interface; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_interface (
    interface_id bigint NOT NULL,
    create_by character varying(50),
    update_by character varying(50),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    mind_id bigint,
    stage_id bigint,
    stage_type character varying(100),
    dir_id character varying(64),
    interface_name character varying(1000),
    parent_node_match_system smallint,
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    case_total integer,
    manual_count integer,
    adopt_count integer,
    del_flag character(1),
    interface_text text
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN story_cr_interface.mind_id IS '脑图id';
COMMENT ON COLUMN story_cr_interface.stage_id IS '阶段id';
COMMENT ON COLUMN story_cr_interface.stage_type IS '阶段类型：SIT,UAT';
COMMENT ON COLUMN story_cr_interface.dir_id IS '节点id';
COMMENT ON COLUMN story_cr_interface.interface_name IS '接口名称';
COMMENT ON COLUMN story_cr_interface.parent_node_match_system IS '父节点是否是一二级模块';
COMMENT ON COLUMN story_cr_interface.system_id IS '系统id';
COMMENT ON COLUMN story_cr_interface.first_module_id IS '一级模块id';
COMMENT ON COLUMN story_cr_interface.second_module_id IS '二级模块id';
COMMENT ON COLUMN story_cr_interface.case_total IS '测试需求点总数';
COMMENT ON COLUMN story_cr_interface.manual_count IS '手工添加需求点数';
COMMENT ON COLUMN story_cr_interface.adopt_count IS '采纳的测试需求点数';
COMMENT ON COLUMN story_cr_interface.del_flag IS '删除类型： 0-正常，1-删除';
COMMENT ON COLUMN story_cr_interface.interface_text IS '接口信息文本';
ALTER TABLE story_cr_interface ADD CONSTRAINT story_cr_interface_pkey PRIMARY KEY USING ubtree  (interface_id) WITH (storage_type=USTORE);

-- Name: story_cr_key_project_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_key_project_config (
    key_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1),
    enterprise_id bigint,
    project_id bigint,
    key_name character varying(100),
    key_content character varying(1000),
    cr_id bigint,
    process_code character varying(100),
    process_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_key_project_config IS '重点项目配置';
COMMENT ON COLUMN story_cr_key_project_config.key_id IS '主键id';
COMMENT ON COLUMN story_cr_key_project_config.create_by IS '创建人';
COMMENT ON COLUMN story_cr_key_project_config.update_by IS '更新人';
COMMENT ON COLUMN story_cr_key_project_config.create_time IS '创建时间';
COMMENT ON COLUMN story_cr_key_project_config.update_time IS '更新时间';
COMMENT ON COLUMN story_cr_key_project_config.del_flag IS '删除标识';
COMMENT ON COLUMN story_cr_key_project_config.enterprise_id IS '企业id';
COMMENT ON COLUMN story_cr_key_project_config.project_id IS '项目组id';
COMMENT ON COLUMN story_cr_key_project_config.key_name IS '名称';
COMMENT ON COLUMN story_cr_key_project_config.key_content IS '内容';
ALTER TABLE story_cr_key_project_config ADD CONSTRAINT evaluation_key_project_config_pkey PRIMARY KEY USING ubtree  (key_id) WITH (storage_type=USTORE);

-- Name: story_cr_manage_process; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_manage_process (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    cr_id bigint NOT NULL,
    process_id character varying(20),
    process_name character varying(50),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    is_complete character varying(10),
    assignee character varying(100),
    vp_cr_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_manage_process IS 'CR的管理流程';
COMMENT ON COLUMN story_cr_manage_process.id IS 'CR的管理流程主键ID';
COMMENT ON COLUMN story_cr_manage_process.create_by IS '创建人';
COMMENT ON COLUMN story_cr_manage_process.create_time IS '创建时间';
COMMENT ON COLUMN story_cr_manage_process.update_by IS '更新人';
COMMENT ON COLUMN story_cr_manage_process.update_time IS '更新时间';
COMMENT ON COLUMN story_cr_manage_process.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_manage_process.process_id IS '流程id';
COMMENT ON COLUMN story_cr_manage_process.process_name IS '流程名称';
COMMENT ON COLUMN story_cr_manage_process.start_time IS '开始时间';
COMMENT ON COLUMN story_cr_manage_process.end_time IS '结束时间';
COMMENT ON COLUMN story_cr_manage_process.is_complete IS '是否完成';
COMMENT ON COLUMN story_cr_manage_process.assignee IS '处理人';
COMMENT ON COLUMN story_cr_manage_process.vp_cr_id IS 'vp的crId';
ALTER TABLE story_cr_manage_process ADD CONSTRAINT story_cr_manage_process_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_milepost; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_milepost (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    cr_id bigint NOT NULL,
    milepost_name character varying(255),
    deliverables character varying(255),
    milepost_time_start timestamp without time zone,
    milepost_time timestamp without time zone,
    milepost_duration character varying(255),
    early_warning_time timestamp without time zone,
    remark character varying(255),
    milepost_type character varying(20),
    rank_flag character(1) DEFAULT '0'::bpchar,
    system_id bigint,
    vp_cr_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_milepost IS 'CR的里程碑表';
COMMENT ON COLUMN story_cr_milepost.id IS 'CR的里程碑表主键ID';
COMMENT ON COLUMN story_cr_milepost.create_by IS '创建人';
COMMENT ON COLUMN story_cr_milepost.create_time IS '创建时间';
COMMENT ON COLUMN story_cr_milepost.update_by IS '更新人';
COMMENT ON COLUMN story_cr_milepost.update_time IS '更新时间';
COMMENT ON COLUMN story_cr_milepost.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_milepost.milepost_name IS '里程碑名称';
COMMENT ON COLUMN story_cr_milepost.deliverables IS '交付物';
COMMENT ON COLUMN story_cr_milepost.milepost_time_start IS '里程碑开始时间';
COMMENT ON COLUMN story_cr_milepost.milepost_time IS '里程碑时间点';
COMMENT ON COLUMN story_cr_milepost.milepost_duration IS '工期';
COMMENT ON COLUMN story_cr_milepost.early_warning_time IS '预警时间';
COMMENT ON COLUMN story_cr_milepost.remark IS '备注';
COMMENT ON COLUMN story_cr_milepost.milepost_type IS '里程碑类型';
COMMENT ON COLUMN story_cr_milepost.rank_flag IS '里程碑级别 0：cr级里程碑 ； 1：系统级里程碑';
COMMENT ON COLUMN story_cr_milepost.system_id IS '系统id';
COMMENT ON COLUMN story_cr_milepost.vp_cr_id IS 'vp的crId';
ALTER TABLE story_cr_milepost ADD CONSTRAINT story_cr_milepost_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_mind; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_mind (
    mind_id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1),
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    stage_type character varying(50),
    mind_content text,
    mind_title character varying(500),
    description character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN story_cr_mind.mind_id IS '脑图id';
COMMENT ON COLUMN story_cr_mind.create_by IS '创建人';
COMMENT ON COLUMN story_cr_mind.update_by IS '更新人';
COMMENT ON COLUMN story_cr_mind.create_time IS '创建时间';
COMMENT ON COLUMN story_cr_mind.update_time IS '更新时间';
COMMENT ON COLUMN story_cr_mind.del_flag IS '删除标识';
COMMENT ON COLUMN story_cr_mind.enterprise_id IS '企业id';
COMMENT ON COLUMN story_cr_mind.project_id IS '项目组id';
COMMENT ON COLUMN story_cr_mind.cr_id IS 'crid';
COMMENT ON COLUMN story_cr_mind.stage_type IS '阶段标识';
COMMENT ON COLUMN story_cr_mind.mind_content IS '脑图内容';
COMMENT ON COLUMN story_cr_mind.mind_title IS '脑图标题';
COMMENT ON COLUMN story_cr_mind.description IS '脑图描述';
ALTER TABLE story_cr_mind ADD CONSTRAINT story_cr_mind_pkey PRIMARY KEY USING ubtree  (mind_id) WITH (storage_type=USTORE);

-- Name: story_cr_stage; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_stage (
    id bigint NOT NULL,
    create_by character varying(20),
    update_by character varying(1000),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag integer DEFAULT 0,
    enterprise_id bigint,
    project_id bigint,
    process_id bigint,
    cr_id bigint,
    stage_id bigint,
    stage_type character varying(255),
    test_environment character varying(1000),
    environment_require character varying(1000),
    cut_reason character varying(512),
    circuit_start_time timestamp without time zone,
    circuit_end_time timestamp without time zone,
    exec_id bigint,
    stage_status integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_stage IS 'CR-阶段';
COMMENT ON COLUMN story_cr_stage.id IS '主键id';
COMMENT ON COLUMN story_cr_stage.create_by IS '用例创建人';
COMMENT ON COLUMN story_cr_stage.update_by IS '用例修改人';
COMMENT ON COLUMN story_cr_stage.create_time IS '记录创建时间';
COMMENT ON COLUMN story_cr_stage.update_time IS '修改时间';
COMMENT ON COLUMN story_cr_stage.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN story_cr_stage.enterprise_id IS '企业id';
COMMENT ON COLUMN story_cr_stage.project_id IS '项目组id';
COMMENT ON COLUMN story_cr_stage.process_id IS '流程id';
COMMENT ON COLUMN story_cr_stage.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_stage.stage_id IS '阶段id';
COMMENT ON COLUMN story_cr_stage.stage_type IS '阶段类型：SIT,UAT';
COMMENT ON COLUMN story_cr_stage.test_environment IS '测试环境';
COMMENT ON COLUMN story_cr_stage.environment_require IS '环境要求';
COMMENT ON COLUMN story_cr_stage.cut_reason IS '裁剪原因';
COMMENT ON COLUMN story_cr_stage.circuit_start_time IS '线路图开始时间';
COMMENT ON COLUMN story_cr_stage.circuit_end_time IS '线路图结束时间';
COMMENT ON COLUMN story_cr_stage.exec_id IS '实施经理-人员ID';
COMMENT ON COLUMN story_cr_stage.stage_status IS '阶段状态 0:未开始 1:进行中 2:已完成';
ALTER TABLE story_cr_stage ADD CONSTRAINT story_cr_stage_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_stage_activity; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_stage_activity (
    id bigint NOT NULL,
    create_by character varying(20),
    update_by character varying(1000),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag integer DEFAULT 0,
    enterprise_id bigint,
    project_id bigint,
    process_id bigint,
    cr_id bigint,
    stage_id bigint,
    stage_type character varying(255),
    circuit_start_time timestamp without time zone,
    circuit_end_time timestamp without time zone,
    exec_id bigint,
    activity_status integer,
    activity_type integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_stage_activity IS 'CR-阶段下的活动';
COMMENT ON COLUMN story_cr_stage_activity.id IS '主键id';
COMMENT ON COLUMN story_cr_stage_activity.create_by IS '用例创建人';
COMMENT ON COLUMN story_cr_stage_activity.update_by IS '用例修改人';
COMMENT ON COLUMN story_cr_stage_activity.create_time IS '记录创建时间';
COMMENT ON COLUMN story_cr_stage_activity.update_time IS '修改时间';
COMMENT ON COLUMN story_cr_stage_activity.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN story_cr_stage_activity.enterprise_id IS '企业id';
COMMENT ON COLUMN story_cr_stage_activity.project_id IS '项目组id';
COMMENT ON COLUMN story_cr_stage_activity.process_id IS '流程id';
COMMENT ON COLUMN story_cr_stage_activity.cr_id IS 'crId';
COMMENT ON COLUMN story_cr_stage_activity.stage_id IS '阶段id';
COMMENT ON COLUMN story_cr_stage_activity.stage_type IS '阶段类型：SIT,UAT';
COMMENT ON COLUMN story_cr_stage_activity.circuit_start_time IS '线路图开始时间';
COMMENT ON COLUMN story_cr_stage_activity.circuit_end_time IS '线路图结束时间';
COMMENT ON COLUMN story_cr_stage_activity.activity_status IS '活动状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN story_cr_stage_activity.activity_type IS '活动类型-取数据字典';
ALTER TABLE story_cr_stage_activity ADD CONSTRAINT story_cr_stage_activity_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_system_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_system_relation (
    cr_id bigint,
    system_id bigint,
    vp_flag character(1),
    vp_cr_id bigint,
    relation_system_type integer,
    create_by character varying(64),
    create_time timestamp(6) without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_system_relation IS 'cr关联系统';
COMMENT ON COLUMN story_cr_system_relation.relation_system_type IS '0:工作量系统，1：配合系统';

-- Name: story_cr_requirement; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_requirement (
    requirement_id bigint NOT NULL,
    create_by character varying(50),
    update_by character varying(50),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    del_flag character(1),
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    mind_id bigint,
    stage_id bigint,
    stage_type character varying(100),
    dir_id bigint,
    requirement_name character varying(1000),
    requirement_code character varying(255),
    requirement_desc character varying(255),
    parent_node_match_system smallint,
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    interface_id bigint,
    source_type character varying(5),
    requirement_node character varying(256),
    is_support_ai character varying(5),
    node_id character varying(64),
    priority integer,
    origin_test_point_info character varying(1000),
    adopt_type character varying(5),
    adopt_notes character varying(1000)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_requirement IS '测试需求点表';
COMMENT ON COLUMN story_cr_requirement.requirement_id IS '需求点id';
COMMENT ON COLUMN story_cr_requirement.create_by IS '创建人';
COMMENT ON COLUMN story_cr_requirement.update_by IS '更新人';
COMMENT ON COLUMN story_cr_requirement.create_time IS '创建时间';
COMMENT ON COLUMN story_cr_requirement.update_time IS '更新时间';
COMMENT ON COLUMN story_cr_requirement.del_flag IS '删除标识';
COMMENT ON COLUMN story_cr_requirement.enterprise_id IS '企业id';
COMMENT ON COLUMN story_cr_requirement.project_id IS '项目组id';
COMMENT ON COLUMN story_cr_requirement.cr_id IS 'crid';
COMMENT ON COLUMN story_cr_requirement.mind_id IS '脑图id';
COMMENT ON COLUMN story_cr_requirement.stage_id IS '阶段id';
COMMENT ON COLUMN story_cr_requirement.stage_type IS '阶段类型';
COMMENT ON COLUMN story_cr_requirement.dir_id IS '目录id';
COMMENT ON COLUMN story_cr_requirement.requirement_name IS '需求点名称';
COMMENT ON COLUMN story_cr_requirement.requirement_code IS '需求点编号';
COMMENT ON COLUMN story_cr_requirement.requirement_desc IS '需求点描述';
COMMENT ON COLUMN story_cr_requirement.parent_node_match_system IS '父节点是否是系统的模块';
COMMENT ON COLUMN story_cr_requirement.system_id IS '系统id';
COMMENT ON COLUMN story_cr_requirement.first_module_id IS '一级模块Id';
COMMENT ON COLUMN story_cr_requirement.second_module_id IS '二级模块Id';
COMMENT ON COLUMN story_cr_requirement.interface_id IS '接口id';
COMMENT ON COLUMN story_cr_requirement.source_type IS '测试需求点来源：1、大模型 2、风险引入 3、手动引入';
COMMENT ON COLUMN story_cr_requirement.requirement_node IS '测试需求点类型';
COMMENT ON COLUMN story_cr_requirement.is_support_ai IS '是否支持AI设计：1-支持，2-不支持';
COMMENT ON COLUMN story_cr_requirement.node_id IS '脑图中的节点ID';
COMMENT ON COLUMN story_cr_requirement.origin_test_point_info IS '生成的测试需求点源数据';
COMMENT ON COLUMN story_cr_requirement.adopt_type IS '采纳类型，1-完全采纳 2-部分采纳';
COMMENT ON COLUMN story_cr_requirement.adopt_notes IS '采纳备注';
ALTER TABLE story_cr_requirement ADD CONSTRAINT story_cr_requirement_pkey PRIMARY KEY USING ubtree  (requirement_id) WITH (storage_type=USTORE);

-- Name: story_cr_system_relation_2; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_system_relation_2 (
    cr_id bigint,
    system_id bigint,
    vp_flag character(1),
    vp_cr_id bigint,
    relation_system_type integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);

-- Name: sys_calendar; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_calendar (
    calendar_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    year integer,
    date_config timestamp without time zone,
    config_type character varying(64),
    del_flag character(1) DEFAULT '0'::bpchar
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_calendar IS '日历管理表';
COMMENT ON COLUMN sys_calendar.calendar_id IS '主键id';
COMMENT ON COLUMN sys_calendar.create_by IS '创建人';
COMMENT ON COLUMN sys_calendar.create_time IS '创建时间';
COMMENT ON COLUMN sys_calendar.update_by IS '更新人';
COMMENT ON COLUMN sys_calendar.update_time IS '更新时间';
COMMENT ON COLUMN sys_calendar.enterprise_id IS '企业id ';
COMMENT ON COLUMN sys_calendar.project_id IS '项目组id ';
COMMENT ON COLUMN sys_calendar.year IS '所属年份';
COMMENT ON COLUMN sys_calendar.date_config IS '日期配置';
COMMENT ON COLUMN sys_calendar.config_type IS '配置类型	holiday: 节假日	workday: 必要工作日';
COMMENT ON COLUMN sys_calendar.del_flag IS '删除状态 0:正常 1:删除';
ALTER TABLE sys_calendar ADD CONSTRAINT sys_calendar_pkey PRIMARY KEY USING ubtree  (calendar_id) WITH (storage_type=USTORE);

-- Name: sys_checks_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_checks_config (
    config_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1),
    enterprise_id bigint,
    project_id bigint,
    checks_type character varying(100),
    checks_description character varying(2000),
    checks_domain character varying(100),
    checks_status integer,
    checks_field_content character varying(50000),
    checks_condition_content character varying(5000),
    checks_test_stage character varying(10)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_checks_config IS '系统检查项';
COMMENT ON COLUMN sys_checks_config.config_id IS '主键id';
COMMENT ON COLUMN sys_checks_config.create_by IS '创建人';
COMMENT ON COLUMN sys_checks_config.create_time IS '创建时间';
COMMENT ON COLUMN sys_checks_config.update_by IS '更新人';
COMMENT ON COLUMN sys_checks_config.update_time IS '更新时间';
COMMENT ON COLUMN sys_checks_config.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_checks_config.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_checks_config.project_id IS '项目id';
COMMENT ON COLUMN sys_checks_config.checks_type IS '案例设计:case_design，案例评审:case_review，案例执行:case_execute，缺陷:defect，风险:risk，生产问题:product_issue';
COMMENT ON COLUMN sys_checks_config.checks_description IS '检核项描述';
COMMENT ON COLUMN sys_checks_config.checks_domain IS '测试需求点:test_requirement_point， 测试案例:test_case，案例评审:case_review，案例执行:case_execute，缺陷:defect，风险:risk，生产问题:production_issue';
COMMENT ON COLUMN sys_checks_config.checks_status IS '状态 0:停用	1:启动';
COMMENT ON COLUMN sys_checks_config.checks_field_content IS '检核对象字段';
COMMENT ON COLUMN sys_checks_config.checks_condition_content IS '触发条件';
COMMENT ON COLUMN sys_checks_config.checks_test_stage IS '测试阶段 SIT UAT';
ALTER TABLE sys_checks_config ADD CONSTRAINT sys_checks_config_pkey PRIMARY KEY USING ubtree  (config_id) WITH (storage_type=USTORE);

-- Name: sys_dept; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_dept (
    dept_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    enterprise_id bigint NOT NULL,
    dept_name character varying(255) DEFAULT NULL::character varying,
    sort_order integer DEFAULT 0 NOT NULL,
    parent_id bigint,
    del_flag character(1) DEFAULT '0'::bpchar,
    org_code character varying(255),
    org_type character varying(20),
    full_path_name character varying(255),
    parent_code character varying(255),
    org_code_dept character varying(255),
    org_code_room character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_dept IS '部门管理';
COMMENT ON COLUMN sys_dept.create_time IS '创建时间';
COMMENT ON COLUMN sys_dept.update_time IS '修改时间';
COMMENT ON COLUMN sys_dept.create_by IS '创建者';
COMMENT ON COLUMN sys_dept.update_by IS '更新人';
COMMENT ON COLUMN sys_dept.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_dept.dept_name IS '部门名称';
COMMENT ON COLUMN sys_dept.sort_order IS '排序';
COMMENT ON COLUMN sys_dept.parent_id IS '父企业id';
COMMENT ON COLUMN sys_dept.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_dept.org_code IS '机构编码';
COMMENT ON COLUMN sys_dept.org_type IS '机构类型';
COMMENT ON COLUMN sys_dept.full_path_name IS '全路径';
COMMENT ON COLUMN sys_dept.parent_code IS '父机构编码';
COMMENT ON COLUMN sys_dept.org_code_dept IS '部门';
COMMENT ON COLUMN sys_dept.org_code_room IS '科室';
ALTER TABLE sys_dept ADD CONSTRAINT sys_dept_pkey PRIMARY KEY USING ubtree  (dept_id) WITH (storage_type=USTORE);

-- Name: sys_dept_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_dept_relation (
    ancestor bigint NOT NULL,
    descendant bigint NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
ALTER TABLE sys_dept_relation ADD CONSTRAINT sys_dept_relation_pkey PRIMARY KEY USING ubtree  (ancestor, descendant) WITH (storage_type=USTORE);

-- Name: sys_dict; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_dict (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    enterprise_id bigint NOT NULL,
    dict_key character varying(100) DEFAULT NULL::character varying,
    description character varying(100) DEFAULT NULL::character varying,
    remark character varying(255) DEFAULT NULL::character varying,
    system_flag character(1) DEFAULT '0'::bpchar,
    del_flag character(1) DEFAULT '0'::bpchar
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_dict IS '字典表';
COMMENT ON COLUMN sys_dict.create_time IS '创建时间';
COMMENT ON COLUMN sys_dict.update_time IS '修改时间';
COMMENT ON COLUMN sys_dict.create_by IS '创建者';
COMMENT ON COLUMN sys_dict.update_by IS '更新人';
COMMENT ON COLUMN sys_dict.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_dict.dict_key IS '标识';
COMMENT ON COLUMN sys_dict.description IS '描述';
COMMENT ON COLUMN sys_dict.remark IS '备注';
COMMENT ON COLUMN sys_dict.system_flag IS '是否是系统内置';
COMMENT ON COLUMN sys_dict.del_flag IS '0-正常，1-删除';
ALTER TABLE sys_dict ADD CONSTRAINT sys_dict_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_dict_item; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_dict_item (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    dict_id bigint NOT NULL,
    dict_key character varying(100) DEFAULT NULL::character varying,
    value character varying(100) DEFAULT NULL::character varying,
    label character varying(100) DEFAULT NULL::character varying,
    type character varying(100) DEFAULT NULL::character varying,
    description character varying(100) DEFAULT NULL::character varying,
    sort_order integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ' '::character varying,
    del_flag character(1) DEFAULT '0'::bpchar,
    icon character varying(255),
    color character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_dict_item IS '字典项';
COMMENT ON COLUMN sys_dict_item.create_time IS '创建时间';
COMMENT ON COLUMN sys_dict_item.update_time IS '修改时间';
COMMENT ON COLUMN sys_dict_item.create_by IS '创建者';
COMMENT ON COLUMN sys_dict_item.update_by IS '更新人';
COMMENT ON COLUMN sys_dict_item.dict_id IS '字典ID';
COMMENT ON COLUMN sys_dict_item.dict_key IS '字典标识';
COMMENT ON COLUMN sys_dict_item.value IS '值';
COMMENT ON COLUMN sys_dict_item.label IS '标签';
COMMENT ON COLUMN sys_dict_item.type IS '字典类型';
COMMENT ON COLUMN sys_dict_item.description IS '描述';
COMMENT ON COLUMN sys_dict_item.sort_order IS '排序（升序）';
COMMENT ON COLUMN sys_dict_item.remark IS '备注';
COMMENT ON COLUMN sys_dict_item.del_flag IS '0-正常，1-删除';
ALTER TABLE sys_dict_item ADD CONSTRAINT sys_dict_item_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_download; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_download (
    file_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1),
    creator_id bigint,
    file_type character varying(100),
    file_name character varying(1000),
    original character varying(255),
    file_url character varying(2000),
    status character(1),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_download IS '下载中心表';
COMMENT ON COLUMN sys_download.file_id IS '文件id';
COMMENT ON COLUMN sys_download.create_by IS '创建人';
COMMENT ON COLUMN sys_download.create_time IS '创建时间';
COMMENT ON COLUMN sys_download.update_by IS '更新人';
COMMENT ON COLUMN sys_download.update_time IS '更新时间';
COMMENT ON COLUMN sys_download.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_download.creator_id IS '创建人id';
COMMENT ON COLUMN sys_download.file_type IS '文件类型:案例导出case	测试证迹导出test_evidence	测试报告导出test_report	自定义报表导出custom_report';
COMMENT ON COLUMN sys_download.file_name IS '文件名称';
COMMENT ON COLUMN sys_download.original IS '原文件名称';
COMMENT ON COLUMN sys_download.file_url IS '文件路径';
COMMENT ON COLUMN sys_download.status IS '状态 0-开始 1-进行中 2-已完成';
COMMENT ON COLUMN sys_download.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_download.project_id IS '项目id';
ALTER TABLE sys_download ADD CONSTRAINT sys_download_pkey PRIMARY KEY USING ubtree  (file_id) WITH (storage_type=USTORE);

-- Name: sys_enterprise; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_enterprise (
    enterprise_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    enterprise_code character varying(64) DEFAULT NULL::character varying,
    enterprise_name character varying(128) DEFAULT NULL::character varying,
    enterprise_logo character varying(128) DEFAULT NULL::character varying,
    enterprise_desc character varying(512) DEFAULT NULL::character varying,
    del_flag character(1) DEFAULT '0'::bpchar
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN sys_enterprise.create_time IS '创建时间';
COMMENT ON COLUMN sys_enterprise.update_time IS '更新时间';
COMMENT ON COLUMN sys_enterprise.create_by IS '创建人';
COMMENT ON COLUMN sys_enterprise.update_by IS '更新人';
COMMENT ON COLUMN sys_enterprise.enterprise_code IS '企业编号';
COMMENT ON COLUMN sys_enterprise.enterprise_name IS '企业名称';
COMMENT ON COLUMN sys_enterprise.enterprise_logo IS '企业LOGO';
COMMENT ON COLUMN sys_enterprise.enterprise_desc IS '企业描述';
COMMENT ON COLUMN sys_enterprise.del_flag IS '删除标记，0-正常，1-删除';
ALTER TABLE sys_enterprise ADD CONSTRAINT sys_enterprise_pkey PRIMARY KEY USING ubtree  (enterprise_id) WITH (storage_type=USTORE);

-- Name: sys_file; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_file (
    file_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    file_name character varying(100),
    bucket_name character varying(200),
    original character varying(1000),
    file_type character varying(200),
    file_size bigint,
    del_flag character(1),
    file_data_id character varying(255),
    file_data_class character varying(255),
    file_md5 character varying(255),
    file_upload_id bigint,
    file_save_path character varying(255),
    file_tag character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_file IS '文件管理表';
COMMENT ON COLUMN sys_file.file_id IS '主键';
COMMENT ON COLUMN sys_file.create_by IS '创建者';
COMMENT ON COLUMN sys_file.create_time IS '创建时间';
COMMENT ON COLUMN sys_file.update_by IS '更新人';
COMMENT ON COLUMN sys_file.update_time IS '修改时间';
COMMENT ON COLUMN sys_file.file_name IS '文件名称';
COMMENT ON COLUMN sys_file.bucket_name IS 'bucket名称';
COMMENT ON COLUMN sys_file.original IS '原文件名';
COMMENT ON COLUMN sys_file.file_type IS '文件类型';
COMMENT ON COLUMN sys_file.file_size IS '文件大小';
COMMENT ON COLUMN sys_file.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_file.file_data_id IS '文件所属数据的领域对象ID';
COMMENT ON COLUMN sys_file.file_data_class IS '文件所属领域的领域对类';
COMMENT ON COLUMN sys_file.file_md5 IS '文件md5';
COMMENT ON COLUMN sys_file.file_upload_id IS '文件上传人id';
COMMENT ON COLUMN sys_file.file_save_path IS '文件存储路径';
COMMENT ON COLUMN sys_file.file_tag IS '文件标记，eg:tmp,attachment';
ALTER TABLE sys_file ADD CONSTRAINT sys_file_pkey PRIMARY KEY USING ubtree  (file_id) WITH (storage_type=USTORE);

-- Name: sys_homepage_notice_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_homepage_notice_config (
    config_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    config_title character varying(768),
    config_content text,
    config_time timestamp without time zone,
    config_status numeric(2,0),
    ignore_users text,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_homepage_notice_config IS '首页提示配置';
COMMENT ON COLUMN sys_homepage_notice_config.config_id IS '配置id-主键';
COMMENT ON COLUMN sys_homepage_notice_config.create_by IS '创建者';
COMMENT ON COLUMN sys_homepage_notice_config.create_time IS '创建时间';
COMMENT ON COLUMN sys_homepage_notice_config.update_by IS '更新人';
COMMENT ON COLUMN sys_homepage_notice_config.update_time IS '修改时间';
COMMENT ON COLUMN sys_homepage_notice_config.config_title IS '标题';
COMMENT ON COLUMN sys_homepage_notice_config.config_content IS '内容';
COMMENT ON COLUMN sys_homepage_notice_config.config_time IS '配置时间';
COMMENT ON COLUMN sys_homepage_notice_config.config_status IS '配置状态   0：未发布，1：发布中';
COMMENT ON COLUMN sys_homepage_notice_config.ignore_users IS '不弹窗的用户ids';
COMMENT ON COLUMN sys_homepage_notice_config.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_homepage_notice_config.project_id IS '项目id';
ALTER TABLE sys_homepage_notice_config ADD CONSTRAINT sys_homepage_notice_config_pkey PRIMARY KEY USING ubtree  (config_id) WITH (storage_type=USTORE);

-- Name: sys_log; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_log (
    id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(100),
    update_by character varying(100),
    log_type character(1),
    title character varying(255),
    service_id character varying(100),
    remote_addr character varying(255),
    user_agent character varying(1000),
    request_uri character varying(255),
    method character varying(10),
    params text,
    "time" bigint,
    del_flag character(1),
    exception text,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN sys_log.create_time IS '参加时间';
COMMENT ON COLUMN sys_log.update_time IS '更新时间';
COMMENT ON COLUMN sys_log.create_by IS '创建人';
COMMENT ON COLUMN sys_log.update_by IS '更新人';
COMMENT ON COLUMN sys_log.log_type IS '日志类型';
COMMENT ON COLUMN sys_log.title IS '日志标题';
COMMENT ON COLUMN sys_log.service_id IS '服务ID';
COMMENT ON COLUMN sys_log.remote_addr IS '操作IP地址';
COMMENT ON COLUMN sys_log.user_agent IS '用户代理';
COMMENT ON COLUMN sys_log.request_uri IS '请求URI';
COMMENT ON COLUMN sys_log.method IS '请求方法';
COMMENT ON COLUMN sys_log.params IS '操作提交的参数';
COMMENT ON COLUMN sys_log."time" IS '执行时间';
COMMENT ON COLUMN sys_log.del_flag IS '删除标记';
COMMENT ON COLUMN sys_log.exception IS '异常信息';
COMMENT ON COLUMN sys_log.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_log.project_id IS '项目id';
ALTER TABLE sys_log ADD CONSTRAINT sys_log_pk PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_menu; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_menu (
    menu_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    enterprise_id bigint NOT NULL,
    parent_id bigint,
    menu_name character varying(100) NOT NULL,
    title character varying(50) DEFAULT ''::character varying NOT NULL,
    icon character varying(300) DEFAULT ''::character varying NOT NULL,
    condition character varying(255) DEFAULT ''::character varying NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    menu_type tinyint DEFAULT 0 NOT NULL,
    weigh smallint DEFAULT 0 NOT NULL,
    is_hide tinyint DEFAULT 0 NOT NULL,
    path character varying(100) DEFAULT ''::character varying NOT NULL,
    permission character varying(255) DEFAULT NULL::character varying,
    component character varying(100) DEFAULT ''::character varying NOT NULL,
    module_type character varying(30) DEFAULT ''::character varying NOT NULL,
    model_id integer DEFAULT 0 NOT NULL,
    redirect character varying(255) DEFAULT ''::character varying NOT NULL,
    is_cached tinyint DEFAULT 0 NOT NULL,
    is_affix tinyint DEFAULT 0 NOT NULL,
    is_iframe tinyint DEFAULT 0 NOT NULL,
    is_link tinyint DEFAULT 0 NOT NULL,
    link_url character varying(500) DEFAULT ''::character varying NOT NULL,
    del_flag character(1) DEFAULT '0'::bpchar,
    menu_sort integer DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_menu IS '菜单节点表';
COMMENT ON COLUMN sys_menu.create_time IS '创建时间';
COMMENT ON COLUMN sys_menu.update_time IS '修改时间';
COMMENT ON COLUMN sys_menu.create_by IS '创建者';
COMMENT ON COLUMN sys_menu.update_by IS '更新人';
COMMENT ON COLUMN sys_menu.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_menu.parent_id IS '父菜单ID';
COMMENT ON COLUMN sys_menu.menu_name IS '菜单名称';
COMMENT ON COLUMN sys_menu.title IS '菜单标题';
COMMENT ON COLUMN sys_menu.icon IS '图标';
COMMENT ON COLUMN sys_menu.condition IS '条件';
COMMENT ON COLUMN sys_menu.remark IS '备注';
COMMENT ON COLUMN sys_menu.menu_type IS '类型 0目录 1菜单 2按钮';
COMMENT ON COLUMN sys_menu.weigh IS '权重';
COMMENT ON COLUMN sys_menu.is_hide IS '显示状态';
COMMENT ON COLUMN sys_menu.path IS '路由地址';
COMMENT ON COLUMN sys_menu.permission IS '菜单权限标识';
COMMENT ON COLUMN sys_menu.component IS '组件路径';
COMMENT ON COLUMN sys_menu.module_type IS '所属模块';
COMMENT ON COLUMN sys_menu.model_id IS '模型ID';
COMMENT ON COLUMN sys_menu.redirect IS '路由重定向地址';
COMMENT ON COLUMN sys_menu.is_cached IS '是否缓存';
COMMENT ON COLUMN sys_menu.is_affix IS '是否固定';
COMMENT ON COLUMN sys_menu.is_iframe IS '是否内嵌iframe';
COMMENT ON COLUMN sys_menu.is_link IS '是否外链 1是 0否';
COMMENT ON COLUMN sys_menu.link_url IS '链接地址';
COMMENT ON COLUMN sys_menu.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_menu.menu_sort IS '菜单排序';
ALTER TABLE sys_menu ADD CONSTRAINT sys_menu_pkey PRIMARY KEY USING ubtree  (menu_id) WITH (storage_type=USTORE);

-- Name: sys_menu_old; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_menu_old (
    menu_id bigint NOT NULL,
    name character varying(32) NOT NULL,
    permission character varying(32) DEFAULT NULL::character varying,
    path character varying(128) DEFAULT NULL::character varying,
    parent_id bigint,
    icon character varying(32) DEFAULT NULL::character varying,
    sort_order integer DEFAULT 0 NOT NULL,
    keep_alive character(1) DEFAULT '0'::bpchar,
    type character(1) DEFAULT NULL::bpchar,
    del_flag character(1) DEFAULT '0'::bpchar,
    create_by character varying(64) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_by character varying(64) DEFAULT NULL::character varying,
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_menu_old IS '菜单表（旧数据）';
COMMENT ON COLUMN sys_menu_old.name IS '菜单名称';
COMMENT ON COLUMN sys_menu_old.permission IS '菜单权限标识';
COMMENT ON COLUMN sys_menu_old.path IS '前端URL';
COMMENT ON COLUMN sys_menu_old.parent_id IS '父菜单ID';
COMMENT ON COLUMN sys_menu_old.icon IS '图标';
COMMENT ON COLUMN sys_menu_old.sort_order IS '排序值';
COMMENT ON COLUMN sys_menu_old.keep_alive IS '0-开启，1- 关闭';
COMMENT ON COLUMN sys_menu_old.type IS '菜单类型 （0菜单 1按钮）';
COMMENT ON COLUMN sys_menu_old.del_flag IS '逻辑删除标记(0--正常 1--删除)';
COMMENT ON COLUMN sys_menu_old.create_by IS '创建人';
COMMENT ON COLUMN sys_menu_old.create_time IS '创建时间';
COMMENT ON COLUMN sys_menu_old.update_by IS '修改人';
COMMENT ON COLUMN sys_menu_old.update_time IS '更新时间1111';
ALTER TABLE sys_menu_old ADD CONSTRAINT sys_menu_old_pkey PRIMARY KEY USING ubtree  (menu_id) WITH (storage_type=USTORE);

-- Name: sys_message; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_message (
    message_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    title character varying(150),
    content character varying(5000),
    sender bigint,
    recipient bigint,
    read_flag character(1),
    message_type character(1),
    message_source character varying(50),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_message IS '系统消息表';
COMMENT ON COLUMN sys_message.message_id IS '消息id';
COMMENT ON COLUMN sys_message.create_by IS '创建人';
COMMENT ON COLUMN sys_message.create_time IS '创建时间';
COMMENT ON COLUMN sys_message.update_by IS '更新人';
COMMENT ON COLUMN sys_message.update_time IS '更新时间';
COMMENT ON COLUMN sys_message.title IS '标题';
COMMENT ON COLUMN sys_message.content IS '内容';
COMMENT ON COLUMN sys_message.sender IS '发送人';
COMMENT ON COLUMN sys_message.recipient IS '接收人';
COMMENT ON COLUMN sys_message.read_flag IS '是否已读（Y：已读 N：未读）';
COMMENT ON COLUMN sys_message.message_type IS '消息类型（0：通知 1：提醒）';
COMMENT ON COLUMN sys_message.message_source IS '消息来源';
COMMENT ON COLUMN sys_message.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_message.project_id IS '项目id';
ALTER TABLE sys_message ADD CONSTRAINT sys_message_pkey PRIMARY KEY USING ubtree  (message_id) WITH (storage_type=USTORE);

-- Name: sys_message_item; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_message_item (
    item_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    update_user_name character varying(64),
    item_name character varying(50),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_message_item IS '消息事项表';
COMMENT ON COLUMN sys_message_item.item_id IS '事项id';
COMMENT ON COLUMN sys_message_item.create_by IS '创建人';
COMMENT ON COLUMN sys_message_item.create_time IS '创建时间';
COMMENT ON COLUMN sys_message_item.update_by IS '更新人';
COMMENT ON COLUMN sys_message_item.update_time IS '更新时间（编辑时间）';
COMMENT ON COLUMN sys_message_item.update_user_name IS '编辑人姓名';
COMMENT ON COLUMN sys_message_item.item_name IS '事项名称';
COMMENT ON COLUMN sys_message_item.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_message_item.project_id IS '项目id';
ALTER TABLE sys_message_item ADD CONSTRAINT sys_message_item_pkey PRIMARY KEY USING ubtree  (item_id) WITH (storage_type=USTORE);

-- Name: sys_message_notice; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_message_notice (
    notice_id bigint NOT NULL,
    item_id bigint,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1),
    notice_name character varying(150),
    notice_way character varying(10),
    open_flag character(1),
    notice_type character(1),
    item character varying(500),
    ttrigger_conditions character varying(500),
    notice_role character varying(500),
    notice_attribute character varying(500),
    notice_member character varying(500),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_message_notice IS '消息通知表';
COMMENT ON COLUMN sys_message_notice.notice_id IS '通知id';
COMMENT ON COLUMN sys_message_notice.item_id IS '事项id';
COMMENT ON COLUMN sys_message_notice.create_by IS '创建人';
COMMENT ON COLUMN sys_message_notice.create_time IS '创建时间';
COMMENT ON COLUMN sys_message_notice.update_by IS '更新人';
COMMENT ON COLUMN sys_message_notice.update_time IS '更新时间';
COMMENT ON COLUMN sys_message_notice.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_message_notice.notice_name IS '通知名称';
COMMENT ON COLUMN sys_message_notice.notice_way IS '通知方式（0：站内信 1：企业微信）';
COMMENT ON COLUMN sys_message_notice.open_flag IS '是否开启（Y：开启 N：关闭）';
COMMENT ON COLUMN sys_message_notice.notice_type IS '通知类型（0：操作通知 1：属性通知）';
COMMENT ON COLUMN sys_message_notice.item IS '事项（操作或属性）';
COMMENT ON COLUMN sys_message_notice.ttrigger_conditions IS '触发条件';
COMMENT ON COLUMN sys_message_notice.notice_role IS '通知对象（角色）';
COMMENT ON COLUMN sys_message_notice.notice_attribute IS '通知对象（属性）';
COMMENT ON COLUMN sys_message_notice.notice_member IS '通知对象（成员）';
COMMENT ON COLUMN sys_message_notice.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_message_notice.project_id IS '项目id';
ALTER TABLE sys_message_notice ADD CONSTRAINT sys_message_notice_pkey PRIMARY KEY USING ubtree  (notice_id) WITH (storage_type=USTORE);

-- Name: sys_message_remind; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_message_remind (
    remind_id bigint NOT NULL,
    item_id bigint,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1),
    date_attribute character varying(50),
    remind_node character varying(150),
    remind_way character varying(10),
    open_flag character(1),
    ttrigger_conditions character varying(500),
    remind_role character varying(500),
    remind_attribute character varying(500),
    remind_member character varying(500),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_message_remind IS '消息提醒表';
COMMENT ON COLUMN sys_message_remind.remind_id IS '提醒id';
COMMENT ON COLUMN sys_message_remind.item_id IS '事项id';
COMMENT ON COLUMN sys_message_remind.create_by IS '创建人';
COMMENT ON COLUMN sys_message_remind.create_time IS '创建时间';
COMMENT ON COLUMN sys_message_remind.update_by IS '更新人';
COMMENT ON COLUMN sys_message_remind.update_time IS '更新时间';
COMMENT ON COLUMN sys_message_remind.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_message_remind.date_attribute IS '时间属性';
COMMENT ON COLUMN sys_message_remind.remind_node IS '提醒节点';
COMMENT ON COLUMN sys_message_remind.remind_way IS '提醒方式（0：站内信 1：企业微信）';
COMMENT ON COLUMN sys_message_remind.open_flag IS '是否开启（Y：开启 N：关闭）';
COMMENT ON COLUMN sys_message_remind.ttrigger_conditions IS '触发条件';
COMMENT ON COLUMN sys_message_remind.remind_role IS '提醒对象（角色）';
COMMENT ON COLUMN sys_message_remind.remind_attribute IS '提醒对象（属性）';
COMMENT ON COLUMN sys_message_remind.remind_member IS '提醒对象（成员）';
COMMENT ON COLUMN sys_message_remind.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_message_remind.project_id IS '项目id';
ALTER TABLE sys_message_remind ADD CONSTRAINT sys_message_remind_pkey PRIMARY KEY USING ubtree  (remind_id) WITH (storage_type=USTORE);

-- Name: sys_module; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_module (
    module_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    module_code character varying(100),
    module_name character varying(255) NOT NULL,
    parent_id bigint NOT NULL,
    system_id bigint NOT NULL,
    del_flag character(1) DEFAULT '0'::bpchar,
    module_sort tinyint DEFAULT 0,
    is_shroud character varying(5) DEFAULT 0,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_module IS '模块表';
COMMENT ON COLUMN sys_module.module_id IS '模块id';
COMMENT ON COLUMN sys_module.create_by IS '创建者';
COMMENT ON COLUMN sys_module.create_time IS '创建时间';
COMMENT ON COLUMN sys_module.update_by IS '更新人';
COMMENT ON COLUMN sys_module.update_time IS '修改时间';
COMMENT ON COLUMN sys_module.module_code IS '模块编码';
COMMENT ON COLUMN sys_module.module_name IS '模块名称';
COMMENT ON COLUMN sys_module.parent_id IS '父模块id';
COMMENT ON COLUMN sys_module.system_id IS '系统id';
COMMENT ON COLUMN sys_module.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_module.is_shroud IS '是否隐藏：0-不隐藏，1-隐藏';
COMMENT ON COLUMN sys_module.enterprise_id IS '企业Id';
COMMENT ON COLUMN sys_module.project_id IS '项目id';
ALTER TABLE sys_module ADD CONSTRAINT sys_module_pkey PRIMARY KEY USING ubtree  (module_id) WITH (storage_type=USTORE);

-- Name: sys_module_0905; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_module_0905 (
    module_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    module_code character varying(100),
    module_name character varying(255) NOT NULL,
    parent_id bigint NOT NULL,
    system_id bigint NOT NULL,
    del_flag character(1) DEFAULT '0'::bpchar,
    module_sort tinyint DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_module_0905 IS '模块表';
COMMENT ON COLUMN sys_module_0905.module_id IS '模块id';
COMMENT ON COLUMN sys_module_0905.create_by IS '创建者';
COMMENT ON COLUMN sys_module_0905.create_time IS '创建时间';
COMMENT ON COLUMN sys_module_0905.update_by IS '更新人';
COMMENT ON COLUMN sys_module_0905.update_time IS '修改时间';
COMMENT ON COLUMN sys_module_0905.module_code IS '模块编码';
COMMENT ON COLUMN sys_module_0905.module_name IS '模块名称';
COMMENT ON COLUMN sys_module_0905.parent_id IS '父模块id';
COMMENT ON COLUMN sys_module_0905.system_id IS '系统id';
COMMENT ON COLUMN sys_module_0905.del_flag IS '0-正常，1-删除';
ALTER TABLE sys_module_0905 ADD CONSTRAINT sys_module_0905_pkey PRIMARY KEY USING ubtree  (module_id) WITH (storage_type=USTORE);

-- Name: sys_module_0908; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_module_0908 (
    module_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    module_code character varying(100),
    module_name character varying(255) NOT NULL,
    parent_id bigint NOT NULL,
    system_id bigint NOT NULL,
    del_flag character(1) DEFAULT '0'::bpchar,
    module_sort tinyint DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_module_0908 IS '模块表';
COMMENT ON COLUMN sys_module_0908.module_id IS '模块id';
COMMENT ON COLUMN sys_module_0908.create_by IS '创建者';
COMMENT ON COLUMN sys_module_0908.create_time IS '创建时间';
COMMENT ON COLUMN sys_module_0908.update_by IS '更新人';
COMMENT ON COLUMN sys_module_0908.update_time IS '修改时间';
COMMENT ON COLUMN sys_module_0908.module_code IS '模块编码';
COMMENT ON COLUMN sys_module_0908.module_name IS '模块名称';
COMMENT ON COLUMN sys_module_0908.parent_id IS '父模块id';
COMMENT ON COLUMN sys_module_0908.system_id IS '系统id';
COMMENT ON COLUMN sys_module_0908.del_flag IS '0-正常，1-删除';
ALTER TABLE sys_module_0908 ADD CONSTRAINT sys_module_0908_pkey PRIMARY KEY USING ubtree  (module_id) WITH (storage_type=USTORE);

-- Name: sys_notice; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_notice (
    notice_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    notice_title character varying(768),
    notice_status numeric(2,0),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    publish_time timestamp without time zone,
    notice_content text,
    status_order numeric(2,0),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_notice IS '系统公告';
COMMENT ON COLUMN sys_notice.notice_id IS '公告id-主键';
COMMENT ON COLUMN sys_notice.create_by IS '创建者';
COMMENT ON COLUMN sys_notice.create_time IS '创建时间';
COMMENT ON COLUMN sys_notice.update_by IS '更新人';
COMMENT ON COLUMN sys_notice.update_time IS '修改时间';
COMMENT ON COLUMN sys_notice.notice_title IS '公告标题';
COMMENT ON COLUMN sys_notice.notice_status IS '公告状态  0：待发布，1：发布中，2：已撤销';
COMMENT ON COLUMN sys_notice.start_time IS '公告生效时间';
COMMENT ON COLUMN sys_notice.end_time IS '公告失效时间';
COMMENT ON COLUMN sys_notice.publish_time IS '公告发布时间';
COMMENT ON COLUMN sys_notice.notice_content IS '公告内容';
COMMENT ON COLUMN sys_notice.status_order IS '状态排序，发布中>待发布>已撤销';
COMMENT ON COLUMN sys_notice.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_notice.project_id IS '项目id';
ALTER TABLE sys_notice ADD CONSTRAINT sys_notice_pkey PRIMARY KEY USING ubtree  (notice_id) WITH (storage_type=USTORE);

-- Name: sys_oauth_client_details; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_oauth_client_details (
    client_id character varying(32) NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    resource_ids character varying(256) DEFAULT NULL::character varying,
    client_secret character varying(256) DEFAULT NULL::character varying,
    scope character varying(256) DEFAULT NULL::character varying,
    authorized_grant_types character varying(256) DEFAULT NULL::character varying,
    web_server_redirect_uri character varying(256) DEFAULT NULL::character varying,
    authorities character varying(256) DEFAULT NULL::character varying,
    access_token_validity integer,
    refresh_token_validity integer,
    additional_information character varying(4096) DEFAULT NULL::character varying,
    autoapprove character varying(256) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_oauth_client_details IS '终端信息表';
COMMENT ON COLUMN sys_oauth_client_details.client_id IS '客户端ID';
COMMENT ON COLUMN sys_oauth_client_details.create_time IS '创建时间';
COMMENT ON COLUMN sys_oauth_client_details.update_time IS '更新时间';
COMMENT ON COLUMN sys_oauth_client_details.create_by IS '更新时间';
COMMENT ON COLUMN sys_oauth_client_details.update_by IS '更新人';
COMMENT ON COLUMN sys_oauth_client_details.resource_ids IS '资源列表';
COMMENT ON COLUMN sys_oauth_client_details.client_secret IS '客户端密钥';
COMMENT ON COLUMN sys_oauth_client_details.scope IS '域';
COMMENT ON COLUMN sys_oauth_client_details.authorized_grant_types IS '认证类型';
COMMENT ON COLUMN sys_oauth_client_details.web_server_redirect_uri IS '重定向地址';
COMMENT ON COLUMN sys_oauth_client_details.authorities IS '角色列表';
COMMENT ON COLUMN sys_oauth_client_details.access_token_validity IS 'token 有效期';
COMMENT ON COLUMN sys_oauth_client_details.refresh_token_validity IS '刷新令牌有效期';
COMMENT ON COLUMN sys_oauth_client_details.additional_information IS '令牌扩展字段JSON';
COMMENT ON COLUMN sys_oauth_client_details.autoapprove IS '是否自动放行';
ALTER TABLE sys_oauth_client_details ADD CONSTRAINT sys_oauth_client_details_pkey PRIMARY KEY USING ubtree  (client_id) WITH (storage_type=USTORE);

-- Name: test_auto_summary_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_auto_summary_statistics_report (
    id bigint NOT NULL,
    stats_date character varying(100) DEFAULT NULL::character varying,
    group_name character varying(100) DEFAULT NULL::character varying,
    case_exec_count integer DEFAULT 0,
    auto_exec_count integer DEFAULT 0,
    auto_exec_success_count integer DEFAULT 0,
    auto_exec_ratio numeric(10,2) DEFAULT 0.0,
    auto_exec_success_ratio numeric(10,2) DEFAULT 0.0,
    cr_case_exec_count integer DEFAULT 0,
    cr_auto_exec_count integer DEFAULT 0,
    cr_auto_exec_success_count integer DEFAULT 0,
    cr_auto_exec_ratio numeric(10,2) DEFAULT 0.0,
    cr_auto_exec_success_ratio numeric(10,2) DEFAULT 0.0,
    back_case_exec_count integer DEFAULT 0,
    back_auto_exec_count integer DEFAULT 0,
    back_auto_exec_success_count integer DEFAULT 0,
    back_auto_exec_ratio numeric(10,2) DEFAULT 0.0,
    back_auto_exec_success_ratio numeric(10,2) DEFAULT 0.0,
    inspection_case_exec_count integer DEFAULT 0,
    inspection_auto_exec_count integer DEFAULT 0,
    inspection_auto_exec_success_count integer DEFAULT 0,
    inspection_auto_exec_ratio numeric(10,2) DEFAULT 0.0,
    inspection_auto_exec_success_ratio numeric(10,2) DEFAULT 0.0,
    library_case_count integer DEFAULT 0,
    library_auto_exec_case_count integer DEFAULT 0,
    library_auto_cr_case_reuse_number integer DEFAULT 0,
    library_auto_exec_ratio numeric(10,2) DEFAULT 0.0,
    library_auto_reuse_ratio numeric(10,2) DEFAULT 0.0,
    create_by character varying(64) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_by character varying(64) DEFAULT NULL::character varying,
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);

-- Name: ai_case_design_data_record; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_case_design_data_record (
    id bigint NOT NULL,
    create_by character varying(50),
    update_by character varying(50),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    stage_type character varying(100),
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    case_id character varying(100),
    case_name character varying(500),
    case_desc character varying(1000),
    step_id character varying(100),
    step_desc character varying(2000),
    chinese_name character varying(500),
    value character varying(2000),
    case_target character varying(100),
    mandatory character varying(100),
    explain character varying(1000),
    tool_purpose character varying(100),
    ref character varying(100),
    adept_if integer,
    requirement_id bigint,
    requirement_name character varying(1500),
    interface_id bigint,
    interface_name character varying(500),
    prompt_name character varying(250),
    stageversion_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE ai_case_design_data_record IS 'AI案例设计历史数据记录表';
COMMENT ON COLUMN ai_case_design_data_record.enterprise_id IS '企业ID';
COMMENT ON COLUMN ai_case_design_data_record.project_id IS '项目组ID';
COMMENT ON COLUMN ai_case_design_data_record.cr_id IS 'CR-ID';
COMMENT ON COLUMN ai_case_design_data_record.stage_type IS 'CR名称';
COMMENT ON COLUMN ai_case_design_data_record.system_id IS '系统id';
COMMENT ON COLUMN ai_case_design_data_record.first_module_id IS '一级模块id';
COMMENT ON COLUMN ai_case_design_data_record.second_module_id IS '二级模块id';
COMMENT ON COLUMN ai_case_design_data_record.case_id IS '案例ID';
COMMENT ON COLUMN ai_case_design_data_record.case_name IS '案例名字';
COMMENT ON COLUMN ai_case_design_data_record.case_desc IS '案例描述';
COMMENT ON COLUMN ai_case_design_data_record.step_id IS '步骤ID';
COMMENT ON COLUMN ai_case_design_data_record.step_desc IS '步骤描述';
COMMENT ON COLUMN ai_case_design_data_record.chinese_name IS '字段中文名';
COMMENT ON COLUMN ai_case_design_data_record.value IS '字段值';
COMMENT ON COLUMN ai_case_design_data_record.case_target IS '是否案例关注字段';
COMMENT ON COLUMN ai_case_design_data_record.mandatory IS '是否必填';
COMMENT ON COLUMN ai_case_design_data_record.explain IS '字段解释';
COMMENT ON COLUMN ai_case_design_data_record.tool_purpose IS '工具标识';
COMMENT ON COLUMN ai_case_design_data_record.ref IS '是否使用外部工具';
COMMENT ON COLUMN ai_case_design_data_record.adept_if IS '采纳类型， 0-未采纳 1-采纳';
ALTER TABLE ai_case_design_data_record ADD CONSTRAINT ai_case_design_data_record_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_post; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_post (
    post_id bigint NOT NULL,
    create_time timestamp without time zone,
    create_by character varying(64) DEFAULT ''::character varying,
    update_time timestamp without time zone,
    update_by character varying(64) DEFAULT ''::character varying,
    post_code character varying(64) NOT NULL,
    post_name character varying(50) NOT NULL,
    post_sort integer NOT NULL,
    del_flag character(1) DEFAULT '0'::bpchar NOT NULL,
    remark character varying(500) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_post IS '岗位信息表';
COMMENT ON COLUMN sys_post.post_id IS '岗位ID';
COMMENT ON COLUMN sys_post.create_time IS '创建时间';
COMMENT ON COLUMN sys_post.create_by IS '创建人';
COMMENT ON COLUMN sys_post.update_time IS '更新时间';
COMMENT ON COLUMN sys_post.update_by IS '更新人';
COMMENT ON COLUMN sys_post.post_code IS '岗位编码';
COMMENT ON COLUMN sys_post.post_name IS '岗位名称';
COMMENT ON COLUMN sys_post.post_sort IS '岗位排序';
COMMENT ON COLUMN sys_post.del_flag IS '是否删除  -1：已删除  0：正常';
COMMENT ON COLUMN sys_post.remark IS '备注信息';

-- Name: sys_process; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_process (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    process_name character varying(255),
    process_code character varying(255),
    process_desc character varying(255),
    del_flag integer DEFAULT 0,
    system_flag character varying DEFAULT '0'::character varying NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_process IS '流程-作用于cr需求';
COMMENT ON COLUMN sys_process.id IS '主键id';
COMMENT ON COLUMN sys_process.create_by IS '创建人';
COMMENT ON COLUMN sys_process.create_time IS '创建时间';
COMMENT ON COLUMN sys_process.update_by IS '更新人';
COMMENT ON COLUMN sys_process.update_time IS '更新时间';
COMMENT ON COLUMN sys_process.enterprise_id IS '企业id ';
COMMENT ON COLUMN sys_process.project_id IS '项目组id ';
COMMENT ON COLUMN sys_process.process_name IS '流程名称';
COMMENT ON COLUMN sys_process.process_code IS '流程编码';
COMMENT ON COLUMN sys_process.process_desc IS '流程描述';
COMMENT ON COLUMN sys_process.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN sys_process.system_flag IS '是否是系统自建 0:不是系统自建 1:是系统自建';
ALTER TABLE sys_process ADD CONSTRAINT sys_process_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_process_stage; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_process_stage (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    process_id bigint,
    stage_name character varying(255),
    stage_type character varying(255),
    stage_desc character varying(255),
    del_flag integer DEFAULT 0,
    test_environment character varying(255),
    cr_id bigint,
    exec_id bigint,
    environment_require character varying(255),
    circuit_start_time timestamp without time zone,
    circuit_end_time timestamp without time zone,
    stage_status integer DEFAULT 0,
    cut_reason character varying(255),
    cutout_status boolean
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_process_stage IS '流程下的阶段';
COMMENT ON COLUMN sys_process_stage.id IS '主键id';
COMMENT ON COLUMN sys_process_stage.create_by IS '创建人';
COMMENT ON COLUMN sys_process_stage.create_time IS '创建时间';
COMMENT ON COLUMN sys_process_stage.update_by IS '更新人';
COMMENT ON COLUMN sys_process_stage.update_time IS '更新时间';
COMMENT ON COLUMN sys_process_stage.enterprise_id IS '企业id ';
COMMENT ON COLUMN sys_process_stage.project_id IS '项目组id ';
COMMENT ON COLUMN sys_process_stage.process_id IS '流程id';
COMMENT ON COLUMN sys_process_stage.stage_name IS '阶段名称';
COMMENT ON COLUMN sys_process_stage.stage_type IS '阶段编码-取数据字典';
COMMENT ON COLUMN sys_process_stage.stage_desc IS '阶段描述';
COMMENT ON COLUMN sys_process_stage.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN sys_process_stage.test_environment IS '测试环境';
COMMENT ON COLUMN sys_process_stage.cr_id IS 'CRID';
COMMENT ON COLUMN sys_process_stage.exec_id IS '实施经理-人员ID';
COMMENT ON COLUMN sys_process_stage.environment_require IS '环境要求';
COMMENT ON COLUMN sys_process_stage.circuit_start_time IS '线路图开始时间';
COMMENT ON COLUMN sys_process_stage.circuit_end_time IS '线路图结束时间';
COMMENT ON COLUMN sys_process_stage.stage_status IS '阶段状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN sys_process_stage.cut_reason IS '裁剪原因';
COMMENT ON COLUMN sys_process_stage.cutout_status IS 'true支持，false不支持';
ALTER TABLE sys_process_stage ADD CONSTRAINT sys_process_stage_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_process_stage_activity; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_process_stage_activity (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    stage_id bigint,
    activity_name character varying(255),
    activity_type integer,
    activity_desc character varying(255),
    cutout_status boolean,
    activity_status integer DEFAULT 0,
    del_flag integer DEFAULT 0,
    circuit_start_time timestamp without time zone,
    circuit_end_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_process_stage_activity IS '流程下的每个阶段下的活动';
COMMENT ON COLUMN sys_process_stage_activity.id IS '主键id';
COMMENT ON COLUMN sys_process_stage_activity.create_by IS '创建人';
COMMENT ON COLUMN sys_process_stage_activity.create_time IS '创建时间';
COMMENT ON COLUMN sys_process_stage_activity.update_by IS '更新人';
COMMENT ON COLUMN sys_process_stage_activity.update_time IS '更新时间';
COMMENT ON COLUMN sys_process_stage_activity.enterprise_id IS '企业id ';
COMMENT ON COLUMN sys_process_stage_activity.project_id IS '项目组id ';
COMMENT ON COLUMN sys_process_stage_activity.cr_id IS 'cr_id';
COMMENT ON COLUMN sys_process_stage_activity.stage_id IS '阶段id';
COMMENT ON COLUMN sys_process_stage_activity.activity_name IS '活动名称';
COMMENT ON COLUMN sys_process_stage_activity.activity_type IS '活动编码-取数据字典';
COMMENT ON COLUMN sys_process_stage_activity.activity_desc IS '活动描述';
COMMENT ON COLUMN sys_process_stage_activity.cutout_status IS 'true支持，false不支持';
COMMENT ON COLUMN sys_process_stage_activity.activity_status IS '活动状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN sys_process_stage_activity.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN sys_process_stage_activity.circuit_start_time IS '线路图开始时间';
COMMENT ON COLUMN sys_process_stage_activity.circuit_end_time IS '线路图结束时间';
ALTER TABLE sys_process_stage_activity ADD CONSTRAINT sys_process_stage_activity_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_project; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_project (
    project_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    parent_project_id bigint,
    enterprise_id bigint NOT NULL,
    project_code character varying(64) DEFAULT NULL::character varying,
    project_name character varying(128) DEFAULT NULL::character varying,
    project_level integer DEFAULT 0,
    project_logo text,
    project_desc character varying(512) DEFAULT NULL::character varying,
    default_role_id bigint,
    del_flag character(1) DEFAULT '0'::bpchar,
    project_manager bigint NOT NULL,
    project_status integer NOT NULL,
    manager_role_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_project IS '项目组基本信息';
COMMENT ON COLUMN sys_project.project_id IS '主键id';
COMMENT ON COLUMN sys_project.create_time IS '创建时间';
COMMENT ON COLUMN sys_project.update_time IS '修改时间';
COMMENT ON COLUMN sys_project.create_by IS '创建者';
COMMENT ON COLUMN sys_project.update_by IS '更新人';
COMMENT ON COLUMN sys_project.parent_project_id IS '父项目id';
COMMENT ON COLUMN sys_project.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_project.project_code IS '项目组编号';
COMMENT ON COLUMN sys_project.project_name IS '项目组名称';
COMMENT ON COLUMN sys_project.project_level IS '公开范围 0：项目组成员可见；1企业全员可见；';
COMMENT ON COLUMN sys_project.project_logo IS '项目组logo';
COMMENT ON COLUMN sys_project.project_desc IS '项目组描述';
COMMENT ON COLUMN sys_project.default_role_id IS '默认角色id';
COMMENT ON COLUMN sys_project.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_project.project_manager IS '空间管理员';
COMMENT ON COLUMN sys_project.project_status IS '空间状态 0: 停用 1: 启动';
COMMENT ON COLUMN sys_project.manager_role_id IS '空间管理员角色';
ALTER TABLE sys_project ADD CONSTRAINT sys_project_pkey PRIMARY KEY USING ubtree  (project_id) WITH (storage_type=USTORE);

-- Name: sys_prompt_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_prompt_relation (
    id bigint NOT NULL,
    create_by character varying(50),
    update_by character varying(50),
    create_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    enterprise_id bigint,
    project_id bigint,
    requirement_prompt_id bigint,
    case_prompt_id bigint,
    del_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN sys_prompt_relation.requirement_prompt_id IS '需求点提示词ID';
COMMENT ON COLUMN sys_prompt_relation.case_prompt_id IS '案例提示词ID';
COMMENT ON COLUMN sys_prompt_relation.del_flag IS '删除类型： 0-正常，1-删除';
ALTER TABLE sys_prompt_relation ADD CONSTRAINT sys_prompt_relation_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_public_param; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_public_param (
    public_id bigint NOT NULL,
    create_by character varying(64) DEFAULT ' '::character varying,
    update_by character varying(64) DEFAULT ' '::character varying,
    create_time timestamp without time zone DEFAULT pg_systimestamp(),
    update_time timestamp without time zone DEFAULT pg_systimestamp(),
    public_name character varying(128) DEFAULT NULL::character varying,
    public_key character varying(128) DEFAULT NULL::character varying,
    public_value character varying(128) DEFAULT NULL::character varying,
    status character(1) DEFAULT '0'::bpchar,
    validate_code character varying(64) DEFAULT NULL::character varying,
    public_type character(1) DEFAULT '0'::bpchar,
    system_flag character(1) DEFAULT '0'::bpchar
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_public_param IS '公共参数配置表';
COMMENT ON COLUMN sys_public_param.create_by IS '创建人';
COMMENT ON COLUMN sys_public_param.update_by IS '更新人';
COMMENT ON COLUMN sys_public_param.create_time IS '创建时间';
COMMENT ON COLUMN sys_public_param.update_time IS '更新时间';
ALTER TABLE sys_public_param ADD CONSTRAINT sys_public_param_pkey PRIMARY KEY USING ubtree  (public_id) WITH (storage_type=USTORE);

-- Name: sys_prompt; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_prompt (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(255),
    create_time timestamp without time zone,
    update_by character varying(255),
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT 0,
    prompt_name character varying(255),
    prompt_type character varying(255),
    prompt_sort integer,
    link_knowledge_flag character(1) DEFAULT 0,
    effect_flag character(1) DEFAULT 0,
    prompt_desc text,
    priority integer,
    knowledge_connect_type integer,
    generate_data_instruct text,
    generate_case_data text
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_prompt IS 'AI测试配置提示词表';
COMMENT ON COLUMN sys_prompt.id IS '主键';
COMMENT ON COLUMN sys_prompt.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_prompt.project_id IS '项目组id';
COMMENT ON COLUMN sys_prompt.create_by IS '创建人';
COMMENT ON COLUMN sys_prompt.create_time IS '创建时间';
COMMENT ON COLUMN sys_prompt.update_by IS '更新人';
COMMENT ON COLUMN sys_prompt.update_time IS '更新时间';
COMMENT ON COLUMN sys_prompt.del_flag IS '删除状态 0:正常 1:删除 2:停用';
COMMENT ON COLUMN sys_prompt.prompt_name IS '提示词名称';
COMMENT ON COLUMN sys_prompt.prompt_type IS '提示词类型，requirement：测试需求点，case：测试案例，caseData：测试案例数据';
COMMENT ON COLUMN sys_prompt.prompt_sort IS '排序';
COMMENT ON COLUMN sys_prompt.link_knowledge_flag IS '是否连接知识库，0：否  1：是';
COMMENT ON COLUMN sys_prompt.effect_flag IS '是否生效 0：不生效 1：生效';
COMMENT ON COLUMN sys_prompt.prompt_desc IS '提示词描述';
COMMENT ON COLUMN sys_prompt.priority IS '重要性：1-高，2-中，3-低';
COMMENT ON COLUMN sys_prompt.knowledge_connect_type IS '是否连接知识库：1-是，2-否';
COMMENT ON COLUMN sys_prompt.generate_data_instruct IS '生成数据指令';
COMMENT ON COLUMN sys_prompt.generate_case_data IS '生成测试案例数据';
ALTER TABLE sys_prompt ADD CONSTRAINT sys_prompt_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_role_menu_relation_in_project; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_role_menu_relation_in_project (
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_role_menu_relation_in_project IS '空间内角色菜单关系表';
COMMENT ON COLUMN sys_role_menu_relation_in_project.role_id IS '角色id';
COMMENT ON COLUMN sys_role_menu_relation_in_project.menu_id IS '菜单id';
ALTER TABLE sys_role_menu_relation_in_project ADD CONSTRAINT sys_role_menu_relation_in_project_pkey PRIMARY KEY USING ubtree  (role_id, menu_id) WITH (storage_type=USTORE);

-- Name: sys_stage_key_project; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_stage_key_project (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    stageversion_id bigint,
    vp_stageversion_id bigint,
    stageversion_name character varying(255),
    project_name character varying(255),
    project_sort integer,
    cr_id bigint,
    vp_cr_id bigint,
    cr_name character varying(255),
    cr_code character varying(255),
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_stage_key_project IS '阶段版本重点项目';
COMMENT ON COLUMN sys_stage_key_project.id IS '主键';
COMMENT ON COLUMN sys_stage_key_project.enterprise_id IS '企业ID';
COMMENT ON COLUMN sys_stage_key_project.project_id IS '项目ID';
COMMENT ON COLUMN sys_stage_key_project.stageversion_id IS '阶段版本Id';
COMMENT ON COLUMN sys_stage_key_project.vp_stageversion_id IS 'vp阶段版本Id';
COMMENT ON COLUMN sys_stage_key_project.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN sys_stage_key_project.project_name IS '项目名称';
COMMENT ON COLUMN sys_stage_key_project.project_sort IS '项目排序';
COMMENT ON COLUMN sys_stage_key_project.cr_id IS 'CR Id';
COMMENT ON COLUMN sys_stage_key_project.vp_cr_id IS 'vp cr id';
COMMENT ON COLUMN sys_stage_key_project.cr_name IS 'CR名称';
COMMENT ON COLUMN sys_stage_key_project.cr_code IS 'CR编号';
COMMENT ON COLUMN sys_stage_key_project.create_by IS '创建人';
COMMENT ON COLUMN sys_stage_key_project.create_time IS '创建时间';
COMMENT ON COLUMN sys_stage_key_project.update_by IS '更新人';
COMMENT ON COLUMN sys_stage_key_project.update_time IS '更新时间 ';
COMMENT ON COLUMN sys_stage_key_project.del_flag IS '删除状态 0:正常 1:删除';

-- Name: sys_stageversion; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_stageversion (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    stageversion_name character varying(255),
    description character varying(500),
    deply_month integer,
    del_flag character(1),
    source_from integer,
    deply_year integer,
    deploy_time timestamp without time zone,
    baseline_code character varying(32),
    baseline_scope character varying(255),
    chief character varying(32),
    remark character varying(255),
    audit_status character(1),
    crvali_date timestamp without time zone,
    setuppro_date timestamp without time zone,
    business_date timestamp without time zone,
    deploy_date timestamp without time zone,
    sit_date timestamp without time zone,
    uat1_date timestamp without time zone,
    uat2_date timestamp without time zone,
    show_date timestamp without time zone,
    comp_date timestamp without time zone,
    townb_date timestamp without time zone,
    test_deploy_start_date timestamp without time zone,
    test_deploy_end_date timestamp without time zone,
    vp_stageversion_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_stageversion IS '阶段版本';
COMMENT ON COLUMN sys_stageversion.id IS '主键id ';
COMMENT ON COLUMN sys_stageversion.create_by IS '创建人';
COMMENT ON COLUMN sys_stageversion.create_time IS '创建时间';
COMMENT ON COLUMN sys_stageversion.update_by IS '更新人';
COMMENT ON COLUMN sys_stageversion.update_time IS '更新时间 ';
COMMENT ON COLUMN sys_stageversion.enterprise_id IS '企业ID';
COMMENT ON COLUMN sys_stageversion.project_id IS '项目ID';
COMMENT ON COLUMN sys_stageversion.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN sys_stageversion.description IS '描述';
COMMENT ON COLUMN sys_stageversion.deply_month IS '阶段版本月份';
COMMENT ON COLUMN sys_stageversion.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN sys_stageversion.source_from IS '数据来源0:在系统创建 1:VP同步';
COMMENT ON COLUMN sys_stageversion.deply_year IS '上线年度';
COMMENT ON COLUMN sys_stageversion.deploy_time IS '上线时间';
COMMENT ON COLUMN sys_stageversion.baseline_code IS '发版基线号';
COMMENT ON COLUMN sys_stageversion.baseline_scope IS '发版范围';
COMMENT ON COLUMN sys_stageversion.chief IS '负责人';
COMMENT ON COLUMN sys_stageversion.remark IS '备注';
COMMENT ON COLUMN sys_stageversion.audit_status IS '审核状态0未审核,1已审核,2审核中,3审核不通过';
COMMENT ON COLUMN sys_stageversion.crvali_date IS '需求审定';
COMMENT ON COLUMN sys_stageversion.setuppro_date IS '要求立项完成时间';
COMMENT ON COLUMN sys_stageversion.business_date IS '要求商务完成时间';
COMMENT ON COLUMN sys_stageversion.deploy_date IS '开发';
COMMENT ON COLUMN sys_stageversion.sit_date IS '要求SIT完成时间';
COMMENT ON COLUMN sys_stageversion.uat1_date IS 'UAT第一轮开始';
COMMENT ON COLUMN sys_stageversion.uat2_date IS 'UAT第二轮开始';
COMMENT ON COLUMN sys_stageversion.show_date IS '演练时间开始';
COMMENT ON COLUMN sys_stageversion.comp_date IS '投产时间';
COMMENT ON COLUMN sys_stageversion.townb_date IS '村镇银行';
COMMENT ON COLUMN sys_stageversion.test_deploy_start_date IS '测试部署时间_开始';
COMMENT ON COLUMN sys_stageversion.test_deploy_end_date IS '测试部署时间_结束';
COMMENT ON COLUMN sys_stageversion.vp_stageversion_id IS 'vp的阶段版本Id';
ALTER TABLE sys_stageversion ADD CONSTRAINT sys_stageversion_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_stageversion_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_stageversion_config (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    stageversion_id bigint NOT NULL,
    vp_stageversion_id bigint,
    stageversion_name character varying(255),
    sort integer NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    del_flag character(1) DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_stageversion_config IS '阶段版本配置';
COMMENT ON COLUMN sys_stageversion_config.id IS '主键';
COMMENT ON COLUMN sys_stageversion_config.enterprise_id IS '企业ID';
COMMENT ON COLUMN sys_stageversion_config.project_id IS '项目ID';
COMMENT ON COLUMN sys_stageversion_config.stageversion_id IS '阶段版本主键';
COMMENT ON COLUMN sys_stageversion_config.vp_stageversion_id IS 'vp的阶段版本Id';
COMMENT ON COLUMN sys_stageversion_config.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN sys_stageversion_config.sort IS '排序序号';
COMMENT ON COLUMN sys_stageversion_config.create_by IS '创建人';
COMMENT ON COLUMN sys_stageversion_config.create_time IS '创建时间';
COMMENT ON COLUMN sys_stageversion_config.update_by IS '更新人';
COMMENT ON COLUMN sys_stageversion_config.update_time IS '更新时间 ';
COMMENT ON COLUMN sys_stageversion_config.del_flag IS '删除状态 0:正常 1:删除';

-- Name: sys_track_action; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_track_action (
    id bigint NOT NULL,
    create_by character varying(256),
    create_time timestamp without time zone,
    update_by character varying(256),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    topic_id character varying(255),
    topic_type character varying(32),
    opt_content_json text,
    opt_user_nick_name character varying(64),
    opt_user_id bigint,
    del_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_track_action IS '跟踪活动表';
COMMENT ON COLUMN sys_track_action.id IS '主键id';
COMMENT ON COLUMN sys_track_action.create_by IS '创建人';
COMMENT ON COLUMN sys_track_action.create_time IS '创建时间';
COMMENT ON COLUMN sys_track_action.update_by IS '更新人';
COMMENT ON COLUMN sys_track_action.update_time IS '更新时间';
COMMENT ON COLUMN sys_track_action.enterprise_id IS '企业Id';
COMMENT ON COLUMN sys_track_action.project_id IS '项目组id';
COMMENT ON COLUMN sys_track_action.topic_id IS '关联主题id';
COMMENT ON COLUMN sys_track_action.topic_type IS '关联主题类型 主题类型，对应字典编码。包括：需求、测分、用例、脚本';
COMMENT ON COLUMN sys_track_action.opt_content_json IS '活动内容 json.';
COMMENT ON COLUMN sys_track_action.opt_user_nick_name IS '操作人昵称';
COMMENT ON COLUMN sys_track_action.opt_user_id IS '操作人Id';
COMMENT ON COLUMN sys_track_action.del_flag IS '删除标记 0正常,1删除';
ALTER TABLE sys_track_action ADD CONSTRAINT sys_track_action_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_track_remark; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_track_remark (
    id bigint NOT NULL,
    create_by character varying(256),
    create_time timestamp without time zone,
    update_by character varying(256),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    parent_id bigint,
    topic_id character varying(100),
    topic_type character varying(32),
    comment_content_json text,
    opt_user_nick_name character varying(64),
    opt_user_id bigint,
    del_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_track_remark IS '跟踪评论回复表';
COMMENT ON COLUMN sys_track_remark.id IS '主键id';
COMMENT ON COLUMN sys_track_remark.create_by IS '创建人';
COMMENT ON COLUMN sys_track_remark.create_time IS '创建时间';
COMMENT ON COLUMN sys_track_remark.update_by IS '更新人';
COMMENT ON COLUMN sys_track_remark.update_time IS '更新时间';
COMMENT ON COLUMN sys_track_remark.enterprise_id IS '企业Id';
COMMENT ON COLUMN sys_track_remark.project_id IS '项目组id';
COMMENT ON COLUMN sys_track_remark.parent_id IS '父评论id 设计上支持盖楼，但不实现';
COMMENT ON COLUMN sys_track_remark.topic_id IS '关联主题id';
COMMENT ON COLUMN sys_track_remark.topic_type IS '关联主题类型 主题类型，对应字典编码。包括：需求、测分、用例、脚本';
COMMENT ON COLUMN sys_track_remark.comment_content_json IS '评论内容json 富文本对象。涉及附件';
COMMENT ON COLUMN sys_track_remark.opt_user_nick_name IS '评论人昵称';
COMMENT ON COLUMN sys_track_remark.opt_user_id IS '操作人Id';
COMMENT ON COLUMN sys_track_remark.del_flag IS '删除标记 0正常,1删除';
ALTER TABLE sys_track_remark ADD CONSTRAINT sys_track_remark_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: sys_user; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user (
    user_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    username character varying(64) NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) DEFAULT NULL::character varying,
    real_name character varying(64) NOT NULL,
    nike_name character varying(64) NOT NULL,
    phone character varying(20) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    avatar character varying(255) DEFAULT NULL::character varying,
    gender integer,
    lock_flag character(1) DEFAULT '0'::bpchar,
    expire_time timestamp without time zone,
    user_type character(1) DEFAULT '0'::bpchar,
    user_source integer DEFAULT 0,
    del_flag character(1) DEFAULT '0'::bpchar,
    leader_id bigint,
    password_flag integer DEFAULT 0,
    obsoleted_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user IS '用户表';
COMMENT ON COLUMN sys_user.create_time IS '创建时间';
COMMENT ON COLUMN sys_user.update_time IS '修改时间';
COMMENT ON COLUMN sys_user.create_by IS '创建者';
COMMENT ON COLUMN sys_user.update_by IS '更新人';
COMMENT ON COLUMN sys_user.username IS '用户名';
COMMENT ON COLUMN sys_user.password IS '密码';
COMMENT ON COLUMN sys_user.salt IS '随机盐';
COMMENT ON COLUMN sys_user.real_name IS '真实名称';
COMMENT ON COLUMN sys_user.nike_name IS '昵称';
COMMENT ON COLUMN sys_user.phone IS '电话号码';
COMMENT ON COLUMN sys_user.description IS '用户简介';
COMMENT ON COLUMN sys_user.avatar IS '头像';
COMMENT ON COLUMN sys_user.gender IS '性别 0:男 1:女';
COMMENT ON COLUMN sys_user.lock_flag IS '用户状态：0-正常，9-锁定';
COMMENT ON COLUMN sys_user.expire_time IS '到期时间';
COMMENT ON COLUMN sys_user.user_type IS '用户类型：0-普通用户，1-集体用户';
COMMENT ON COLUMN sys_user.user_source IS '用户来源0:在系统创建 1:其他导入';
COMMENT ON COLUMN sys_user.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_user.leader_id IS '领导id';
COMMENT ON COLUMN sys_user.password_flag IS '修改密码标识 0: 首次登录未修改密码	非0: 已修改密码';
COMMENT ON COLUMN sys_user.obsoleted_flag IS '离职标识：0-正常，1-离职';
CREATE INDEX user_idx1_username ON sys_user USING ubtree (username) WITH (storage_type=USTORE) TABLESPACE pg_default;
ALTER TABLE sys_user ADD CONSTRAINT sys_user_pkey PRIMARY KEY USING ubtree  (user_id) WITH (storage_type=USTORE);

-- Name: sys_user_enterprise_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_enterprise_relation (
    enterprise_id bigint NOT NULL,
    dept_id bigint NOT NULL,
    user_id bigint NOT NULL,
    work_org_code character varying(100),
    org_code character varying(100),
    user_classify character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user_enterprise_relation IS '用户和企业关联表';
COMMENT ON COLUMN sys_user_enterprise_relation.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_user_enterprise_relation.dept_id IS '部门id';
COMMENT ON COLUMN sys_user_enterprise_relation.user_id IS '人员id';
COMMENT ON COLUMN sys_user_enterprise_relation.work_org_code IS '工作所处部门';
COMMENT ON COLUMN sys_user_enterprise_relation.org_code IS '部门编码';
COMMENT ON COLUMN sys_user_enterprise_relation.user_classify IS '用户类型 0-行员，1-龙盈，2-外包';
CREATE INDEX sys_user_enterprise_relation_user_id_idx ON sys_user_enterprise_relation USING ubtree (user_id) WITH (storage_type=USTORE) TABLESPACE pg_default;
ALTER TABLE sys_user_enterprise_relation ADD CONSTRAINT sys_user_enterprise_relation_pkey PRIMARY KEY USING ubtree  (enterprise_id, dept_id, user_id) WITH (storage_type=USTORE);

-- Name: sys_user_group; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_group (
    user_group_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    enterprise_id bigint NOT NULL,
    user_group_name character varying(128) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    del_flag character(1) DEFAULT '0'::bpchar,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user_group IS '项目组基本信息';
COMMENT ON COLUMN sys_user_group.user_group_id IS '主键id';
COMMENT ON COLUMN sys_user_group.create_time IS '创建时间';
COMMENT ON COLUMN sys_user_group.update_time IS '修改时间';
COMMENT ON COLUMN sys_user_group.create_by IS '创建者';
COMMENT ON COLUMN sys_user_group.update_by IS '更新人';
COMMENT ON COLUMN sys_user_group.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_user_group.user_group_name IS '用户组名称';
COMMENT ON COLUMN sys_user_group.description IS '用户组描述';
COMMENT ON COLUMN sys_user_group.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_user_group.project_id IS '项目id';
ALTER TABLE sys_user_group ADD CONSTRAINT sys_user_group_pkey PRIMARY KEY USING ubtree  (user_group_id) WITH (storage_type=USTORE);

-- Name: sys_user_group_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_group_relation (
    user_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user_group_relation IS '用户和用户组关联关系';
COMMENT ON COLUMN sys_user_group_relation.user_id IS '用户id';
COMMENT ON COLUMN sys_user_group_relation.user_group_id IS '用户组id';
COMMENT ON COLUMN sys_user_group_relation.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_user_group_relation.project_id IS '项目id';
ALTER TABLE sys_user_group_relation ADD CONSTRAINT sys_user_group_relation_pkey PRIMARY KEY USING ubtree  (user_id, user_group_id) WITH (storage_type=USTORE);

-- Name: sys_user_post; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_post (
    user_id bigint NOT NULL,
    post_id bigint NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user_post IS '用户与岗位关联表';
COMMENT ON COLUMN sys_user_post.user_id IS '用户ID';
COMMENT ON COLUMN sys_user_post.post_id IS '岗位ID';
ALTER TABLE sys_user_post ADD CONSTRAINT sys_user_post_pkey PRIMARY KEY USING ubtree  (user_id, post_id) WITH (storage_type=USTORE);

-- Name: sys_user_project_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_project_relation (
    user_id bigint NOT NULL,
    enterprise_id bigint NOT NULL,
    project_id bigint NOT NULL,
    default_project integer DEFAULT 0 NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user_project_relation IS '用户和项目关联表';
COMMENT ON COLUMN sys_user_project_relation.user_id IS '用户id';
COMMENT ON COLUMN sys_user_project_relation.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_user_project_relation.project_id IS '项目id';
COMMENT ON COLUMN sys_user_project_relation.default_project IS '默认空间 0: 不是默认 1: 是默认"';
ALTER TABLE sys_user_project_relation ADD CONSTRAINT sys_user_project_relation_pkey PRIMARY KEY USING ubtree  (user_id, enterprise_id, project_id) WITH (storage_type=USTORE);

-- Name: sys_system_under_test; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_system_under_test (
    system_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    system_code character varying(100),
    system_name character varying(255),
    system_url character varying(255),
    system_manager_id bigint,
    enterprise_id bigint NOT NULL,
    important_level character(1) DEFAULT '2'::bpchar,
    source character(1) DEFAULT '1'::bpchar,
    del_flag character(1) DEFAULT '0'::bpchar,
    project_id bigint,
    test_manager_id bigint,
    risk_expert_id bigint,
    system_dev_dept_name character varying(500)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_system_under_test IS '被测系统信息';
COMMENT ON COLUMN sys_system_under_test.system_id IS '系统id';
COMMENT ON COLUMN sys_system_under_test.create_by IS '创建者';
COMMENT ON COLUMN sys_system_under_test.create_time IS '创建时间';
COMMENT ON COLUMN sys_system_under_test.update_by IS '更新人';
COMMENT ON COLUMN sys_system_under_test.update_time IS '修改时间';
COMMENT ON COLUMN sys_system_under_test.system_code IS '系统编码';
COMMENT ON COLUMN sys_system_under_test.system_name IS '系统名称';
COMMENT ON COLUMN sys_system_under_test.system_url IS '系统链接';
COMMENT ON COLUMN sys_system_under_test.system_manager_id IS '系统负责人id';
COMMENT ON COLUMN sys_system_under_test.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_system_under_test.important_level IS '0-重要，1-准重要，2-普通';
COMMENT ON COLUMN sys_system_under_test.source IS '0-不是来源vp，1-是来源vp';
COMMENT ON COLUMN sys_system_under_test.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_system_under_test.project_id IS '项目id';
COMMENT ON COLUMN sys_system_under_test.test_manager_id IS '测试负责人id';
COMMENT ON COLUMN sys_system_under_test.risk_expert_id IS '风险专家id';
COMMENT ON COLUMN sys_system_under_test.system_dev_dept_name IS '系统开发处室';
ALTER TABLE sys_system_under_test ADD CONSTRAINT sys_system_under_test_pkey PRIMARY KEY USING ubtree  (system_id) WITH (storage_type=USTORE);

-- Name: sys_user_role_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_role_relation (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    enterprise_id bigint NOT NULL,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN sys_user_role_relation.user_id IS '用户id';
COMMENT ON COLUMN sys_user_role_relation.role_id IS '角色id';
COMMENT ON COLUMN sys_user_role_relation.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_user_role_relation.project_id IS '项目id';
ALTER TABLE sys_user_role_relation ADD CONSTRAINT sys_user_role_pkey PRIMARY KEY USING ubtree  (user_id, role_id, enterprise_id) WITH (storage_type=USTORE);

-- Name: sys_user_role_relation_copy; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_role_relation_copy (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    enterprise_id bigint NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
ALTER TABLE sys_user_role_relation_copy ADD CONSTRAINT sys_user_role_copy_pkey PRIMARY KEY USING ubtree  (user_id, role_id, enterprise_id) WITH (storage_type=USTORE);

-- Name: sys_user_sut_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_user_sut_relation (
    user_id bigint NOT NULL,
    system_id bigint NOT NULL,
    enterprise_id bigint NOT NULL,
    person_in_charge tinyint DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_user_sut_relation IS '用户和被测系统关系';
COMMENT ON COLUMN sys_user_sut_relation.user_id IS '用户id';
COMMENT ON COLUMN sys_user_sut_relation.system_id IS '被测系统id';
COMMENT ON COLUMN sys_user_sut_relation.enterprise_id IS '所属企业id';
ALTER TABLE sys_user_sut_relation ADD CONSTRAINT sys_user_sut_relation_pkey PRIMARY KEY USING ubtree  (user_id, system_id, enterprise_id) WITH (storage_type=USTORE);

-- Name: sys_version_merged_issue; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_version_merged_issue (
    issue_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    bill_no character varying(50),
    title character varying(500),
    change_basis text,
    system_name text,
    plan_start_time timestamp without time zone,
    plan_end_time timestamp without time zone,
    process_state character varying(20),
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_version_merged_issue IS '版本归并问题单';
COMMENT ON COLUMN sys_version_merged_issue.issue_id IS '主键';
COMMENT ON COLUMN sys_version_merged_issue.create_by IS '创建者';
COMMENT ON COLUMN sys_version_merged_issue.create_time IS '创建时间';
COMMENT ON COLUMN sys_version_merged_issue.update_by IS '更新人';
COMMENT ON COLUMN sys_version_merged_issue.update_time IS '修改时间';
COMMENT ON COLUMN sys_version_merged_issue.bill_no IS '版本变更申请单单号';
COMMENT ON COLUMN sys_version_merged_issue.title IS '主题摘要';
COMMENT ON COLUMN sys_version_merged_issue.change_basis IS '变更依据';
COMMENT ON COLUMN sys_version_merged_issue.system_name IS '系统名称';
COMMENT ON COLUMN sys_version_merged_issue.plan_start_time IS '计划开始时间';
COMMENT ON COLUMN sys_version_merged_issue.plan_end_time IS '计划结束时间';
COMMENT ON COLUMN sys_version_merged_issue.process_state IS '流程状态（比如运行中或已完成或已撤销等）';
COMMENT ON COLUMN sys_version_merged_issue.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_version_merged_issue.project_id IS '项目id';
ALTER TABLE sys_version_merged_issue ADD CONSTRAINT sys_version_merged_issue_pkey PRIMARY KEY USING ubtree  (issue_id) WITH (storage_type=USTORE);

-- Name: sys_workload_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_workload_config (
    workload_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    year bigint,
    date_config date,
    workload_status integer,
    del_flag character(1),
    sit_workload integer,
    uat_workload integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_workload_config IS '工作量配置表';
COMMENT ON COLUMN sys_workload_config.workload_id IS '主键id';
COMMENT ON COLUMN sys_workload_config.create_by IS '创建人';
COMMENT ON COLUMN sys_workload_config.create_time IS '创建时间';
COMMENT ON COLUMN sys_workload_config.update_by IS '更新人';
COMMENT ON COLUMN sys_workload_config.update_time IS '更新时间';
COMMENT ON COLUMN sys_workload_config.enterprise_id IS '企业id ';
COMMENT ON COLUMN sys_workload_config.project_id IS '项目组id ';
COMMENT ON COLUMN sys_workload_config.year IS '所属年份';
COMMENT ON COLUMN sys_workload_config.date_config IS '日期配置';
COMMENT ON COLUMN sys_workload_config.workload_status IS '状态：0未提交，1已提交';
COMMENT ON COLUMN sys_workload_config.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_workload_config.sit_workload IS 'SIT工作量';
COMMENT ON COLUMN sys_workload_config.uat_workload IS 'UAT工作量';
ALTER TABLE sys_workload_config ADD CONSTRAINT sys_workload_config_pkey PRIMARY KEY USING ubtree  (workload_id) WITH (storage_type=USTORE);

-- Name: system_metrics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE system_metrics_report (
    id bigint NOT NULL,
    system_id bigint,
    system_name character varying(150),
    system_manager_id bigint,
    system_manager_dept_id bigint,
    system_manager_dept_name character varying(150),
    create_time date,
    sit_case_lib_asset_reuse_rate real,
    uat_case_lib_asset_reuse_rate real,
    case_lib_fresh_case_rate real,
    issue_density_rate real,
    product_risk_reuse_rate real,
    product_risk_lib_fresh_rate real,
    product_risk_level_rate real,
    relation_risk_issue_rate real,
    sit_case_lib_referenced_count integer,
    sit_case_lib_count integer,
    uat_case_lib_referenced_count integer,
    uat_case_lib_count integer,
    system_add_update_delete_case_count integer,
    system_original_case_count integer,
    system_effective_issue_count integer,
    system_total_function_point_count integer,
    system_risk_referenced_count integer,
    system_risk_count integer,
    system_add_update_delete_lib_risk_count integer,
    system_original_risk_count integer,
    auto_test_case_lib_cover_rate real,
    auto_test_case_lib_reuse_rate real,
    sit_interface_script_rate real,
    uat_interface_script_rate real,
    sit_auto_script_fresh_rate real,
    uat_auto_script_fresh_rate real,
    sit_auto_execute_count integer,
    uat_auto_execute_count integer,
    sit_case_execute_count integer,
    uat_case_execute_count integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN system_metrics_report.id IS '主键id';
COMMENT ON COLUMN system_metrics_report.system_id IS '系统id';
COMMENT ON COLUMN system_metrics_report.system_name IS '系统名称';
COMMENT ON COLUMN system_metrics_report.system_manager_id IS '系统负责人';
COMMENT ON COLUMN system_metrics_report.system_manager_dept_id IS '系统负责人部门Id';
COMMENT ON COLUMN system_metrics_report.system_manager_dept_name IS '系统负责人处室';
COMMENT ON COLUMN system_metrics_report.create_time IS '保存时间';
COMMENT ON COLUMN system_metrics_report.sit_case_lib_asset_reuse_rate IS 'SIT案例库资产复用率';
COMMENT ON COLUMN system_metrics_report.uat_case_lib_asset_reuse_rate IS 'UAT案例库资产复用率';
COMMENT ON COLUMN system_metrics_report.case_lib_fresh_case_rate IS '资产库案例保鲜率';
COMMENT ON COLUMN system_metrics_report.issue_density_rate IS '缺陷密度';
COMMENT ON COLUMN system_metrics_report.product_risk_reuse_rate IS '产品风险复用率';
COMMENT ON COLUMN system_metrics_report.product_risk_lib_fresh_rate IS '产品风险库保险率';
COMMENT ON COLUMN system_metrics_report.product_risk_level_rate IS '产品风险等级占比';
COMMENT ON COLUMN system_metrics_report.relation_risk_issue_rate IS '关联风险缺陷占比';
COMMENT ON COLUMN system_metrics_report.sit_case_lib_referenced_count IS '案例库中SIT系统下被引用案例数量';
COMMENT ON COLUMN system_metrics_report.sit_case_lib_count IS '案例库中SIT系统下案例总数';
COMMENT ON COLUMN system_metrics_report.uat_case_lib_referenced_count IS '案例库中UAT系统下被引用案例数量';
COMMENT ON COLUMN system_metrics_report.uat_case_lib_count IS '案例库中UAT系统下案例总数';
COMMENT ON COLUMN system_metrics_report.system_add_update_delete_case_count IS '系统下更新新增删除案例数量';
COMMENT ON COLUMN system_metrics_report.system_original_case_count IS '系统下原有案例数量';
COMMENT ON COLUMN system_metrics_report.system_effective_issue_count IS '系统有效缺陷总数';
COMMENT ON COLUMN system_metrics_report.system_total_function_point_count IS '系统总功能点数';
COMMENT ON COLUMN system_metrics_report.system_risk_referenced_count IS '风险库中系统下被引用的风险数量';
COMMENT ON COLUMN system_metrics_report.system_risk_count IS '风险库中系统下风险总数';
COMMENT ON COLUMN system_metrics_report.system_add_update_delete_lib_risk_count IS '系统下更新新增删除风险数量';
COMMENT ON COLUMN system_metrics_report.system_original_risk_count IS '系统下原有风险数量';
COMMENT ON COLUMN system_metrics_report.auto_test_case_lib_cover_rate IS '案例库自动化测试案例覆盖率';
COMMENT ON COLUMN system_metrics_report.auto_test_case_lib_reuse_rate IS '自动化案例库资产复用率';
COMMENT ON COLUMN system_metrics_report.sit_interface_script_rate IS 'SIT接口场景化脚本率';
COMMENT ON COLUMN system_metrics_report.uat_interface_script_rate IS 'UAT接口场景化脚本率';
COMMENT ON COLUMN system_metrics_report.sit_auto_script_fresh_rate IS 'SIT自动化脚本保鲜率';
COMMENT ON COLUMN system_metrics_report.uat_auto_script_fresh_rate IS 'UAT自动化脚本保鲜率';
COMMENT ON COLUMN system_metrics_report.sit_auto_execute_count IS 'SIT自动化执行总次数';
COMMENT ON COLUMN system_metrics_report.uat_auto_execute_count IS 'UAT自动化执行总次数';
COMMENT ON COLUMN system_metrics_report.sit_case_execute_count IS 'SIT测试案例执行总次数';
COMMENT ON COLUMN system_metrics_report.uat_case_execute_count IS 'UAT测试案例执行总次数';
ALTER TABLE system_metrics_report ADD CONSTRAINT system_metrics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: system_relation_maintenance; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE system_relation_maintenance (
    id bigint NOT NULL,
    enterprise_id bigint DEFAULT 1619927771602984961::bigint,
    project_id bigint DEFAULT 1,
    system_id bigint NOT NULL,
    create_by character varying(128),
    create_time timestamp without time zone,
    update_by character varying(128),
    update_time timestamp without time zone,
    system_name character varying(128) NOT NULL,
    relation_id character varying(128),
    relation_user_id bigint,
    system_source character(1) DEFAULT 1,
    reaches_id bigint,
    hierarchy character varying(128)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE system_relation_maintenance IS '系统关系维护表';
COMMENT ON COLUMN system_relation_maintenance.system_name IS '系统名称';
COMMENT ON COLUMN system_relation_maintenance.relation_id IS '关联id，来源性能平台';
COMMENT ON COLUMN system_relation_maintenance.relation_user_id IS '关联人员所属id';
COMMENT ON COLUMN system_relation_maintenance.system_source IS '被测系统来源：1-vp，2-非vp';
COMMENT ON COLUMN system_relation_maintenance.reaches_id IS '渠道ID';
COMMENT ON COLUMN system_relation_maintenance.hierarchy IS '系统层级结构';
ALTER TABLE system_relation_maintenance ADD CONSTRAINT system_relation_maintenance_pk PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: task_metrics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE task_metrics_report (
    id bigint NOT NULL,
    cr_id bigint,
    cr_name character varying(255),
    cr_code character varying(255),
    cr_online_time timestamp without time zone,
    task_id bigint,
    task_name character varying(500),
    case_id character varying(50),
    case_name character varying(500),
    case_designer_id bigint,
    case_designer_name character varying(255),
    case_designer_group_name character varying(255),
    exec_status integer,
    auto_exec_flag boolean,
    create_by character varying(100),
    create_time timestamp without time zone,
    update_by character varying(100),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN task_metrics_report.id IS '主键id';
COMMENT ON COLUMN task_metrics_report.cr_id IS 'CRId';
COMMENT ON COLUMN task_metrics_report.cr_name IS 'CR名称';
COMMENT ON COLUMN task_metrics_report.cr_code IS 'CR编码';
COMMENT ON COLUMN task_metrics_report.cr_online_time IS 'CR上线时间';
COMMENT ON COLUMN task_metrics_report.task_id IS '任务Id';
COMMENT ON COLUMN task_metrics_report.task_name IS '任务名称';
COMMENT ON COLUMN task_metrics_report.case_id IS '案例Id';
COMMENT ON COLUMN task_metrics_report.case_name IS '案例名称';
COMMENT ON COLUMN task_metrics_report.case_designer_id IS '案例设计人Id';
COMMENT ON COLUMN task_metrics_report.case_designer_name IS '案例设计人名称';
COMMENT ON COLUMN task_metrics_report.case_designer_group_name IS '案例设计人组别';
COMMENT ON COLUMN task_metrics_report.exec_status IS '执行状态';
COMMENT ON COLUMN task_metrics_report.auto_exec_flag IS '是否自动化执行';
COMMENT ON COLUMN task_metrics_report.create_by IS '创建人';
COMMENT ON COLUMN task_metrics_report.create_time IS '创建时间';
COMMENT ON COLUMN task_metrics_report.update_by IS '更新人';
COMMENT ON COLUMN task_metrics_report.update_time IS '更新时间';
ALTER TABLE task_metrics_report ADD CONSTRAINT task_metrics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: test_auto_back_task_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_auto_back_task_statistics_report (
    id bigint NOT NULL,
    stageversion_id bigint,
    stageversion_name character varying(255),
    system_id bigint,
    system_name character varying(255),
    sit_case_count integer DEFAULT 0,
    sit_case_manual_count integer DEFAULT 0,
    sit_case_automatic_count integer DEFAULT 0,
    sit_case_exec_count integer DEFAULT 0,
    sit_case_exec_success_count integer DEFAULT 0,
    sit_case_manual_exec_count integer DEFAULT 0,
    sit_case_manual_exec_success_count integer DEFAULT 0,
    sit_case_automatic_exec_count integer DEFAULT 0,
    sit_case_automatic_exec_success_count integer DEFAULT 0,
    uat_case_count integer DEFAULT 0,
    uat_case_manual_count integer DEFAULT 0,
    uat_case_automatic_count integer DEFAULT 0,
    uat_case_exec_count integer DEFAULT 0,
    uat_case_exec_success_count integer DEFAULT 0,
    uat_case_manual_exec_count integer DEFAULT 0,
    uat_case_manual_exec_success_count integer DEFAULT 0,
    uat_case_automatic_exec_count integer DEFAULT 0,
    uat_case_automatic_exec_success_count integer DEFAULT 0,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    case_count integer,
    manual_case_count integer,
    auto_case_count integer,
    case_exec_count integer,
    case_exec_passed_count integer,
    manual_exec_count integer,
    manual_exec_passed_count integer,
    auto_exec_count integer,
    auto_exec_passed_count integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_auto_back_task_statistics_report IS '自动化回归统计报表';
COMMENT ON COLUMN test_auto_back_task_statistics_report.id IS '主键id';
COMMENT ON COLUMN test_auto_back_task_statistics_report.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN test_auto_back_task_statistics_report.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN test_auto_back_task_statistics_report.system_id IS '系统id';
COMMENT ON COLUMN test_auto_back_task_statistics_report.system_name IS '系统名称';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_count IS 'sit案例数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_manual_count IS 'sit手工案例数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_automatic_count IS 'sit自动化案例数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_exec_count IS 'sit案例执行数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_exec_success_count IS 'sit案例执行成功数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_manual_exec_count IS 'sit案例手工执行数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_manual_exec_success_count IS 'sit案例手工执行成功数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_automatic_exec_count IS 'sit案例自动化执行数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.sit_case_automatic_exec_success_count IS 'sit案例自动化执行成功数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_count IS 'uat案例数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_manual_count IS 'uat手工案例数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_automatic_count IS 'uat自动化案例数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_exec_count IS 'uat案例执行数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_exec_success_count IS 'uat案例执行成功数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_manual_exec_count IS 'uat案例手工执行数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_manual_exec_success_count IS 'uat案例手工执行成功数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_automatic_exec_count IS 'uat案例自动化执行数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.uat_case_automatic_exec_success_count IS 'uat案例自动化执行成功数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.create_by IS '创建人';
COMMENT ON COLUMN test_auto_back_task_statistics_report.create_time IS '创建时间';
COMMENT ON COLUMN test_auto_back_task_statistics_report.update_by IS '更新人';
COMMENT ON COLUMN test_auto_back_task_statistics_report.update_time IS '更新时间';
COMMENT ON COLUMN test_auto_back_task_statistics_report.enterprise_id IS '企业ID';
COMMENT ON COLUMN test_auto_back_task_statistics_report.project_id IS '项目ID';
COMMENT ON COLUMN test_auto_back_task_statistics_report.case_count IS '案例总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.manual_case_count IS '手工案例总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.auto_case_count IS '自动化案例总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.case_exec_count IS '案例执行总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.case_exec_passed_count IS '案例执行成功总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.manual_exec_count IS '手工执行总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.manual_exec_passed_count IS '手工执行成功总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.auto_exec_count IS '自动化执行总数';
COMMENT ON COLUMN test_auto_back_task_statistics_report.auto_exec_passed_count IS '自动化执行成功总数';

-- Name: test_auto_cr_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_auto_cr_statistics_report (
    id bigint NOT NULL,
    stageversion_id bigint,
    stageversion_name character varying(255),
    cr_id bigint,
    cr_name character varying,
    cr_code character varying,
    plan_status character(1) DEFAULT '0'::bpchar,
    system_id bigint,
    system_name character varying(255),
    smoke_flag character(1),
    sit_case_count integer DEFAULT 0,
    sit_case_manual_count integer DEFAULT 0,
    sit_case_automatic_count integer DEFAULT 0,
    sit_case_exec_count integer DEFAULT 0,
    sit_case_exec_success_count integer DEFAULT 0,
    sit_case_manual_exec_count integer DEFAULT 0,
    sit_case_manual_exec_success_count integer DEFAULT 0,
    sit_case_automatic_exec_count integer DEFAULT 0,
    sit_case_automatic_exec_success_count integer DEFAULT 0,
    uat_case_count integer DEFAULT 0,
    uat_case_manual_count integer DEFAULT 0,
    uat_case_automatic_count integer DEFAULT 0,
    uat_case_exec_count integer DEFAULT 0,
    uat_case_exec_success_count integer DEFAULT 0,
    uat_case_manual_exec_count integer DEFAULT 0,
    uat_case_manual_exec_success_count integer DEFAULT 0,
    uat_case_automatic_exec_count integer DEFAULT 0,
    uat_case_automatic_exec_success_count integer DEFAULT 0,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    case_count integer,
    manual_case_count integer,
    auto_case_count integer,
    case_exec_count integer,
    case_exec_passed_count integer,
    manual_exec_count integer,
    manual_exec_passed_count integer,
    auto_exec_count integer,
    auto_exec_passed_count integer,
    user_name character varying(100),
    group_name character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_auto_cr_statistics_report IS '自动化CR统计报表';
COMMENT ON COLUMN test_auto_cr_statistics_report.id IS '主键id';
COMMENT ON COLUMN test_auto_cr_statistics_report.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN test_auto_cr_statistics_report.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN test_auto_cr_statistics_report.cr_id IS 'cr id';
COMMENT ON COLUMN test_auto_cr_statistics_report.cr_name IS 'cr名称';
COMMENT ON COLUMN test_auto_cr_statistics_report.cr_code IS 'cr编码';
COMMENT ON COLUMN test_auto_cr_statistics_report.plan_status IS '计划状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN test_auto_cr_statistics_report.system_id IS '系统id';
COMMENT ON COLUMN test_auto_cr_statistics_report.system_name IS '系统名称';
COMMENT ON COLUMN test_auto_cr_statistics_report.smoke_flag IS '是否冒烟 0：否 1：是';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_count IS 'sit案例数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_manual_count IS 'sit手工案例数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_automatic_count IS 'sit自动化案例数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_exec_count IS 'sit案例执行数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_exec_success_count IS 'sit案例执行成功数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_manual_exec_count IS 'sit案例手工执行数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_manual_exec_success_count IS 'sit案例手工执行成功数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_automatic_exec_count IS 'sit案例自动化执行数';
COMMENT ON COLUMN test_auto_cr_statistics_report.sit_case_automatic_exec_success_count IS 'sit案例自动化执行成功数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_count IS 'uat案例数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_manual_count IS 'uat手工案例数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_automatic_count IS 'uat自动化案例数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_exec_count IS 'uat案例执行数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_exec_success_count IS 'uat案例执行成功数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_manual_exec_count IS 'uat案例手工执行数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_manual_exec_success_count IS 'uat案例手工执行成功数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_automatic_exec_count IS 'uat案例自动化执行数';
COMMENT ON COLUMN test_auto_cr_statistics_report.uat_case_automatic_exec_success_count IS 'uat案例自动化执行成功数';
COMMENT ON COLUMN test_auto_cr_statistics_report.create_by IS '创建人';
COMMENT ON COLUMN test_auto_cr_statistics_report.create_time IS '创建时间';
COMMENT ON COLUMN test_auto_cr_statistics_report.update_by IS '更新人';
COMMENT ON COLUMN test_auto_cr_statistics_report.update_time IS '更新时间';
COMMENT ON COLUMN test_auto_cr_statistics_report.enterprise_id IS '企业ID';
COMMENT ON COLUMN test_auto_cr_statistics_report.project_id IS '项目ID';
COMMENT ON COLUMN test_auto_cr_statistics_report.case_count IS '案例总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.manual_case_count IS '手工案例总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.auto_case_count IS '自动化案例总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.case_exec_count IS '案例执行总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.case_exec_passed_count IS '案例执行成功总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.manual_exec_count IS '手工执行总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.manual_exec_passed_count IS '手工执行成功总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.auto_exec_count IS '自动化执行总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.auto_exec_passed_count IS '自动化执行成功总数';
COMMENT ON COLUMN test_auto_cr_statistics_report.user_name IS '用户名';
COMMENT ON COLUMN test_auto_cr_statistics_report.group_name IS '组别';

-- Name: test_case; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_case (
    case_id bigint NOT NULL,
    create_by bigint,
    create_time timestamp without time zone,
    update_by bigint,
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    case_code character varying(255),
    dir_id bigint,
    case_test_type integer,
    case_type integer,
    case_priority integer,
    case_exec_type integer,
    case_side_type integer,
    case_name character varying(255),
    case_desc character varying(1000),
    case_prior character varying(1000),
    case_detail_json character varying(1000),
    case_file_json character varying(1000),
    case_remark character varying(1000),
    transaction_type integer,
    model_type integer,
    smoke_flag character(1),
    story_id bigint,
    cr_id bigint,
    stageversion_id bigint,
    cr_story_id bigint,
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    cycledate_type integer,
    cycledate_plan character varying(255),
    cycledate character varying(255),
    case_stage_type character varying(255),
    case_designer_id bigint,
    history integer,
    history_version bigint,
    review_status integer,
    design_status integer,
    exec_status integer,
    storage_status integer,
    source_from integer,
    del_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_case IS '测试用例';
COMMENT ON COLUMN test_case.case_id IS '主键id';
COMMENT ON COLUMN test_case.create_by IS '创建人';
COMMENT ON COLUMN test_case.create_time IS '创建时间';
COMMENT ON COLUMN test_case.update_by IS '更新人';
COMMENT ON COLUMN test_case.update_time IS '更新时间';
COMMENT ON COLUMN test_case.enterprise_id IS '企业id ';
COMMENT ON COLUMN test_case.project_id IS '项目组id ';
COMMENT ON COLUMN test_case.case_code IS '用例编号';
COMMENT ON COLUMN test_case.dir_id IS '用例目录id';
COMMENT ON COLUMN test_case.case_test_type IS '测试类型：功能测试，数据字典配置';
COMMENT ON COLUMN test_case.case_type IS '用例类型,流程案例，功能案例，接口案例，UI案例';
COMMENT ON COLUMN test_case.case_priority IS '用例重要度：1:高2:中3:低,数据字典';
COMMENT ON COLUMN test_case.case_exec_type IS '用例执行方式：1手工，2自动化';
COMMENT ON COLUMN test_case.case_side_type IS '用例性质：0：正例，1反例';
COMMENT ON COLUMN test_case.case_name IS '用例名称';
COMMENT ON COLUMN test_case.case_desc IS '用例描述';
COMMENT ON COLUMN test_case.case_prior IS '用例前置条件';
COMMENT ON COLUMN test_case.case_detail_json IS '用例详情json';
COMMENT ON COLUMN test_case.case_file_json IS '用例附件json';
COMMENT ON COLUMN test_case.case_remark IS '用例备注';
COMMENT ON COLUMN test_case.transaction_type IS '交易类型，0：金融交易，1：非金融交易。';
COMMENT ON COLUMN test_case.model_type IS '模式，0：日间，1：夜间';
COMMENT ON COLUMN test_case.smoke_flag IS '是否冒烟 0否 1是';
COMMENT ON COLUMN test_case.story_id IS '需求id';
COMMENT ON COLUMN test_case.cr_id IS 'CR-id';
COMMENT ON COLUMN test_case.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN test_case.cr_story_id IS '测试需求编号';
COMMENT ON COLUMN test_case.system_id IS '被测系统id';
COMMENT ON COLUMN test_case.first_module_id IS '一级模块id';
COMMENT ON COLUMN test_case.second_module_id IS '二级模块id';
COMMENT ON COLUMN test_case.cycledate_type IS 'cycle日期类型，取数据字典';
COMMENT ON COLUMN test_case.cycledate_plan IS 'cycle日期安排';
COMMENT ON COLUMN test_case.cycledate IS 'cycle日期';
COMMENT ON COLUMN test_case.case_stage_type IS '阶段版本标识，比如uat，sit';
COMMENT ON COLUMN test_case.case_designer_id IS '用例设计者id';
COMMENT ON COLUMN test_case.history IS '历史版本，0：否，1：是';
COMMENT ON COLUMN test_case.history_version IS '历史版本号';
COMMENT ON COLUMN test_case.review_status IS '评审状态';
COMMENT ON COLUMN test_case.design_status IS '设计状态';
COMMENT ON COLUMN test_case.exec_status IS '执行状态，最新的状态';
COMMENT ON COLUMN test_case.storage_status IS '入库状态';
COMMENT ON COLUMN test_case.source_from IS '数据来源 0:在系统创建 1:文件导入，2案例库导入';
COMMENT ON COLUMN test_case.del_flag IS '删除状态 0:正常 1:删除';
ALTER TABLE test_case ADD CONSTRAINT test_case_pkey PRIMARY KEY USING ubtree  (case_id) WITH (storage_type=USTORE);

-- Name: test_case_check_record; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_case_check_record (
    check_record_id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    cr_id bigint,
    check_name character varying(255),
    check_status character varying(5),
    process_case_ratio character varying(255),
    function_case_ratio character varying(255),
    intetface_case_ratio character varying(255),
    ui_case_ratio character varying(255),
    del_flag character(1),
    case_stage_type character varying(20),
    case_check_type character varying,
    check_primary_key character varying
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_case_check_record IS '测试案例规范检查记录表';
COMMENT ON COLUMN test_case_check_record.check_record_id IS '检查记录id';
COMMENT ON COLUMN test_case_check_record.enterprise_id IS '企业id';
COMMENT ON COLUMN test_case_check_record.project_id IS '项目组id';
COMMENT ON COLUMN test_case_check_record.cr_id IS 'CR主键';
COMMENT ON COLUMN test_case_check_record.check_name IS '检查名称';
COMMENT ON COLUMN test_case_check_record.check_status IS '检查状态；1-检查中；2-已完成';
COMMENT ON COLUMN test_case_check_record.process_case_ratio IS '流程案例正反例分布；正例：反例';
COMMENT ON COLUMN test_case_check_record.function_case_ratio IS '功能案例正反例分布；正例：反例';
COMMENT ON COLUMN test_case_check_record.intetface_case_ratio IS '接口案例正反例分布；正例：反例';
COMMENT ON COLUMN test_case_check_record.ui_case_ratio IS 'UI案例正反例分布；正例：反例';
COMMENT ON COLUMN test_case_check_record.del_flag IS '删除类型；0-正常，1-删除';
COMMENT ON COLUMN test_case_check_record.case_stage_type IS '测试阶段；sit/uat';
COMMENT ON COLUMN test_case_check_record.case_check_type IS '检查类型，默认是CR下某个阶段所有案例检查，case_warehousing：案例入库检查';
COMMENT ON COLUMN test_case_check_record.check_primary_key IS '不同检查类型的主键，例如：案例入库检查存的是评审Id';
ALTER TABLE test_case_check_record ADD CONSTRAINT test_case_check_record_pk PRIMARY KEY USING ubtree  (check_record_id) WITH (storage_type=USTORE);

-- Name: test_case_check_result; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_case_check_result (
    check_result_id bigint NOT NULL,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    check_record_id bigint,
    case_id character varying(50),
    field_name character varying(255),
    field_value character varying(255),
    description character varying(255),
    del_flag character(1)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_case_check_result IS '测试案例规范检查结果表';
COMMENT ON COLUMN test_case_check_result.check_result_id IS '检查结果id';
COMMENT ON COLUMN test_case_check_result.enterprise_id IS '企业id';
COMMENT ON COLUMN test_case_check_result.project_id IS '项目组id';
COMMENT ON COLUMN test_case_check_result.check_record_id IS '检查记录id';
COMMENT ON COLUMN test_case_check_result.case_id IS '案例id';
COMMENT ON COLUMN test_case_check_result.field_name IS '字段名称';
COMMENT ON COLUMN test_case_check_result.field_value IS '字段值';
COMMENT ON COLUMN test_case_check_result.description IS '问题描述';
COMMENT ON COLUMN test_case_check_result.del_flag IS '删除类型；0-正常，1-删除';
ALTER TABLE test_case_check_result ADD CONSTRAINT test_case_check_result_pk PRIMARY KEY USING ubtree  (check_result_id) WITH (storage_type=USTORE);

-- Name: test_case_dir; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_case_dir (
    dir_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64),
    update_by character varying(64),
    parent_id bigint,
    dir_code character varying(64),
    dir_name character varying(255),
    cr_id bigint,
    stage_type character varying(64),
    del_flag character(1) DEFAULT '0'::bpchar,
    enterprise_id bigint,
    project_id bigint,
    dir_type character varying(32),
    dir_order integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
ALTER TABLE test_case_dir ADD CONSTRAINT test_case_dir_pkey PRIMARY KEY USING ubtree  (dir_id) WITH (storage_type=USTORE);

-- Name: test_case_issue; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_case_issue (
    case_id bigint,
    issue_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);

-- Name: test_dir; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_dir (
    dir_id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64),
    update_by character varying(64),
    del_flag character(1) DEFAULT '0'::bpchar,
    parent_id bigint,
    dir_name character varying(255),
    dir_code character varying(64),
    dir_type character varying(32),
    dir_order integer,
    data_class character varying(255),
    data_id character varying(255),
    dir_flag tinyint,
    source_data_id character varying(255),
    source_data_class character varying(255),
    dir_desc character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN test_dir.source_data_id IS '来源的对象id';
COMMENT ON COLUMN test_dir.source_data_class IS '来源的全限类型';
COMMENT ON COLUMN test_dir.dir_desc IS '目录描述';
ALTER TABLE test_dir ADD CONSTRAINT test_dir_pkey PRIMARY KEY USING ubtree  (dir_id) WITH (storage_type=USTORE);
ALTER TABLE test_dir ADD CONSTRAINT dir_data_id_unique UNIQUE USING ubtree (data_id, source_data_id) WITH (storage_type=USTORE);

-- Name: test_library; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_library (
    library_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    library_name character varying(64),
    library_code character varying(64),
    library_desc character varying(800),
    del_flag character(1) DEFAULT '0'::bpchar,
    library_type integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_library IS '案例资产库表';
COMMENT ON COLUMN test_library.library_id IS '主键id';
COMMENT ON COLUMN test_library.create_by IS '创建人';
COMMENT ON COLUMN test_library.create_time IS '创建时间';
COMMENT ON COLUMN test_library.update_by IS '更新人';
COMMENT ON COLUMN test_library.update_time IS '更新时间';
COMMENT ON COLUMN test_library.enterprise_id IS '企业id ';
COMMENT ON COLUMN test_library.project_id IS '项目组id ';
COMMENT ON COLUMN test_library.library_name IS '案例库名称';
COMMENT ON COLUMN test_library.library_code IS '案例库编码';
COMMENT ON COLUMN test_library.library_desc IS '案例库描述';
COMMENT ON COLUMN test_library.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN test_library.library_type IS '资产库类型：1测试案例，2测试数据，3测试文件';
ALTER TABLE test_library ADD CONSTRAINT test_assert_warehouse_pkey PRIMARY KEY USING ubtree  (library_id) WITH (storage_type=USTORE);

-- Name: test_library_dir; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_library_dir (
    dir_id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    parent_id bigint,
    dir_code character varying(64),
    dir_name character varying(64),
    dir_order integer,
    del_flag character(1) DEFAULT '0'::bpchar,
    library_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_library_dir IS '案例资产库左侧树表';
COMMENT ON COLUMN test_library_dir.dir_id IS '主键id';
COMMENT ON COLUMN test_library_dir.create_by IS '创建人';
COMMENT ON COLUMN test_library_dir.create_time IS '创建时间';
COMMENT ON COLUMN test_library_dir.update_by IS '更新人';
COMMENT ON COLUMN test_library_dir.update_time IS '更新时间';
COMMENT ON COLUMN test_library_dir.enterprise_id IS '企业id ';
COMMENT ON COLUMN test_library_dir.project_id IS '项目组id ';
COMMENT ON COLUMN test_library_dir.parent_id IS '父模块id';
COMMENT ON COLUMN test_library_dir.dir_code IS '目录树编码';
COMMENT ON COLUMN test_library_dir.dir_name IS '目录树名称';
COMMENT ON COLUMN test_library_dir.dir_order IS '同级目录排序';
COMMENT ON COLUMN test_library_dir.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN test_library_dir.library_id IS '资产库id';
ALTER TABLE test_library_dir ADD CONSTRAINT test_assert_dir_pkey PRIMARY KEY USING ubtree  (dir_id) WITH (storage_type=USTORE);

-- Name: test_risk_expert; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_risk_expert (
    user_id bigint NOT NULL,
    username character varying(64),
    real_name character varying(64),
    manage_system_number integer,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_risk_expert IS '风险专家信息表';
COMMENT ON COLUMN test_risk_expert.user_id IS '人员id';
COMMENT ON COLUMN test_risk_expert.username IS '用户名';
COMMENT ON COLUMN test_risk_expert.real_name IS '真实姓名';
COMMENT ON COLUMN test_risk_expert.manage_system_number IS '管理的系统数量';
COMMENT ON COLUMN test_risk_expert.enterprise_id IS '企业id';
COMMENT ON COLUMN test_risk_expert.project_id IS '项目id';
ALTER TABLE test_risk_expert ADD CONSTRAINT test_risk_expert_pk PRIMARY KEY USING ubtree  (user_id) WITH (storage_type=USTORE);

-- Name: test_system_module_info; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_system_module_info (
    data_id character varying(100) NOT NULL,
    data_class character varying(255) NOT NULL,
    system_id bigint NOT NULL,
    first_module_id bigint NOT NULL,
    second_module_id bigint DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN test_system_module_info.data_id IS '数据对象id';
COMMENT ON COLUMN test_system_module_info.data_class IS '对象类型';
COMMENT ON COLUMN test_system_module_info.system_id IS '被测系统id';
COMMENT ON COLUMN test_system_module_info.first_module_id IS '一级模块id';
COMMENT ON COLUMN test_system_module_info.second_module_id IS '二级模块id';
ALTER TABLE test_system_module_info ADD CONSTRAINT test_system_module_info_pkey PRIMARY KEY USING ubtree  (data_id, data_class) WITH (storage_type=USTORE);

-- Name: test_task_case_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_task_case_relation (
    task_id bigint NOT NULL,
    case_id character varying NOT NULL,
    case_order integer,
    exec_status integer,
    exec_user bigint,
    latest_exec_time timestamp without time zone,
    cr_id bigint,
    create_time timestamp without time zone,
    task_type tinyint,
    stage_type character varying(50),
    case_exec_type integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_task_case_relation IS '测试任务与用例关系表';
COMMENT ON COLUMN test_task_case_relation.task_id IS '任务id';
COMMENT ON COLUMN test_task_case_relation.case_id IS '用例id';
COMMENT ON COLUMN test_task_case_relation.case_order IS '用例排序标识 执行任务编排用例时使用';
COMMENT ON COLUMN test_task_case_relation.exec_status IS '当前任务下用例的最新执行状态';
COMMENT ON COLUMN test_task_case_relation.exec_user IS '执行人';
COMMENT ON COLUMN test_task_case_relation.latest_exec_time IS '最新执行时间';
COMMENT ON COLUMN test_task_case_relation.cr_id IS 'crId,注：当任务是回归任务的时候cr_id为空';
COMMENT ON COLUMN test_task_case_relation.create_time IS '创建时间';
COMMENT ON COLUMN test_task_case_relation.task_type IS '任务类型';
COMMENT ON COLUMN test_task_case_relation.stage_type IS '阶段类型';
COMMENT ON COLUMN test_task_case_relation.case_exec_type IS '用例执行方式：1-手工，2-自动化';
CREATE INDEX idx_caseid ON test_task_case_relation USING ubtree (case_id) WITH (storage_type=USTORE) TABLESPACE pg_default;
ALTER TABLE test_task_case_relation ADD CONSTRAINT test_task_case_relation_pk PRIMARY KEY USING ubtree  (case_id, task_id) WITH (storage_type=USTORE);

-- Name: test_task_dir_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_task_dir_relation (
    task_id bigint NOT NULL,
    dir_id bigint NOT NULL
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_task_dir_relation IS '任务目录关系表';
COMMENT ON COLUMN test_task_dir_relation.task_id IS '任务id';
COMMENT ON COLUMN test_task_dir_relation.dir_id IS '目录id';
ALTER TABLE test_task_dir_relation ADD CONSTRAINT test_task_dir_relation_pkey PRIMARY KEY USING ubtree  (task_id, dir_id) WITH (storage_type=USTORE);

-- Name: test_task_exec_info; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_task_exec_info (
    task_id bigint NOT NULL,
    total_case integer DEFAULT 0,
    passed integer DEFAULT 0,
    failed integer DEFAULT 0,
    block integer DEFAULT 0,
    pending integer DEFAULT 0,
    execing integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_task_exec_info IS '测试任务对用用例的执行情况';
COMMENT ON COLUMN test_task_exec_info.task_id IS '任务id';
COMMENT ON COLUMN test_task_exec_info.total_case IS '任务绑定的用例个数';
COMMENT ON COLUMN test_task_exec_info.passed IS '用例通过数';
COMMENT ON COLUMN test_task_exec_info.failed IS '用例失败树';
COMMENT ON COLUMN test_task_exec_info.block IS '用例阻塞数';
COMMENT ON COLUMN test_task_exec_info.pending IS '用例未执行数';
COMMENT ON COLUMN test_task_exec_info.execing IS '用例执行中数';
ALTER TABLE test_task_exec_info ADD CONSTRAINT test_task_exec_info_pkey PRIMARY KEY USING ubtree  (task_id) WITH (storage_type=USTORE);

-- Name: test_task; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_task (
    task_id bigint NOT NULL,
    create_by character varying(32),
    create_time timestamp without time zone,
    update_by character varying(32),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    plan_id bigint,
    parent_id bigint,
    cr_id bigint,
    stage_activity_type integer,
    stage_type character varying(255),
    task_type bigint,
    exec_time integer,
    task_test_type bigint,
    task_code character varying(255),
    task_name character varying(255),
    task_desc text,
    task_create_user_id bigint,
    task_exec_user_id bigint,
    task_exec_type bigint,
    plan_task_start_time timestamp without time zone,
    plan_task_end_time timestamp without time zone,
    actual_start_time timestamp without time zone,
    actual_end_time timestamp without time zone,
    percentage numeric(32,10),
    complete_status integer,
    task_file_json character varying(1000),
    del_flag character(1) DEFAULT '0'::bpchar,
    circuit_start_time timestamp without time zone,
    circuit_end_time timestamp without time zone,
    stage_version_id bigint,
    system_id bigint,
    system_env character varying(50),
    stats_method character varying(255) DEFAULT 'statsWeek'::character varying
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_task IS '测试任务';
COMMENT ON COLUMN test_task.task_id IS '任务id';
COMMENT ON COLUMN test_task.create_by IS '创建人';
COMMENT ON COLUMN test_task.create_time IS '创建时间';
COMMENT ON COLUMN test_task.update_by IS '更新人';
COMMENT ON COLUMN test_task.update_time IS '更新时间';
COMMENT ON COLUMN test_task.enterprise_id IS '企业id';
COMMENT ON COLUMN test_task.project_id IS '项目组id';
COMMENT ON COLUMN test_task.plan_id IS '关联计划id';
COMMENT ON COLUMN test_task.parent_id IS '父id';
COMMENT ON COLUMN test_task.cr_id IS '需求id，可以是cr_id或者工单id';
COMMENT ON COLUMN test_task.stage_activity_type IS '阶段下活动id';
COMMENT ON COLUMN test_task.stage_type IS '阶段类型， 比如UAT, SIT';
COMMENT ON COLUMN test_task.task_type IS '任务类型 冒烟，回归。';
COMMENT ON COLUMN test_task.exec_time IS '执行轮次,取数据字典。';
COMMENT ON COLUMN test_task.task_test_type IS '测试类型 对应字典表计划任务测试类型。包括：功能测试、接口测试、兼容测试、性能测试、探索测试、用户体验测试、稳定性测试、安全测试';
COMMENT ON COLUMN test_task.task_code IS '任务code';
COMMENT ON COLUMN test_task.task_name IS '任务名称';
COMMENT ON COLUMN test_task.task_desc IS '任务描述';
COMMENT ON COLUMN test_task.task_create_user_id IS '任务创建人';
COMMENT ON COLUMN test_task.task_exec_user_id IS '任务执行人';
COMMENT ON COLUMN test_task.task_exec_type IS '任务执行方式 任务执行方式，对应字典表的任务执行方式，对测试执行任务有效。包括：手工、自动化';
COMMENT ON COLUMN test_task.plan_task_start_time IS '计划开始日期';
COMMENT ON COLUMN test_task.plan_task_end_time IS '计划结束日期';
COMMENT ON COLUMN test_task.actual_start_time IS '实际开始时间 自动填充：状态变迁：未开始——进行中；';
COMMENT ON COLUMN test_task.actual_end_time IS '实际结束时间 自动填充：状态变迁：进行中——已完成；';
COMMENT ON COLUMN test_task.percentage IS '任务进度';
COMMENT ON COLUMN test_task.complete_status IS '完成状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN test_task.task_file_json IS '任务附件json [{"fileId":xx,"fileName":"xxx","fileSize":"xxx","downloadUrl":"xxx"},{"fileId":xx,"fileName":"xxx","fileSize":"xxx","downloadUrl":"xxx"}]';
COMMENT ON COLUMN test_task.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN test_task.circuit_start_time IS '线路图开始时间';
COMMENT ON COLUMN test_task.circuit_end_time IS '线路图结束时间';
COMMENT ON COLUMN test_task.system_id IS '系统id';
COMMENT ON COLUMN test_task.system_env IS '系统环境';
CREATE INDEX test_task_cr_id_task_name ON test_task USING ubtree (cr_id, task_name) WITH (storage_type=USTORE) TABLESPACE pg_default;
ALTER TABLE test_task ADD CONSTRAINT test_task_pkey PRIMARY KEY USING ubtree  (task_id) WITH (storage_type=USTORE);

-- Name: version_change_basis; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE version_change_basis (
    issue_id character varying(50) NOT NULL,
    issue_no character varying(20),
    issue_name character varying(1000),
    system_name character varying(255),
    stageversion_name character varying(255),
    issue_status_name character varying(100),
    template_name character varying(100),
    problem_type character varying(30),
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE version_change_basis IS '版本变更依据表';
COMMENT ON COLUMN version_change_basis.issue_id IS '缺陷id';
COMMENT ON COLUMN version_change_basis.issue_no IS '缺陷编号';
COMMENT ON COLUMN version_change_basis.issue_name IS '标题';
COMMENT ON COLUMN version_change_basis.system_name IS '所属系统';
COMMENT ON COLUMN version_change_basis.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN version_change_basis.issue_status_name IS '缺陷状态';
COMMENT ON COLUMN version_change_basis.template_name IS '缺陷流程分类';
COMMENT ON COLUMN version_change_basis.problem_type IS '问题分类';
COMMENT ON COLUMN version_change_basis.create_by IS '缺陷创建人';
COMMENT ON COLUMN version_change_basis.create_time IS '缺陷创建时间';
COMMENT ON COLUMN version_change_basis.update_by IS '版本变更更新人';
COMMENT ON COLUMN version_change_basis.update_time IS '版本变更更新时间';
ALTER TABLE version_change_basis ADD CONSTRAINT version_change_basis_pkey PRIMARY KEY USING ubtree  (issue_id) WITH (storage_type=USTORE);

-- Name: version_change_basis_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE version_change_basis_config (
    config_id bigint NOT NULL,
    stageversion_ids character varying(1000),
    issue_status_ids character varying(1000),
    template_ids character varying(500),
    problem_types character varying(500),
    issue_noes character varying(1000),
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE version_change_basis_config IS '版本变更依据配置表';
COMMENT ON COLUMN version_change_basis_config.config_id IS '配置id';
COMMENT ON COLUMN version_change_basis_config.stageversion_ids IS '阶段版本ids';
COMMENT ON COLUMN version_change_basis_config.issue_status_ids IS '缺陷状态ids';
COMMENT ON COLUMN version_change_basis_config.template_ids IS '缺陷流程分类ids';
COMMENT ON COLUMN version_change_basis_config.problem_types IS '问题分类ids';
COMMENT ON COLUMN version_change_basis_config.issue_noes IS '缺陷编号ids';
COMMENT ON COLUMN version_change_basis_config.create_by IS '创建人';
COMMENT ON COLUMN version_change_basis_config.create_time IS '创建时间';
COMMENT ON COLUMN version_change_basis_config.update_by IS '更新人';
COMMENT ON COLUMN version_change_basis_config.update_time IS '更新时间';
ALTER TABLE version_change_basis_config ADD CONSTRAINT version_change_basis_config_pkey PRIMARY KEY USING ubtree  (config_id) WITH (storage_type=USTORE);

-- Name: workitem_field; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_field (
    workitem_field_id bigint NOT NULL,
    create_by character varying(255),
    create_time timestamp without time zone,
    update_by character varying(255),
    update_time timestamp without time zone,
    field_key character varying(32),
    enterprise_id bigint,
    project_id bigint,
    field_name character varying(128),
    column_name character varying(256),
    field_type_code character varying(64),
    field_default_value character varying(128),
    field_desc character varying(2048),
    system_flag smallint,
    category character varying(32),
    del_flag character(1) DEFAULT 0,
    other_option character varying(255),
    base_flag integer,
    list_config_flag integer,
    search_config_flag integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_field IS '事项属性表';
COMMENT ON COLUMN workitem_field.workitem_field_id IS '主键id';
COMMENT ON COLUMN workitem_field.create_by IS '创建人';
COMMENT ON COLUMN workitem_field.create_time IS '创建时间';
COMMENT ON COLUMN workitem_field.update_by IS '更新人';
COMMENT ON COLUMN workitem_field.update_time IS '更新时间';
COMMENT ON COLUMN workitem_field.field_key IS '字段唯一标识';
COMMENT ON COLUMN workitem_field.enterprise_id IS '企业id';
COMMENT ON COLUMN workitem_field.project_id IS '项目组id';
COMMENT ON COLUMN workitem_field.field_name IS '字段名称';
COMMENT ON COLUMN workitem_field.column_name IS '列名';
COMMENT ON COLUMN workitem_field.field_type_code IS '字段类型';
COMMENT ON COLUMN workitem_field.field_default_value IS '默认值';
COMMENT ON COLUMN workitem_field.field_desc IS '字段描述';
COMMENT ON COLUMN workitem_field.system_flag IS '1=系统(不可修改)，0=自定义';
COMMENT ON COLUMN workitem_field.category IS '分类：需求，用例、脚本。。。。。等';
COMMENT ON COLUMN workitem_field.del_flag IS '删除状态 0:正常 1:删除 2:停用';
COMMENT ON COLUMN workitem_field.other_option IS '存放标识,有值代表需要请求远程地址。';
COMMENT ON COLUMN workitem_field.base_flag IS '0是基础字段，1是自定义字段';
COMMENT ON COLUMN workitem_field.list_config_flag IS '是否是表头字段  0-否 1-是';
COMMENT ON COLUMN workitem_field.search_config_flag IS '是否是搜索字段 0-否 1-是';
ALTER TABLE workitem_field ADD CONSTRAINT workitem_field_pkey PRIMARY KEY USING ubtree  (workitem_field_id) WITH (storage_type=USTORE);

-- Name: workitem_field_list_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_field_list_config (
    field_id bigint NOT NULL,
    show_flag integer,
    default_flag integer,
    sort_flag integer,
    page_type character varying(100) NOT NULL,
    field_width integer,
    sort_field_flag integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_field_list_config IS '页搜索配置表-系统级别';
COMMENT ON COLUMN workitem_field_list_config.field_id IS '页面搜索属性 字段id';
COMMENT ON COLUMN workitem_field_list_config.show_flag IS '页面搜索属性 是否展示 0-展示 1不展示';
COMMENT ON COLUMN workitem_field_list_config.default_flag IS '页面搜索属性 是否是默认 0-是 1-不是';
COMMENT ON COLUMN workitem_field_list_config.sort_flag IS '页面搜索属性 排序';
COMMENT ON COLUMN workitem_field_list_config.page_type IS '页面搜索属性 页面分类';
COMMENT ON COLUMN workitem_field_list_config.field_width IS '页面搜索属性 字段展示宽度';
COMMENT ON COLUMN workitem_field_list_config.sort_field_flag IS '是否是排序字段 0-是  1-不是';
ALTER TABLE workitem_field_list_config ADD CONSTRAINT workitem_field_list_config_pk PRIMARY KEY USING ubtree  (field_id, page_type) WITH (storage_type=USTORE);

-- Name: workitem_field_option; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_field_option (
    id bigint NOT NULL,
    create_by character varying(255),
    create_time timestamp without time zone,
    update_by character varying(255),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    template_id bigint DEFAULT (0)::bigint,
    workitem_field_id bigint,
    field_option_code character varying(64),
    filed_option_name character varying(256),
    filed_option_position integer,
    del_flag character(1) DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_field_option IS '字段选项值';
COMMENT ON COLUMN workitem_field_option.id IS '主键id';
COMMENT ON COLUMN workitem_field_option.create_by IS '创建人';
COMMENT ON COLUMN workitem_field_option.create_time IS '创建时间';
COMMENT ON COLUMN workitem_field_option.update_by IS '更新人';
COMMENT ON COLUMN workitem_field_option.update_time IS '更新时间';
COMMENT ON COLUMN workitem_field_option.enterprise_id IS '企业id';
COMMENT ON COLUMN workitem_field_option.project_id IS '项目组id';
COMMENT ON COLUMN workitem_field_option.template_id IS '选项值所属模板Id';
COMMENT ON COLUMN workitem_field_option.workitem_field_id IS '自定义字段id 自定义字段id';
COMMENT ON COLUMN workitem_field_option.field_option_code IS '字段选项编码 字段选项编码';
COMMENT ON COLUMN workitem_field_option.filed_option_name IS '字段选项名称 字段选项名称';
COMMENT ON COLUMN workitem_field_option.filed_option_position IS '字段排序值 字段排序';
COMMENT ON COLUMN workitem_field_option.del_flag IS '删除状态 0:正常 1:删除 2:停用';
ALTER TABLE workitem_field_option ADD CONSTRAINT workitem_field_option_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: workitem_field_search_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_field_search_config (
    field_id bigint NOT NULL,
    show_flag integer,
    default_flag integer,
    sort_flag integer,
    page_type character varying(100) NOT NULL,
    field_width integer,
    field_value character varying(1000),
    search_type integer,
    group_bind_flag integer,
    size_limit integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN workitem_field_search_config.group_bind_flag IS '是否是筛选组绑定字段 0-是  1-不是';
COMMENT ON COLUMN workitem_field_search_config.size_limit IS '多选选项个数限制，为null不限制';
ALTER TABLE workitem_field_search_config ADD CONSTRAINT workitem_field_search_config_pk PRIMARY KEY USING ubtree  (field_id, page_type) WITH (storage_type=USTORE);

-- Name: workitem_field_template; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_field_template (
    id bigint NOT NULL,
    create_by character varying,
    create_time timestamp without time zone,
    update_by character varying,
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    template_id bigint,
    workitem_field_id bigint,
    field_default_value character varying(128) DEFAULT NULL::character varying,
    required tinyint,
    show_when_create tinyint,
    "position" tinyint,
    del_flag character(1) DEFAULT 0,
    fold_flag smallint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_field_template IS '模板字段关联表';
COMMENT ON COLUMN workitem_field_template.id IS '主键id';
COMMENT ON COLUMN workitem_field_template.create_by IS '创建人';
COMMENT ON COLUMN workitem_field_template.create_time IS '创建时间';
COMMENT ON COLUMN workitem_field_template.update_by IS '更信任';
COMMENT ON COLUMN workitem_field_template.update_time IS '更新时间';
COMMENT ON COLUMN workitem_field_template.enterprise_id IS '企业ID';
COMMENT ON COLUMN workitem_field_template.project_id IS '项目ID';
COMMENT ON COLUMN workitem_field_template.template_id IS '模板id';
COMMENT ON COLUMN workitem_field_template.workitem_field_id IS '自定义字段id';
COMMENT ON COLUMN workitem_field_template.field_default_value IS '字段默认值';
COMMENT ON COLUMN workitem_field_template.required IS '页面是否必填 1：必填；0：非必填';
COMMENT ON COLUMN workitem_field_template.show_when_create IS '页面新建是否显示 1:显示；0：隐藏';
COMMENT ON COLUMN workitem_field_template."position" IS '排序字段';
COMMENT ON COLUMN workitem_field_template.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN workitem_field_template.fold_flag IS '是否可折叠， 0：可折叠 1:不可折叠';
ALTER TABLE workitem_field_template ADD CONSTRAINT workitem_field_template_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: workitem_status; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_status (
    status_id bigint NOT NULL,
    create_by character varying(255),
    create_time timestamp without time zone,
    update_by character varying(255),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    status_name character varying(128),
    status_code character varying(128),
    status_desc character varying(128),
    status_sort integer,
    system_flag smallint,
    del_flag character(1) DEFAULT 0,
    status_scope character varying(255)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_status IS '事项状态';
COMMENT ON COLUMN workitem_status.status_id IS '事项状态主键ID';
COMMENT ON COLUMN workitem_status.create_by IS '创建人';
COMMENT ON COLUMN workitem_status.create_time IS '创建时间';
COMMENT ON COLUMN workitem_status.update_by IS '更新人';
COMMENT ON COLUMN workitem_status.update_time IS '更新时间';
COMMENT ON COLUMN workitem_status.enterprise_id IS '企业id';
COMMENT ON COLUMN workitem_status.project_id IS '项目组id';
COMMENT ON COLUMN workitem_status.status_name IS '事项状态名称';
COMMENT ON COLUMN workitem_status.status_code IS '事项状态类型';
COMMENT ON COLUMN workitem_status.status_desc IS '事项状态描述';
COMMENT ON COLUMN workitem_status.status_sort IS '事项状态排序';
COMMENT ON COLUMN workitem_status.system_flag IS '1=系统(不可修改)，0=自定义';
COMMENT ON COLUMN workitem_status.del_flag IS '删除状态 0:正常 1:删除';
COMMENT ON COLUMN workitem_status.status_scope IS '状态作用范围';
ALTER TABLE workitem_status ADD CONSTRAINT workitem_status_pk PRIMARY KEY USING ubtree  (status_id) WITH (storage_type=USTORE);

-- Name: workitem_template; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_template (
    template_id bigint NOT NULL,
    create_by character varying(255),
    create_time timestamp without time zone,
    update_by character varying(255),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    template_name character varying(128),
    template_code character varying(128),
    template_desc character varying(128),
    project_default smallint,
    system_flag smallint,
    del_flag character(1) DEFAULT 0,
    type_id bigint,
    sys_config integer,
    show_flag tinyint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN workitem_template.create_by IS '创建人';
COMMENT ON COLUMN workitem_template.type_id IS '事项类型id';
COMMENT ON COLUMN workitem_template.sys_config IS '是否是系统配置流程 0-是  1-否';
COMMENT ON COLUMN workitem_template.show_flag IS '是否显示';
ALTER TABLE workitem_template ADD CONSTRAINT workitem_template_pk PRIMARY KEY USING ubtree  (template_id) WITH (storage_type=USTORE);

-- Name: workitem_template_status; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_template_status (
    template_id bigint,
    create_by bigint,
    create_time timestamp without time zone,
    update_by bigint,
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    status_id bigint,
    status_sort integer,
    start_flag integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_template_status IS '状态和流程关系表';
COMMENT ON COLUMN workitem_template_status.template_id IS '模板id';
COMMENT ON COLUMN workitem_template_status.create_by IS '创建人';
COMMENT ON COLUMN workitem_template_status.create_time IS '创建时间';
COMMENT ON COLUMN workitem_template_status.update_by IS '更新人';
COMMENT ON COLUMN workitem_template_status.update_time IS '更新时间';
COMMENT ON COLUMN workitem_template_status.enterprise_id IS '企业id ';
COMMENT ON COLUMN workitem_template_status.project_id IS '项目组id ';
COMMENT ON COLUMN workitem_template_status.status_id IS '状态id';
COMMENT ON COLUMN workitem_template_status.status_sort IS '状态排序';
COMMENT ON COLUMN workitem_template_status.start_flag IS '是否是初始状态：1:是,0否';

-- Name: workitem_template_type; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE workitem_template_type (
    type_id bigint NOT NULL,
    create_by character varying(125) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_by character varying(125) DEFAULT NULL::character varying,
    update_time timestamp without time zone,
    type_name character varying(255) NOT NULL,
    system_flag tinyint,
    type_desc character varying(255) DEFAULT NULL::character varying,
    enterprise_id bigint,
    project_id bigint,
    type_code character varying(125)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE workitem_template_type IS '工作事项类型表';
COMMENT ON COLUMN workitem_template_type.type_id IS '主键id';
COMMENT ON COLUMN workitem_template_type.create_by IS '创建人';
COMMENT ON COLUMN workitem_template_type.create_time IS '创建时间';
COMMENT ON COLUMN workitem_template_type.update_by IS '更新人';
COMMENT ON COLUMN workitem_template_type.update_time IS '更新时间';
COMMENT ON COLUMN workitem_template_type.type_name IS '事项类型名称';
COMMENT ON COLUMN workitem_template_type.system_flag IS '是否是系统类型';
COMMENT ON COLUMN workitem_template_type.type_desc IS '描述';
COMMENT ON COLUMN workitem_template_type.enterprise_id IS '企业id';
COMMENT ON COLUMN workitem_template_type.project_id IS '项目id';
COMMENT ON COLUMN workitem_template_type.type_code IS '事项类型区别码';
ALTER TABLE workitem_template_type ADD CONSTRAINT workitem_template_type_pkey PRIMARY KEY USING ubtree  (type_id) WITH (storage_type=USTORE);

-- Name: sys_role; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_role (
    role_id bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    create_by character varying(64) DEFAULT NULL::character varying,
    update_by character varying(64) DEFAULT NULL::character varying,
    enterprise_id bigint NOT NULL,
    project_id bigint DEFAULT 0 NOT NULL,
    role_name character varying(64) NOT NULL,
    role_code character varying(64) NOT NULL,
    role_desc character varying(255) DEFAULT NULL::character varying,
    del_flag character(1) DEFAULT '0'::bpchar,
    role_type smallint,
    role_scope character varying,
    role_source integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_role IS '系统角色表';
COMMENT ON COLUMN sys_role.create_time IS '创建时间';
COMMENT ON COLUMN sys_role.update_time IS '修改时间';
COMMENT ON COLUMN sys_role.create_by IS '创建者';
COMMENT ON COLUMN sys_role.update_by IS '更新人';
COMMENT ON COLUMN sys_role.enterprise_id IS '企业id';
COMMENT ON COLUMN sys_role.project_id IS '项目id';
COMMENT ON COLUMN sys_role.role_name IS '角色名称';
COMMENT ON COLUMN sys_role.role_code IS '角色code';
COMMENT ON COLUMN sys_role.role_desc IS '角色描述';
COMMENT ON COLUMN sys_role.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN sys_role.role_type IS '角色类型 系统内置角色，1-超级管理员，2-企业创建者，3-企业管理者，4-企业成员，5-项目管理者，6-项目成员，7-项目普通成员[只读]，8-自定义角色，由创建者决定，9-OTHER,其他角色未知';
COMMENT ON COLUMN sys_role.role_scope IS '角色范围：system代表系统，custom代表自定义';
COMMENT ON COLUMN sys_role.role_source IS '角色来源 0：当前系统创建 1：vp系统同步';
ALTER TABLE sys_role ADD CONSTRAINT sys_role_pkey PRIMARY KEY USING ubtree  (role_id) WITH (storage_type=USTORE);

-- Name: sys_role_menu_relation; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE sys_role_menu_relation (
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    CONSTRAINT sys_role_menu_role_id_fkey FOREIGN KEY (role_id) REFERENCES sys_role(role_id)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE sys_role_menu_relation IS '角色菜单关系表';
COMMENT ON COLUMN sys_role_menu_relation.role_id IS '角色id';
COMMENT ON COLUMN sys_role_menu_relation.menu_id IS '菜单id';
COMMENT ON COLUMN sys_role_menu_relation.enterprise_id IS '企业Id';
COMMENT ON COLUMN sys_role_menu_relation.project_id IS '项目id';

-- Name: ai_requirement_generate_record; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_requirement_generate_record (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(255),
    create_time timestamp(6) without time zone,
    update_by character varying(255),
    update_time timestamp(6) without time zone,
    del_flag character(1) DEFAULT 0,
    generate_code character varying(100),
    interface_name character varying(255),
    cr_id bigint,
    stage_type character varying(100),
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    prompt_id bigint,
    prompt_name character varying(500),
    generate_count integer,
    adopt_count integer,
    node_id character varying(100)
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE ai_requirement_generate_record IS 'AI生成测试需求点记录表';
COMMENT ON COLUMN ai_requirement_generate_record.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN ai_requirement_generate_record.generate_code IS '生成编号';
COMMENT ON COLUMN ai_requirement_generate_record.interface_name IS '接口名称';
COMMENT ON COLUMN ai_requirement_generate_record.cr_id IS 'CR-ID';
COMMENT ON COLUMN ai_requirement_generate_record.stage_type IS '测试阶段：sit、uat';
COMMENT ON COLUMN ai_requirement_generate_record.prompt_name IS '测试需求点类型';
COMMENT ON COLUMN ai_requirement_generate_record.generate_count IS '生成数量';
COMMENT ON COLUMN ai_requirement_generate_record.adopt_count IS '采纳数量';
COMMENT ON COLUMN ai_requirement_generate_record.node_id IS '接口节点id';
ALTER TABLE ai_requirement_generate_record ADD CONSTRAINT ai_requirement_generate_record_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr_risk_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr_risk_statistics_report (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(255),
    create_time timestamp(6) without time zone,
    update_by character varying(255),
    update_time timestamp(6) without time zone,
    cr_id bigint,
    cr_name character varying(255),
    system_id bigint,
    stage_version_id bigint,
    library_risk_count integer DEFAULT 0,
    major_risk_count integer DEFAULT 0,
    high_risk_count integer DEFAULT 0,
    moderate_risk_count integer DEFAULT 0,
    low_risk_count integer DEFAULT 0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE story_cr_risk_statistics_report IS 'CR风险统计报表';
COMMENT ON COLUMN story_cr_risk_statistics_report.cr_id IS 'CR-ID';
COMMENT ON COLUMN story_cr_risk_statistics_report.cr_name IS 'CR名称';
COMMENT ON COLUMN story_cr_risk_statistics_report.stage_version_id IS 'CR所属阶段版本id';
COMMENT ON COLUMN story_cr_risk_statistics_report.library_risk_count IS '从资产库引入风险数量';
COMMENT ON COLUMN story_cr_risk_statistics_report.major_risk_count IS '重大风险数量';
COMMENT ON COLUMN story_cr_risk_statistics_report.high_risk_count IS '较大风险数量';
COMMENT ON COLUMN story_cr_risk_statistics_report.moderate_risk_count IS '一般风险数量';
COMMENT ON COLUMN story_cr_risk_statistics_report.low_risk_count IS '轻微风险数量';
ALTER TABLE story_cr_risk_statistics_report ADD CONSTRAINT story_cr_risk_statistics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: ai_case_generate_record; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_case_generate_record (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(255),
    create_time timestamp(6) without time zone,
    update_by character varying(255),
    update_time timestamp(6) without time zone,
    del_flag character(1) DEFAULT 0,
    generate_code character varying(100),
    interface_name character varying(255),
    cr_id bigint,
    case_stage_type character varying(100),
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    prompt_id bigint,
    prompt_name character varying(500),
    generate_count integer,
    is_full_adopt_count integer,
    is_not_full_adopt_count integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE ai_case_generate_record IS 'AI生成记案例录表';
COMMENT ON COLUMN ai_case_generate_record.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN ai_case_generate_record.generate_code IS '生成编号';
COMMENT ON COLUMN ai_case_generate_record.interface_name IS '接口名称';
COMMENT ON COLUMN ai_case_generate_record.cr_id IS 'CR-ID';
COMMENT ON COLUMN ai_case_generate_record.case_stage_type IS '测试阶段：sit、uat';
COMMENT ON COLUMN ai_case_generate_record.prompt_name IS '测试需求点类型';
COMMENT ON COLUMN ai_case_generate_record.generate_count IS '生成数量';
COMMENT ON COLUMN ai_case_generate_record.is_full_adopt_count IS '完全采纳数量';
COMMENT ON COLUMN ai_case_generate_record.is_not_full_adopt_count IS '部分采纳数量';
ALTER TABLE ai_case_generate_record ADD CONSTRAINT ai_case_generate_record_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: ai_knowledge_generate_record; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_knowledge_generate_record (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(255),
    create_time timestamp(6) without time zone,
    update_by character varying(255),
    update_time timestamp(6) without time zone,
    del_flag character(1) DEFAULT 0,
    generate_code character varying(100),
    interface_name character varying(255),
    cr_id bigint,
    stage_type character varying(100),
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    prompt_id bigint,
    prompt_name character varying(500),
    generate_count integer,
    adopt_count integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE ai_knowledge_generate_record IS '知识库生成记录表';
COMMENT ON COLUMN ai_knowledge_generate_record.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN ai_knowledge_generate_record.generate_code IS '生成编号';
COMMENT ON COLUMN ai_knowledge_generate_record.interface_name IS '接口名称';
COMMENT ON COLUMN ai_knowledge_generate_record.cr_id IS 'CR-ID';
COMMENT ON COLUMN ai_knowledge_generate_record.stage_type IS '测试阶段：sit、uat';
COMMENT ON COLUMN ai_knowledge_generate_record.prompt_name IS '测试需求点类型';
COMMENT ON COLUMN ai_knowledge_generate_record.generate_count IS '生成数量';
COMMENT ON COLUMN ai_knowledge_generate_record.adopt_count IS '采纳数量';
ALTER TABLE ai_knowledge_generate_record ADD CONSTRAINT ai_knowledge_generate_record_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: test_auto_cr_user_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_auto_cr_user_statistics_report (
    id bigint NOT NULL,
    stageversion_id bigint,
    stageversion_name character varying(255) DEFAULT NULL::character varying,
    cr_id bigint,
    cr_name character varying(255) DEFAULT NULL::character varying,
    cr_code character varying(255) DEFAULT NULL::character varying,
    plan_status integer DEFAULT 0,
    stage_type character varying(10) DEFAULT NULL::character varying,
    system_id bigint,
    system_name character varying(255) DEFAULT NULL::character varying,
    smoke_flag integer,
    user_id bigint,
    user_real_name character varying(255) DEFAULT NULL::character varying,
    user_name character varying(255) DEFAULT NULL::character varying,
    group_name character varying(255) DEFAULT NULL::character varying,
    case_count integer,
    auto_case_count integer,
    auto_case_from_library_count integer,
    case_exec_count integer,
    case_exec_passed_count integer,
    auto_exec_count integer,
    auto_exec_passed_count integer,
    auto_exec_interface_case_count integer,
    auto_exec_interface_case_passed_count integer,
    stats_date character varying(20) DEFAULT NULL::character varying,
    create_by character varying(64) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_by character varying(64) DEFAULT NULL::character varying,
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE test_auto_cr_user_statistics_report IS '自动化CR统计报表(用户)';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.id IS 'id';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.stageversion_id IS '阶段版本id';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.stageversion_name IS '阶段版本名称';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.cr_id IS 'cr id';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.cr_name IS 'cr名称';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.cr_code IS 'cr编码';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.plan_status IS '计划状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.stage_type IS '测试阶段';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.system_id IS '系统id';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.system_name IS '系统名称';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.smoke_flag IS '是否冒烟 0：否 1：是';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.user_id IS 'userId';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.user_real_name IS '用户名称';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.user_name IS '用户账号';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.group_name IS '用户组别';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.case_count IS '案例数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.auto_case_count IS '自动化案例数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.auto_case_from_library_count IS '引入的资产库自动化案例数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.case_exec_count IS '案例执行数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.case_exec_passed_count IS '案例执行成功数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.auto_exec_count IS '自动化执行数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.auto_exec_passed_count IS '自动化执行成功数';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.auto_exec_interface_case_count IS '自动化执行数(接口)';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.auto_exec_interface_case_passed_count IS '自动化执行成功数(接口)';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.stats_date IS '统计数据日期';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.create_by IS '创建人';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.create_time IS '创建时间';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.update_by IS '更新人';
COMMENT ON COLUMN test_auto_cr_user_statistics_report.update_time IS '更新时间';
ALTER TABLE test_auto_cr_user_statistics_report ADD CONSTRAINT test_auto_cr_user_statistics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: story_cr; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE story_cr (
    id bigint NOT NULL,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint,
    vp_cr_id bigint,
    cr_code character varying(255),
    cr_name character varying(255),
    cr_proposer_id bigint,
    cr_perincharge_id bigint,
    cr_type character varying(255),
    cr_status character varying(255),
    cr_urgent character varying(255),
    cr_urgent_state character varying(255),
    agile_flag character varying(255),
    business_flag character varying(255),
    cr_processing_link character varying(500),
    cr_stageversion_id bigint,
    cr_online_time timestamp without time zone,
    test_manager_id bigint,
    test_contact_id bigint,
    cr_review_id bigint,
    sit_exec_id bigint,
    uat_exec_id bigint,
    sit_plan_start_date timestamp without time zone,
    sit_plan_end_date timestamp without time zone,
    uat_plan_start_date timestamp without time zone,
    uat_plan_end_date timestamp without time zone,
    cr_summary text,
    sit_cr_plan_start_date timestamp without time zone,
    sit_cr_plan_end_date timestamp without time zone,
    uat_cr_plan_start_date timestamp without time zone,
    uat_cr_plan_end_date timestamp without time zone,
    sit_manager_team character varying(255),
    uat_manager_team character varying(255),
    del_flag character(1) DEFAULT '0'::bpchar,
    source character(1) DEFAULT '1'::bpchar,
    cr_group character varying(255),
    risk_level character(1),
    process_id bigint,
    plan_status character(1) DEFAULT '0'::bpchar,
    work_order_evidence character(1),
    work_order_receipt_date timestamp without time zone,
    work_order_source character varying(64),
    remark character varying(255),
    work_order_commit_ir character(1),
    story_type character(1),
    work_order_itil_type character(1),
    work_order_itil_code character varying(255),
    work_order_dept character varying(255),
    work_order_tir_code character varying(255),
    is_requirement character varying(255),
    requirement_describe character varying(255),
    is_review character varying(10),
    sit_in_time timestamp without time zone,
    sit_out_time timestamp without time zone,
    cr_analyst_id bigint,
    functioncut_state character(1),
    planview_flag character(1),
    new_sit character(1),
    integration_manager_id bigint,
    key_project_flag integer DEFAULT 0,
    account_change_flag integer,
    impact_customer_flag integer,
    process_change_description character varying(1500),
    execute_users character varying(500),
    cr_chieforg_name character varying(50),
    cr_put_dep_name character varying(50),
    sit_admittance_start_time timestamp with time zone,
    uat_publish_end_time timestamp with time zone
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON COLUMN story_cr.id IS 'CR需求主键ID';
COMMENT ON COLUMN story_cr.create_by IS '创建人';
COMMENT ON COLUMN story_cr.create_time IS '创建时间';
COMMENT ON COLUMN story_cr.update_by IS '更新人';
COMMENT ON COLUMN story_cr.update_time IS '更新时间';
COMMENT ON COLUMN story_cr.enterprise_id IS '企业ID';
COMMENT ON COLUMN story_cr.project_id IS '项目ID';
COMMENT ON COLUMN story_cr.vp_cr_id IS 'CRID';
COMMENT ON COLUMN story_cr.cr_code IS 'CR编码';
COMMENT ON COLUMN story_cr.cr_name IS 'CR名称';
COMMENT ON COLUMN story_cr.cr_proposer_id IS 'CR提出人-人员ID';
COMMENT ON COLUMN story_cr.cr_perincharge_id IS 'CR负责人-人员ID';
COMMENT ON COLUMN story_cr.cr_type IS '需求类型 ： 1 技术类(新业务需求)、2 技术类(小需求)、3 技术类(优化需求)、4 技术类、5 业务类(新建系统/系统重构)、6 业务类(新业务需求)、7 业务类(微需求)、8 业务类(小需求)、 9 业务类(分行特色需求)、 10 业务类(优化需求),11 技术类';
COMMENT ON COLUMN story_cr.cr_status IS 'CR状态，1正常，3取消，6关闭，7超期取消';
COMMENT ON COLUMN story_cr.cr_urgent IS 'CR紧急程度 1特急 2紧急 3一般';
COMMENT ON COLUMN story_cr.cr_urgent_state IS 'CR紧急状态 0正常 1紧急';
COMMENT ON COLUMN story_cr.agile_flag IS '是否敏捷，1是，其他否';
COMMENT ON COLUMN story_cr.business_flag IS '是否商务完成，1完成，0未完成';
COMMENT ON COLUMN story_cr.cr_processing_link IS '当前处理环节';
COMMENT ON COLUMN story_cr.cr_stageversion_id IS '阶段版本id';
COMMENT ON COLUMN story_cr.cr_online_time IS '上线时间';
COMMENT ON COLUMN story_cr.test_manager_id IS '测试经理-人员ID';
COMMENT ON COLUMN story_cr.test_contact_id IS '测试联系人-人员ID';
COMMENT ON COLUMN story_cr.cr_review_id IS 'CR需求评审人-人员ID';
COMMENT ON COLUMN story_cr.sit_exec_id IS 'sit实施经理-人员ID';
COMMENT ON COLUMN story_cr.uat_exec_id IS 'uat实施经理-人员ID';
COMMENT ON COLUMN story_cr.sit_plan_start_date IS 'sit计划开始时间';
COMMENT ON COLUMN story_cr.sit_plan_end_date IS 'sit计划结束时间';
COMMENT ON COLUMN story_cr.uat_plan_start_date IS 'uat计划开始时间';
COMMENT ON COLUMN story_cr.uat_plan_end_date IS 'uat计划结束时间';
COMMENT ON COLUMN story_cr.cr_summary IS 'CR描述';
COMMENT ON COLUMN story_cr.sit_cr_plan_start_date IS 'sit cr发布管理开始时间';
COMMENT ON COLUMN story_cr.sit_cr_plan_end_date IS 'sit cr发布管理结束时间';
COMMENT ON COLUMN story_cr.uat_cr_plan_start_date IS 'uat cr发布管理开始时间';
COMMENT ON COLUMN story_cr.uat_cr_plan_end_date IS 'uat cr发布管理结束时间';
COMMENT ON COLUMN story_cr.sit_manager_team IS 'sit执行团队';
COMMENT ON COLUMN story_cr.uat_manager_team IS 'uat执行团队';
COMMENT ON COLUMN story_cr.del_flag IS '0-正常，1-删除';
COMMENT ON COLUMN story_cr.source IS '0-不是来源vp，1-是来源vp';
COMMENT ON COLUMN story_cr.cr_group IS 'CR分组(0:全部,1:分配给我的，2:我创建的，3:我关注的)';
COMMENT ON COLUMN story_cr.risk_level IS '风险级别 0低, 1中, 2高';
COMMENT ON COLUMN story_cr.process_id IS '流程id';
COMMENT ON COLUMN story_cr.plan_status IS '计划状态 0:未开始 1:进行中 2:已完成';
COMMENT ON COLUMN story_cr.work_order_evidence IS '是否反馈证迹	0: 否  1: 是';
COMMENT ON COLUMN story_cr.work_order_receipt_date IS '接收日期';
COMMENT ON COLUMN story_cr.work_order_source IS '工单来源';
COMMENT ON COLUMN story_cr.remark IS '备注';
COMMENT ON COLUMN story_cr.work_order_commit_ir IS '是否提交IR 0: 否  1: 是';
COMMENT ON COLUMN story_cr.story_type IS '需求类型	0: CR  1: 工单';
COMMENT ON COLUMN story_cr.work_order_itil_type IS 'itil类型	0: 优化建议单  1: 生产支持单';
COMMENT ON COLUMN story_cr.work_order_itil_code IS 'itil编号';
COMMENT ON COLUMN story_cr.work_order_dept IS '相关处室';
COMMENT ON COLUMN story_cr.work_order_tir_code IS 'tir编号';
COMMENT ON COLUMN story_cr.is_requirement IS '是否有特殊要求';
COMMENT ON COLUMN story_cr.requirement_describe IS '特殊要求描述';
COMMENT ON COLUMN story_cr.is_review IS '是否需要测服评审，0否，1是';
COMMENT ON COLUMN story_cr.sit_in_time IS 'Sit准入时间';
COMMENT ON COLUMN story_cr.sit_out_time IS 'Sit准出时间';
COMMENT ON COLUMN story_cr.cr_analyst_id IS 'CR分析人-人员ID';
COMMENT ON COLUMN story_cr.functioncut_state IS '功能切分是否完成  1完成，0未完成';
COMMENT ON COLUMN story_cr.planview_flag IS '计划评审是否完成  1完成，0未完成';
COMMENT ON COLUMN story_cr.new_sit IS '是否被测试中心承接  1承接，0不承接';
COMMENT ON COLUMN story_cr.integration_manager_id IS '系统集成测试管理人-人员ID';
COMMENT ON COLUMN story_cr.key_project_flag IS '是否是重点项目 0-不是  1-是';
COMMENT ON COLUMN story_cr.account_change_flag IS '是否涉及账务变动 0-不是  1-是';
COMMENT ON COLUMN story_cr.impact_customer_flag IS '改造是否直接影响客户 0-不是  1-是';
COMMENT ON COLUMN story_cr.process_change_description IS '流程变更说明';
COMMENT ON COLUMN story_cr.execute_users IS '执行人员';
COMMENT ON COLUMN story_cr.cr_chieforg_name IS 'CR牵头开发处室名称';
COMMENT ON COLUMN story_cr.cr_put_dep_name IS '需求提出部门名称';
COMMENT ON COLUMN story_cr.sit_admittance_start_time IS 'CR最后一次进入到系统集成测试准入的时间';
COMMENT ON COLUMN story_cr.uat_publish_end_time IS '用户验收测试发布管理际完成的时间';
ALTER TABLE story_cr ADD CONSTRAINT story_cr_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: ai_generate_statistics; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_generate_statistics (
    id bigint NOT NULL,
    enterprise_id bigint,
    project_id bigint,
    create_by character varying(255),
    create_time timestamp(6) without time zone,
    update_by character varying(255),
    update_time timestamp(6) without time zone,
    interface_name character varying(255),
    interface_id bigint,
    cr_id bigint,
    stage_type character varying(100),
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    prompt_name character varying(500),
    requirement_count integer DEFAULT 0,
    requirement_generate_count integer DEFAULT 0,
    requirement_generate_adopt_count integer DEFAULT 0,
    requirement_adopt_keep_count integer DEFAULT 0,
    full_adopt_requirement_count integer DEFAULT 0,
    not_full_adopt_requirement_count integer DEFAULT 0,
    requirement_adopt_rate numeric(10,2) DEFAULT 0.0,
    requirement_cover_rate numeric(10,2) DEFAULT 0.0,
    requirement_available_rate numeric(10,2) DEFAULT 0.0,
    case_count integer DEFAULT 0,
    case_generate_count integer DEFAULT 0,
    case_generate_adopt_count integer DEFAULT 0,
    case_keep_adopt_count integer DEFAULT 0,
    full_adopt_case_count integer DEFAULT 0,
    not_full_adopt_case_count integer DEFAULT 0,
    case_adopt_rate numeric(10,2) DEFAULT 0.0,
    case_cover_rate numeric(10,2) DEFAULT 0.0,
    case_available_rate numeric(10,2) DEFAULT 0.0,
    ai_case_issue_rate numeric(10,2) DEFAULT 0.0,
    rule_count integer DEFAULT 0,
    rule_adopt_count integer DEFAULT 0,
    rule_adopt_rate numeric(10,2) DEFAULT 0.0
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE ai_generate_statistics IS 'AI生成统计结果表';
COMMENT ON COLUMN ai_generate_statistics.interface_name IS '接口名称';
COMMENT ON COLUMN ai_generate_statistics.cr_id IS 'CR-ID';
COMMENT ON COLUMN ai_generate_statistics.stage_type IS '测试阶段：sit、uat';
COMMENT ON COLUMN ai_generate_statistics.prompt_name IS '提示词类型';
COMMENT ON COLUMN ai_generate_statistics.requirement_count IS '测试需求点总数';
COMMENT ON COLUMN ai_generate_statistics.requirement_generate_count IS '测试需求点生成总数';
COMMENT ON COLUMN ai_generate_statistics.requirement_generate_adopt_count IS '测试需求点，采纳总数';
COMMENT ON COLUMN ai_generate_statistics.requirement_adopt_keep_count IS '测试需求点，采纳留存数';
COMMENT ON COLUMN ai_generate_statistics.full_adopt_requirement_count IS '测试需求点，完全采纳总数';
COMMENT ON COLUMN ai_generate_statistics.not_full_adopt_requirement_count IS '测试需求点，不完全采纳总数';
COMMENT ON COLUMN ai_generate_statistics.requirement_adopt_rate IS '测试需求点，采纳率';
COMMENT ON COLUMN ai_generate_statistics.requirement_cover_rate IS '测试需求点，覆盖率';
COMMENT ON COLUMN ai_generate_statistics.requirement_available_rate IS '测试需求点，直接可用率';
COMMENT ON COLUMN ai_generate_statistics.case_count IS '案例总数';
COMMENT ON COLUMN ai_generate_statistics.case_generate_count IS '案例生成总数';
COMMENT ON COLUMN ai_generate_statistics.case_generate_adopt_count IS '案例，采纳总数';
COMMENT ON COLUMN ai_generate_statistics.case_keep_adopt_count IS '案例，采纳留存数';
COMMENT ON COLUMN ai_generate_statistics.full_adopt_case_count IS '案例，完全采纳总数';
COMMENT ON COLUMN ai_generate_statistics.not_full_adopt_case_count IS '案例，不完全采纳总数';
COMMENT ON COLUMN ai_generate_statistics.case_adopt_rate IS '案例，采纳率';
COMMENT ON COLUMN ai_generate_statistics.case_cover_rate IS '案例，覆盖率';
COMMENT ON COLUMN ai_generate_statistics.ai_case_issue_rate IS '生成案例，关联缺陷占比';
COMMENT ON COLUMN ai_generate_statistics.rule_count IS '规则总数（生成）';
COMMENT ON COLUMN ai_generate_statistics.rule_adopt_count IS '规则采纳数';
COMMENT ON COLUMN ai_generate_statistics.rule_adopt_rate IS '规则采纳数率';
ALTER TABLE ai_generate_statistics ADD CONSTRAINT ai_generate_statistics_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: ai_requirement_data_record; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE ai_requirement_data_record (
    requirement_id bigint NOT NULL,
    create_time timestamp(6) without time zone,
    create_by character varying(100),
    update_time timestamp(6) without time zone,
    update_by character varying(100),
    enterprise_id bigint,
    project_id bigint,
    cr_id bigint,
    stage_type character varying(100),
    requirement_name character varying(1500),
    requirement_desc character varying(500),
    system_id bigint,
    first_module_id bigint,
    second_module_id bigint,
    interface_name character varying(500),
    priority integer,
    prompt_id bigint,
    prompt_name character varying(250),
    node_id character varying(64),
    adopt_type character varying(5),
    generate_code character varying(100),
    stageversion_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE ai_requirement_data_record IS '测试需求点生成数据记录表';
COMMENT ON COLUMN ai_requirement_data_record.enterprise_id IS '企业ID';
COMMENT ON COLUMN ai_requirement_data_record.project_id IS '项目组ID';
COMMENT ON COLUMN ai_requirement_data_record.cr_id IS 'CR-ID';
COMMENT ON COLUMN ai_requirement_data_record.stage_type IS 'CR名称';
COMMENT ON COLUMN ai_requirement_data_record.requirement_name IS '需求点名字';
COMMENT ON COLUMN ai_requirement_data_record.requirement_desc IS '需求点描述';
COMMENT ON COLUMN ai_requirement_data_record.system_id IS '系统id';
COMMENT ON COLUMN ai_requirement_data_record.first_module_id IS '一级模块id';
COMMENT ON COLUMN ai_requirement_data_record.second_module_id IS '二级模块id';
COMMENT ON COLUMN ai_requirement_data_record.interface_name IS '测试接口名称';
COMMENT ON COLUMN ai_requirement_data_record.priority IS '重要性：1-高，2-中，3-低';
COMMENT ON COLUMN ai_requirement_data_record.prompt_id IS '测试需求点类型ID';
COMMENT ON COLUMN ai_requirement_data_record.prompt_name IS '测试需求点类型';
COMMENT ON COLUMN ai_requirement_data_record.node_id IS '接口节点ID';
COMMENT ON COLUMN ai_requirement_data_record.adopt_type IS '采纳类型，1-采纳 2-部分采纳 3-不采纳';
COMMENT ON COLUMN ai_requirement_data_record.generate_code IS '生成编号';
ALTER TABLE ai_requirement_data_record ADD CONSTRAINT ai_requirement_data_record_pkey PRIMARY KEY USING ubtree  (requirement_id) WITH (storage_type=USTORE);

-- Name: external_tool_config; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE external_tool_config (
    tool_id bigint NOT NULL,
    tool_name character varying(200),
    tool_desc character varying(200),
    tool_type integer,
    business_env character varying(255),
    data_product character varying(50),
    valid_flag integer,
    return_field text,
    param character varying(500),
    return_content_example text,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone,
    enterprise_id bigint,
    project_id bigint
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE external_tool_config IS '外部工具配置表';
COMMENT ON COLUMN external_tool_config.tool_id IS '工具id';
COMMENT ON COLUMN external_tool_config.tool_name IS '工具名称';
COMMENT ON COLUMN external_tool_config.tool_desc IS '描述';
COMMENT ON COLUMN external_tool_config.tool_type IS '工具类型（1：数据准备平台 2：自定义工具）';
COMMENT ON COLUMN external_tool_config.business_env IS '业务环境';
COMMENT ON COLUMN external_tool_config.data_product IS '数据产品';
COMMENT ON COLUMN external_tool_config.valid_flag IS '是否有效（0：无效 1：有效）';
COMMENT ON COLUMN external_tool_config.return_field IS '返回字段';
COMMENT ON COLUMN external_tool_config.param IS '参数';
COMMENT ON COLUMN external_tool_config.return_content_example IS '返回内容示例配置';
COMMENT ON COLUMN external_tool_config.create_by IS '创建人';
COMMENT ON COLUMN external_tool_config.create_time IS '创建时间';
COMMENT ON COLUMN external_tool_config.update_by IS '更新人';
COMMENT ON COLUMN external_tool_config.update_time IS '更新时间';
COMMENT ON COLUMN external_tool_config.enterprise_id IS '企业ID';
COMMENT ON COLUMN external_tool_config.project_id IS '项目ID';
ALTER TABLE external_tool_config ADD CONSTRAINT external_tool_config_pkey PRIMARY KEY USING ubtree  (tool_id) WITH (storage_type=USTORE);

-- Name: test_auto_back_task_user_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_auto_back_task_user_statistics_report (
    id bigint NOT NULL,
    stageversion_id bigint,
    stageversion_name character varying(100) DEFAULT NULL::character varying,
    task_id bigint,
    task_name character varying(100) DEFAULT NULL::character varying,
    task_status bigint,
    stats_method character varying(100) DEFAULT NULL::character varying,
    case_stage_type character varying(100) DEFAULT NULL::character varying,
    system_id bigint,
    system_name character varying(100) DEFAULT NULL::character varying,
    user_id bigint,
    user_real_name character varying(100) DEFAULT NULL::character varying,
    user_name character varying(100) DEFAULT NULL::character varying,
    group_name character varying(100) DEFAULT NULL::character varying,
    dept_id bigint,
    dept_name character varying(100) DEFAULT NULL::character varying,
    case_count integer DEFAULT 0,
    manual_case_count integer DEFAULT 0,
    auto_case_count integer DEFAULT 0,
    case_exec_count integer DEFAULT 0,
    case_exec_passed_count integer DEFAULT 0,
    manual_exec_count integer DEFAULT 0,
    manual_exec_passed_count integer DEFAULT 0,
    auto_exec_count integer DEFAULT 0,
    auto_exec_passed_count integer DEFAULT 0,
    inter_face_auto_exec_count integer DEFAULT 0,
    inter_face_auto_exec_passed_count integer DEFAULT 0,
    create_by character varying(64) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_by character varying(64) DEFAULT NULL::character varying,
    update_time timestamp without time zone,
    stats_date character varying(100) DEFAULT NULL::character varying
)
WITH (orientation=row, compression=no, storage_type=USTORE);

-- Name: test_auto_inspect_statistics_report; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE test_auto_inspect_statistics_report (
    id bigint NOT NULL,
    task_id bigint,
    task_name character varying(255),
    task_type tinyint,
    task_status tinyint,
    task_system_id bigint,
    task_system_name character varying(255),
    case_system_id bigint,
    case_system_name character varying(255),
    case_stage_type character varying(10),
    user_id bigint,
    user_real_name character varying(100),
    user_name character varying(100),
    dept_id bigint,
    dept_name character varying(255),
    group_name character varying(100),
    stats_date character varying(100),
    case_exec_count integer,
    case_exec_success_count integer,
    case_auto_exec_count integer,
    case_auto_exec_success_count integer,
    case_interface_auto_exec_count integer,
    case_interface_auto_exec_success_count integer,
    create_by character varying(64),
    create_time timestamp without time zone,
    update_by character varying(64),
    update_time timestamp without time zone
)
WITH (orientation=row, compression=no, storage_type=ustore);
COMMENT ON COLUMN test_auto_inspect_statistics_report.id IS '主键id';
COMMENT ON COLUMN test_auto_inspect_statistics_report.task_id IS '任务id';
COMMENT ON COLUMN test_auto_inspect_statistics_report.task_name IS '任务标题';
COMMENT ON COLUMN test_auto_inspect_statistics_report.task_type IS '任务类型';
COMMENT ON COLUMN test_auto_inspect_statistics_report.task_status IS '任务状态';
COMMENT ON COLUMN test_auto_inspect_statistics_report.task_system_id IS '任务关联系统Id';
COMMENT ON COLUMN test_auto_inspect_statistics_report.task_system_name IS '系统名称';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_system_id IS '案例关联系统Id';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_system_name IS '案例关联系统名称';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_stage_type IS '测试阶段';
COMMENT ON COLUMN test_auto_inspect_statistics_report.user_id IS '用户id';
COMMENT ON COLUMN test_auto_inspect_statistics_report.user_real_name IS '用户名称';
COMMENT ON COLUMN test_auto_inspect_statistics_report.user_name IS '用户账号';
COMMENT ON COLUMN test_auto_inspect_statistics_report.dept_id IS '部门id';
COMMENT ON COLUMN test_auto_inspect_statistics_report.dept_name IS '部门名称';
COMMENT ON COLUMN test_auto_inspect_statistics_report.group_name IS '用户组别';
COMMENT ON COLUMN test_auto_inspect_statistics_report.stats_date IS '最后一次执行时间';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_exec_count IS '案例执行数';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_exec_success_count IS '案例执行成功数';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_auto_exec_count IS '自动化执行过数';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_auto_exec_success_count IS '自动化执行成功过数';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_interface_auto_exec_count IS '接口自动化执行过数';
COMMENT ON COLUMN test_auto_inspect_statistics_report.case_interface_auto_exec_success_count IS '接口自动化执行过成功数';
COMMENT ON COLUMN test_auto_inspect_statistics_report.create_by IS '创建人';
COMMENT ON COLUMN test_auto_inspect_statistics_report.create_time IS '创建时间';
COMMENT ON COLUMN test_auto_inspect_statistics_report.update_by IS '更新人';
COMMENT ON COLUMN test_auto_inspect_statistics_report.update_time IS '更新时间';
ALTER TABLE test_auto_inspect_statistics_report ADD CONSTRAINT test_auto_inspect_statistics_report_pkey PRIMARY KEY USING ubtree  (id) WITH (storage_type=ustore);

-- Name: outside_tool_data_num; Type: Table; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh;
CREATE TABLE outside_tool_data_num (
    id bigint NOT NULL,
    create_by character varying(100),
    update_by character varying(100),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    case_id character varying NOT NULL,
    generate_data_num integer,
    matching_data_num integer,
    accept_data_num integer
)
WITH (orientation=row, compression=no, storage_type=USTORE);
COMMENT ON TABLE outside_tool_data_num IS '外部工具数据统计情况';
COMMENT ON COLUMN outside_tool_data_num.id IS 'id';
COMMENT ON COLUMN outside_tool_data_num.create_by IS '创建人';
COMMENT ON COLUMN outside_tool_data_num.update_by IS '更新人';
COMMENT ON COLUMN outside_tool_data_num.create_time IS '创建时间';
COMMENT ON COLUMN outside_tool_data_num.update_time IS '更新时间';
COMMENT ON COLUMN outside_tool_data_num.case_id IS '案例id';
COMMENT ON COLUMN outside_tool_data_num.generate_data_num IS '生成数据条数';
COMMENT ON COLUMN outside_tool_data_num.matching_data_num IS '匹配数据条数';
COMMENT ON COLUMN outside_tool_data_num.accept_data_num IS '采纳数据条数';
ALTER TABLE outside_tool_data_num ADD CONSTRAINT outside_tool_data_num_pk PRIMARY KEY USING ubtree  (id) WITH (storage_type=USTORE);

-- Name: case_metrics_report_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW case_metrics_report_view
	AS 
SELECT case_metrics_report.cr_name AS "CR名称", case_metrics_report.cr_code AS "CR编码", case_metrics_report.cr_online_time AS "CR上线时间", case_metrics_report.case_name AS "案例名称", case_metrics_report.case_designer_name AS "案例设计人名称", case_metrics_report.case_designer_group_name AS "案例设计人组别", case_metrics_report.related_issue AS "关联缺陷", CASE WHEN (case_metrics_report.auto_exec_flag = true) THEN '是'::text ELSE '否'::text END AS "是否自动化案例", case_metrics_report.case_stage_type AS "阶段版本标识(sit,uat)", case_metrics_report.system_name AS "系统名称", case_metrics_report.system_manager_dept_name AS "系统负责人所属处室名称", case_metrics_report.first_module_name AS "一级模块名称", case_metrics_report.second_module_name AS "二级模块名称", case_metrics_report.stage_version_name AS "阶段版本名称" FROM case_metrics_report;

-- Name: cr_crtype_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW cr_crtype_view
	AS 
SELECT cr_metrics_report.cr_name AS "cr名称", cr_metrics_report.cr_online_time AS "cr上线时间", cr_metrics_report.cr_type AS "cr类型" FROM cr_metrics_report WHERE ((cr_metrics_report.uat_accepted_flag = true) OR (cr_metrics_report.sit_accepted_flag = true));

-- Name: cr_metrics_report_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW cr_metrics_report_view
	AS 
SELECT cr_metrics_report.cr_name AS "cr名称", cr_metrics_report.cr_online_time AS "cr上线时间", cr_metrics_report.stage_version_name AS "阶段版本名称", cr_metrics_report.cr_proposer_dept_name AS "需求提出部门", cr_metrics_report.dev_dept_name AS "开发处室", cr_metrics_report.cr_type AS "cr类型", cr_metrics_report.cr_process_name AS "测试过程类型", CASE WHEN (cr_metrics_report.delayed_release_flag = true) THEN '是'::text ELSE '否'::text END AS "是否延期发布", cr_metrics_report.sit_test_case_reuse_rate AS "sit测试案例复用率", cr_metrics_report.uat_test_case_reuse_rate AS "uat测试案例复用率", cr_metrics_report.sit_positive_negative_ratio AS "sit正反向案例比", cr_metrics_report.uat_positive_negative_ratio AS "uat正反向案例比", cr_metrics_report.sit_test_case_density AS "sit案例密度", cr_metrics_report.uat_test_case_density AS "uat案例密度", cr_metrics_report.sit_req_change_test_case_change_rate AS "sit需求变更测试案例变更率", cr_metrics_report.uat_req_change_test_case_change_rate AS "uat需求变更测试案例变更率", cr_metrics_report.sit_test_case_hit_rate AS "sit测试案例命中率", cr_metrics_report.uat_test_case_hit_rate AS "uat测试案例命中率", cr_metrics_report.sit_effective_defect_rate AS "sit有效缺陷率", cr_metrics_report.uat_effective_defect_rate AS "uat有效缺陷率", cr_metrics_report.defect_escape_rate AS "缺陷逃逸率", CASE WHEN (cr_metrics_report.uat_accepted_flag = true) THEN '是'::text ELSE ''::text END AS "uat是否承接且投产", CASE WHEN (cr_metrics_report.sit_accepted_flag = true) THEN '是'::text ELSE ''::text END AS "sit是否承接且投产", CASE WHEN (cr_metrics_report.test_phase_req_change_flag = true) THEN '是'::text ELSE '否'::text END AS "是否测试阶段需求变更", cr_metrics_report.sit_smoke_test_passed_rate AS "sit冒烟测试通过率", cr_metrics_report.uat_smoke_test_passed_rate AS "uat冒烟测试通过率", CASE WHEN (cr_metrics_report.sit_smoke_test_flag = true) THEN '是'::text ELSE '否'::text END AS "sit是否有冒烟测试", CASE WHEN (cr_metrics_report.sit_smoke_test_all_passed_flag = true) THEN '是'::text ELSE ''::text END AS "sit冒烟测试是否全部通过", CASE WHEN (cr_metrics_report.uat_smoke_test_flag = true) THEN '是'::text ELSE '否'::text END AS "uat是否有冒烟测试", CASE WHEN (cr_metrics_report.uat_smoke_test_all_passed_flag = true) THEN '是'::text ELSE ''::text END AS "uat冒烟测试是否全部通过", CASE WHEN (cr_metrics_report.sit_delayed_release_flag = true) THEN '是'::text ELSE ''::text END AS "sit是否延期上版", CASE WHEN (cr_metrics_report.uat_delayed_release_flag = true) THEN '是'::text ELSE ''::text END AS "uat是否延期上版", cr_metrics_report.code_defect_percentage AS "代码类缺陷占比", cr_metrics_report.avg_defect_resolution_time AS "缺陷平均停留时长", cr_metrics_report.requirement_type_defect_rate AS "需求类类缺陷占比", cr_metrics_report.env_type_defect_rate AS "环境类类缺陷占比", cr_metrics_report.optimization_type_defect_rate AS "优化类缺陷占比", cr_metrics_report.design_type_defect_rate AS "设计类缺陷占比", cr_metrics_report.data_type_defect_rate AS "数据类缺陷占比", cr_metrics_report.param_type_defect_rate AS "参数类缺陷占比", cr_metrics_report.fun_spec_type_defect_rate AS "功能规格类缺陷占比", cr_metrics_report.itil_type_defect_rate AS "itil类缺陷占比", cr_metrics_report.delayed_defect_resolution_percentage AS "缺陷延迟修复占比", cr_metrics_report.blocked_defect_rate AS "阻塞缺陷率", cr_metrics_report.critical_major_defect_percentage AS "致命或严重缺陷占比", cr_metrics_report.defect_rejection_rate AS "缺陷不通过率", CASE WHEN (cr_metrics_report.uat_compliant_flag = true) THEN '是'::text ELSE '否'::text END AS "用户验收测试是否达标", cr_metrics_report.product_risk_level_distribution_percentage AS "产品风险等级占比", cr_metrics_report.sit_cr_testing_duration AS "单个cr在sit阶段执行测试时长", cr_metrics_report.uat_cr_testing_duration AS "单个cr在uat阶段执行测试时长", CASE WHEN (cr_metrics_report.excessive_micro_flag = true) THEN '是'::text ELSE ''::text END AS "是否属于超标微需求", CASE WHEN (cr_metrics_report.micro_flag = true) THEN '是'::text ELSE '否'::text END AS "是否微需求", cr_metrics_report.issue_density AS "缺陷密度", cr_metrics_report.risk_issue_rate AS "关联风险缺陷占比", cr_metrics_report.cr_automated_case_execute_count AS "CR自动化案例执行总次数", cr_metrics_report.cr_case_execute_count AS "CR案例执行总次数", cr_metrics_report.cr_automated_test_execute_rate AS "CR自动化测试执行占比", cr_metrics_report.cr_sit_automated_case_execute_count AS "CR-SIT自动化案例执行总次数", cr_metrics_report.cr_sit_case_execute_count AS "CR-SIT案例执行总次数", cr_metrics_report.cr_sit_automated_test_execute_rate AS "CR-SIT自动化测试执行占比", cr_metrics_report.cr_uat_automated_case_execute_count AS "CR-UAT自动化案例执行总次数", cr_metrics_report.cr_uat_case_execute_count AS "CR-UAT案例执行总次数", cr_metrics_report.cr_uat_automated_test_execute_rate AS "CR-UAT自动化测试执行占比", CASE WHEN (cr_metrics_report.automated_test_flag = true) THEN '是'::text ELSE '否'::text END AS "是否应用自动化测试", cr_metrics_report.cr_automated_case_count AS "CR自动化案例数量", cr_metrics_report.cr_case_count AS "CR案例总数", cr_metrics_report.cr_automated_test_case_converage_rate AS "CR自动化测试案例覆盖率", cr_metrics_report.sit_automated_test_case_from_case_library_count AS "sit从案例库引入自动化案例总数", cr_metrics_report.sit_automated_test_case_count AS "sit自动化案例总数", cr_metrics_report.sit_automated_test_case_reuse_rate AS "SIT自动化测试案例复用率", cr_metrics_report.uat_automated_test_case_from_case_library_count AS "uat从案例库引入自动化案例总数", cr_metrics_report.uat_automated_test_case_count AS "uat自动化案例总数", cr_metrics_report.uat_automated_test_case_reuse_rate AS "UAT自动化测试案例复用率", cr_metrics_report.cr_risk_count AS "CR风险总数", cr_metrics_report.risk_issue_count AS "关联风险缺陷数量", cr_metrics_report.product_risk_level_distribution_count AS "重大/较大产品风险个数", cr_metrics_report.critical_major_defect_count AS "阻塞和严重缺陷总数", cr_metrics_report.sit_lib_case_import_count AS "SIT从案例库引入案例数量", cr_metrics_report.sit_case_count AS "SIT案例总数", cr_metrics_report.uat_lib_case_import_count AS "UAT从案例库引入案例数量", cr_metrics_report.uat_case_count AS "UAT案例总数", cr_metrics_report.sit_positive_count AS "SIT正向案例数", cr_metrics_report.sit_negative_count AS "SIT反向案例数", cr_metrics_report.uat_positive_count AS "UAT正向案例数", cr_metrics_report.uat_negative_count AS "UAT反向案例数", cr_metrics_report.sit_second_module_count AS "SIT案例二级模块数", cr_metrics_report.uat_second_module_count AS "UAT案例二级模块数", cr_metrics_report.sit_case_relate_issue_count AS "SIT案例关联的缺陷总数", cr_metrics_report.uat_case_relate_issue_count AS "UAT案例关联的缺陷总数", cr_metrics_report.sit_effective_issue_count AS "SIT有效缺陷数", cr_metrics_report.sit_issue_count AS "SIT缺陷总数", cr_metrics_report.uat_effective_issue_count AS "UAT有效缺陷数", cr_metrics_report.uat_issue_count AS "UAT缺陷总数", cr_metrics_report.code_defect_count AS "代码类有效缺陷数", cr_metrics_report.effective_issue_count AS "有效缺陷总数", cr_metrics_report.requirement_type_defect_count AS "需求类有效缺陷数", cr_metrics_report.env_type_defect_count AS "环境类有效缺陷数", cr_metrics_report.optimization_type_defect_count AS "优化类有效缺陷数", cr_metrics_report.design_type_defect_count AS "设计类有效缺陷数", cr_metrics_report.data_type_defect_count AS "数据类有效缺陷数", cr_metrics_report.param_type_defect_count AS "参数类有效缺陷数", cr_metrics_report.fun_spec_type_defect_count AS "功能规格类有效缺陷数", cr_metrics_report.itil_type_defect_count AS "itil类有效缺陷数", cr_metrics_report.blocked_defect_count AS "阻塞缺陷数量", cr_metrics_report.other_type_defect_count AS "其他类有效缺陷数", cr_metrics_report.have_question_effective_issue_count AS "有问题分类有效缺陷总数", cr_metrics_report.sit_req_change_case_count AS "SIT需求变更案例数量", cr_metrics_report.uat_req_change_case_count AS "UAT需求变更案例数量", cr_metrics_report.total_functional_points AS "总功能点数", CASE WHEN ((cr_metrics_report.agile_flag)::bigint = 1) THEN '是'::text ELSE '否'::text END AS "是否敏捷" FROM cr_metrics_report;

-- Name: group_metrics_report_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW group_metrics_report_view
	AS 
SELECT group_metrics_report.group_name AS "组别", group_metrics_report.create_time AS "保存时间", group_metrics_report.lib_auto_case_count AS "案例库自动化案例总数", group_metrics_report.lib_case_count AS "案例库案例总数", group_metrics_report.lib_auto_case_cover_rate AS "案例库自动化测试案例覆盖率", group_metrics_report.sit_group_add_delete_update_after_exec_once_script_count AS "SIT组别增删改且改后至少执行一次的脚本数量", group_metrics_report.uat_group_add_delete_update_after_exec_once_script_count AS "UAT组别增删改且改后至少执行一次的脚本数量", group_metrics_report.sit_group_original_auto_script_count AS "SIT组别原有自动化脚本数量", group_metrics_report.uat_group_original_auto_script_count AS "UAT组别原有自动化脚本数量", group_metrics_report.sit_group_scenarioization_script_count AS "SIT组别下打过场景化脚本标签的脚本数量", group_metrics_report.uat_group_scenarioization_script_count AS "UAT组别下打过场景化脚本标签的脚本数量", group_metrics_report.sit_group_all_auto_script_count AS "SIT组别下所有自动化脚本数量", group_metrics_report.uat_group_all_auto_script_count AS "UAT组别下所有自动化脚本数量" FROM group_metrics_report;

-- Name: issue_metrics_report_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW issue_metrics_report_view
	AS 
SELECT issue_metrics_report.issue_name AS "缺陷名称", issue_metrics_report.issue_no AS "缺陷编号", issue_metrics_report.problem_type AS "问题分类", issue_metrics_report.stage_type AS "测试阶段", issue_metrics_report.stage_version_name AS "阶段版本", issue_metrics_report.valid_and_close_duration AS "缺陷停留时长", issue_metrics_report.repair_duration AS "缺陷修复所用时长", issue_metrics_report.cr_name AS "cr名称", issue_metrics_report.cr_online_time AS "cr上线时间", issue_metrics_report.system_name AS "缺所属系统", issue_metrics_report.system_manager_dept_name AS "系统负责人所属处室", CASE WHEN (issue_metrics_report.block_flag = true) THEN '是'::text ELSE '否'::text END AS "是否阻塞类缺陷", CASE WHEN (issue_metrics_report.serious_flag = true) THEN '是'::text ELSE '否'::text END AS "是否严重或致命类缺陷", CASE WHEN ((issue_metrics_report.overdue_flag)::bigint = 1) THEN '是'::text ELSE '否'::text END AS "是否超期", CASE WHEN (issue_metrics_report.passed_flag = true) THEN '是'::text ELSE '否'::text END AS "是否通过标识", CASE WHEN (issue_metrics_report.code_problem_flag = true) THEN '是'::text ELSE '否'::text END AS "是否代码类问题" FROM issue_metrics_report;

-- Name: month_test_metrics_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW month_test_metrics_view
	AS 
SELECT month_test_metrics.create_time AS "创建时间", month_test_metrics.sit_test_case_capacity AS "sit测试案例产能", month_test_metrics.uat_test_case_capacity AS "uat测试案例产能", month_test_metrics.sit_issue_efficacy AS "sit缺陷效能", month_test_metrics.uat_issue_efficacy AS "uat缺陷效能", month_test_metrics.sit_fun_test_efficacy AS "sit功能点测试效能", month_test_metrics.uat_fun_test_efficacy AS "uat功能点测试效能", month_test_metrics.cr_sit_test_efficacy AS "sit阶段cr测试效能", month_test_metrics.cr_uat_test_efficacy AS "uat阶段cr测试效能", month_test_metrics.product_risk_reuse_rate AS "产品风险复用率", month_test_metrics.product_risk_lib_fresh_rate AS "产品风险库保鲜率", month_test_metrics.case_lib_reuse_rate AS "案例资产复用率", month_test_metrics.case_lib_fresh_rate AS "案例库案例保鲜率", month_test_metrics.auto_test_case_lib_reuse_rate AS "自动化案例资产复用率", month_test_metrics.case_lib_sit_reuse_rate AS "案例库SIT资产复用率", month_test_metrics.case_lib_uat_reuse_rate AS "案例库UAT资产复用率", month_test_metrics.interface_test_case_lib_cover_rate AS "接口测试案例库自动化案例覆盖率", month_test_metrics.ui_test_case_lib_cover_rate AS "UI测试案例库自动化案例覆盖率", month_test_metrics.sit_interface_script_rate AS "SIT接口场景化脚本率", month_test_metrics.uat_interface_script_rate AS "UAT接口场景化脚本率", month_test_metrics.sit_auto_script_fresh_rate AS "SIT自动化脚本保鲜率", month_test_metrics.uat_auto_script_fresh_rate AS "UAT自动化脚本保鲜率", month_test_metrics.sit_auto_execute_count AS "SIT自动化执行总次数", month_test_metrics.uat_auto_execute_count AS "UAT自动化执行总次数", month_test_metrics.sit_case_execute_count AS "SIT测试案例执行总次数", month_test_metrics.uat_case_execute_count AS "UAT测试案例执行总次数" FROM month_test_metrics;

-- Name: system_metrics_report_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW system_metrics_report_view
	AS 
SELECT system_metrics_report.system_id AS "系统id", system_metrics_report.system_name AS "系统名称", system_metrics_report.system_manager_dept_name AS "系统负责人处室", system_metrics_report.create_time AS "保存时间", system_metrics_report.sit_case_lib_asset_reuse_rate AS "sit案例库资产复用率", system_metrics_report.uat_case_lib_asset_reuse_rate AS "uat案例库资产复用率", system_metrics_report.case_lib_fresh_case_rate AS "资产库案例保鲜率", system_metrics_report.issue_density_rate AS "缺陷密度", system_metrics_report.product_risk_reuse_rate AS "产品风险复用率", system_metrics_report.product_risk_lib_fresh_rate AS "产品风险库保鲜率", system_metrics_report.product_risk_level_rate AS "产品风险等级占比", system_metrics_report.relation_risk_issue_rate AS "关联风险缺陷占比", system_metrics_report.sit_case_lib_referenced_count AS "案例库中SIT系统下被引用案例数量", system_metrics_report.sit_case_lib_count AS "案例库中SIT系统下案例总数", system_metrics_report.uat_case_lib_referenced_count AS "案例库中UAT系统下被引用案例数量", system_metrics_report.uat_case_lib_count AS "案例库中UAT系统下案例总数", system_metrics_report.system_add_update_delete_case_count AS "系统下更新新增删除案例数量", system_metrics_report.system_original_case_count AS "系统下原有案例数量", system_metrics_report.system_effective_issue_count AS "系统有效缺陷总数", system_metrics_report.system_total_function_point_count AS "系统总功能点数", system_metrics_report.system_risk_referenced_count AS "风险库中系统下被引用的风险数量", system_metrics_report.system_risk_count AS "风险库中系统下风险总数", system_metrics_report.system_add_update_delete_lib_risk_count AS "系统下更新新增删除风险数量", system_metrics_report.system_original_risk_count AS "系统下原有风险数量", system_metrics_report.auto_test_case_lib_cover_rate AS "案例库自动化测试案例覆盖率", system_metrics_report.auto_test_case_lib_reuse_rate AS "自动化案例库资产复用率", system_metrics_report.sit_interface_script_rate AS "SIT接口场景化脚本率", system_metrics_report.uat_interface_script_rate AS "UAT接口场景化脚本率", system_metrics_report.sit_auto_script_fresh_rate AS "SIT自动化脚本保鲜率", system_metrics_report.uat_auto_script_fresh_rate AS "UAT自动化脚本保鲜率", system_metrics_report.sit_auto_execute_count AS "SIT自动化执行总次数", system_metrics_report.uat_auto_execute_count AS "UAT自动化执行总次数", system_metrics_report.sit_case_execute_count AS "SIT测试案例执行总次数", system_metrics_report.uat_case_execute_count AS "UAT测试案例执行总次数" FROM system_metrics_report;

-- Name: task_metrics_report_view; Type: View ; Schema: testserver_devcxyh;

SET search_path = testserver_devcxyh ;

CREATE OR REPLACE VIEW task_metrics_report_view
	AS 
SELECT task_metrics_report.cr_name AS "CR名称", task_metrics_report.cr_code AS "CR编码", task_metrics_report.cr_online_time AS "CR上线时间", task_metrics_report.task_name AS "任务名称", task_metrics_report.case_name AS "案例名称", task_metrics_report.case_designer_name AS "案例设计人名称", task_metrics_report.case_designer_group_name AS "案例设计人组别", CASE WHEN (task_metrics_report.exec_status = 1) THEN '未执行'::text WHEN (task_metrics_report.exec_status = 2) THEN '阻塞'::text WHEN (task_metrics_report.exec_status = 3) THEN '通过'::text WHEN (task_metrics_report.exec_status = 4) THEN '失败'::text WHEN (task_metrics_report.exec_status = 5) THEN '执行中'::text WHEN (task_metrics_report.exec_status = 6) THEN '已取消'::text ELSE NULL::text END AS "执行状态", CASE WHEN (task_metrics_report.auto_exec_flag = true) THEN '是'::text ELSE '否'::text END AS "是否自动化执行" FROM task_metrics_report;
