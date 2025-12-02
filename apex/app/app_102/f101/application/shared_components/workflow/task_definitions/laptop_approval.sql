prompt --application/shared_components/workflow/task_definitions/laptop_approval
begin
--   Manifest
--     TASK_DEF: Laptop Approval
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
 p_id=>wwv_flow_imp.id(1257701302371964080)
,p_name=>'Laptop Approval'
,p_static_id=>'LAPTOP_APPROVAL'
,p_subject=>'&LAPTOP_TYPE. Laptop Request for &ENAME.'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_due_on_interval=>'FREQ=MINUTELY;INTERVAL=2'
,p_expiration_policy=>'RENEW'
,p_max_renewal_count=>2
,p_due_on_type=>'SCHEDULER_EXPRESSION'
,p_details_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case laptop_type when ''MAC'' then ''MacBook Pro'' when ''WIN'' then ''Lenovo T490'' end as laptop_type,',
'       apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'') as demo_notification_email ',
'from eba_demo_appr_laptop_requests lr',
'left outer join eba_demo_appr_emp e on e.empno = lr.empno',
'where lr.id = :APEX$TASK_PK'))
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(1257766093220115970)
,p_task_def_id=>wwv_flow_imp.id(1257701302371964080)
,p_name=>'Before Expire: Send Reminder Email to Approver'
,p_execution_sequence=>30
,p_before_expire_interval=>'PT1M'
,p_on_event=>'BEFORE_EXPIRE'
,p_action_type=>'NATIVE_SEND_EMAIL'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'&DEMO_NOTIFICATION_EMAIL.'
,p_attribute_06=>'Laptop Request for &ENAME. Requires Your Review'
,p_attribute_07=>'Hi &APEX$TASK_OWNER., please check your "My Approvals" inbox. The laptop request for &ENAME. requires your review and will expire shortly and be assigned to a colleague if you are unable to review it in a timely manner. Thanks for your kind attention'
||' to this matter.'
,p_attribute_08=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Hi &APEX$TASK_OWNER., please check your "My Approvals" inbox. The laptop request for &ENAME. requires your review ',
'    and will expire shortly and be assigned to a colleague if you are unable to review it in a',
'    timely manner. Thanks for your kind attention to this matter.</p>'))
,p_attribute_10=>'N'
,p_attribute_14=>'HTML'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>'apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'') is not null'
,p_condition_expr2=>'PLSQL'
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(1257768464234142756)
,p_task_def_id=>wwv_flow_imp.id(1257701302371964080)
,p_name=>'Push Email Queue for Sample'
,p_execution_sequence=>40
,p_before_expire_interval=>'PT1M'
,p_on_event=>'BEFORE_EXPIRE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>'apex_mail.push_queue;'
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
,p_condition_type=>'ITEM_IS_NOT_NULL'
,p_condition_expr1=>'DEMO_NOTIFICATION_EMAIL'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(1257756151408981496)
,p_task_def_id=>wwv_flow_imp.id(1257701302371964080)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(1257756583979981496)
,p_task_def_id=>wwv_flow_imp.id(1257701302371964080)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.get_laptop_approver(:APEX$TASK_RENEWAL_COUNT)'
);
wwv_flow_imp.component_end;
end;
/
