prompt --application/shared_components/workflow/task_definitions/bank_account_change
begin
--   Manifest
--     TASK_DEF: Bank Account Change
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
 p_id=>wwv_flow_imp.id(329683491903084982)
,p_name=>'Bank Account Change'
,p_static_id=>'BANK_ACCOUNT_CHANGE'
,p_subject=>'Bank Account Change for &INITCAP_ENAME. from &BANK_ACCOUNT. to &P_NEW_BANK_ACCOUNT.'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename, bank_account, initcap(ename) as initcap_ename',
'from eba_demo_appr_emp',
'where empno = :APEX$TASK_PK'))
,p_initiator_can_complete=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(329684408008104520)
,p_task_def_id=>wwv_flow_imp.id(329683491903084982)
,p_label=>'New Bank Account'
,p_static_id=>'P_NEW_BANK_ACCOUNT'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(329686359129193182)
,p_task_def_id=>wwv_flow_imp.id(329683491903084982)
,p_name=>'On Approve'
,p_execution_sequence=>10
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>'update eba_demo_appr_emp set bank_account = :P_NEW_BANK_ACCOUNT where empno = :APEX$TASK_PK;'
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_success_message=>'Bank Account change approved'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(329684788356176417)
,p_task_def_id=>wwv_flow_imp.id(329683491903084982)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'STEVE,BO,JANE'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(329685084396176417)
,p_task_def_id=>wwv_flow_imp.id(329683491903084982)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(329685491585176417)
,p_task_def_id=>wwv_flow_imp.id(329683491903084982)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':APEX$TASK_INITIATOR'
);
wwv_flow_imp.component_end;
end;
/
