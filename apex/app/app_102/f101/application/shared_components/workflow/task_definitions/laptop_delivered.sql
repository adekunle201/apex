prompt --application/shared_components/workflow/task_definitions/laptop_delivered
begin
--   Manifest
--     TASK_DEF: Laptop Delivered
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(1523968628606752824)
,p_name=>'Laptop Delivered'
,p_static_id=>'LAPTOP_DELIVERED'
,p_subject=>'Awaiting delivery of &LAPTOP_TYPE. laptop for &ENAME.'
,p_task_type=>'ACTION'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case laptop_type when ''MAC'' then ''MacBook Pro'' when ''WIN'' then ''Lenovo T490'' end as laptop_type',
'from eba_demo_appr_laptop_requests lr',
'left outer join eba_demo_appr_emp e on e.empno = lr.empno',
'where lr.id = :APEX$TASK_PK'))
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(1523968911956752826)
,p_task_def_id=>wwv_flow_imp.id(1523968628606752824)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.userlist_for_department(''OPERATIONS'')'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(1523969328321752826)
,p_task_def_id=>wwv_flow_imp.id(1523968628606752824)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp.component_end;
end;
/
