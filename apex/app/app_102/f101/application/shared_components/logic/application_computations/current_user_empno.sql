prompt --application/shared_components/logic/application_computations/current_user_empno
begin
--   Manifest
--     APPLICATION COMPUTATION: CURRENT_USER_EMPNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(1513831398516556496)
,p_computation_sequence=>10
,p_computation_item=>'CURRENT_USER_EMPNO'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select empno',
'  from eba_demo_appr_emp',
' where ename = :APP_USER'))
,p_version_scn=>37166355852589
);
wwv_flow_imp.component_end;
end;
/
