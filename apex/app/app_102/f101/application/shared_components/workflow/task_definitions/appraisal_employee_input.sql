prompt --application/shared_components/workflow/task_definitions/appraisal_employee_input
begin
--   Manifest
--     TASK_DEF: Appraisal - Employee Input
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
 p_id=>wwv_flow_imp.id(1224376168439769092)
,p_name=>'Appraisal - Employee Input'
,p_static_id=>'APPRAISAL_EMPLOYEE_INPUT'
,p_subject=>'Your Appraisal - please complete your self review'
,p_task_type=>'ACTION'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_TASK_ID:&TASK_ID.'
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(1224378819105793328)
,p_task_def_id=>wwv_flow_imp.id(1224376168439769092)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.get_appraisal_participant(:APEX$TASK_PK)'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(1224379276377793329)
,p_task_def_id=>wwv_flow_imp.id(1224376168439769092)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp.component_end;
end;
/
