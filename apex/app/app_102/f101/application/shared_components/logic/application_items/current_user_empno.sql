prompt --application/shared_components/logic/application_items/current_user_empno
begin
--   Manifest
--     APPLICATION ITEM: CURRENT_USER_EMPNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(1513830939894548979)
,p_name=>'CURRENT_USER_EMPNO'
,p_protection_level=>'I'
,p_version_scn=>37166355847850
);
wwv_flow_imp.component_end;
end;
/
