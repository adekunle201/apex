prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(332202378473678706)
,p_name=>'EMP_APPRAISAL_EXTRA_VP_REVIEWERS'
,p_is_required=>'N'
,p_version_scn=>3063296
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(332205262824882110)
,p_name=>'TEMPORARY_BUSINESS_ADMIN'
,p_is_required=>'N'
,p_version_scn=>3063306
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(1175435636599168743)
,p_name=>'DEMO_NOTIFICATION_EMAIL'
,p_is_required=>'N'
,p_version_scn=>37166426849919
);
wwv_flow_imp.component_end;
end;
/
