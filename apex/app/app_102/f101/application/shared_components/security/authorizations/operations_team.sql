prompt --application/shared_components/security/authorizations/operations_team
begin
--   Manifest
--     SECURITY SCHEME: Operations Team
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1254109290491918041)
,p_name=>'Operations Team'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_demo_appr_emp',
'where ename = :APP_USER',
'and deptno  = 40 /* OPERATIONS */'))
,p_error_message=>'Insufficient privileges, user is not on the Operations team'
,p_version_scn=>738866192
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
