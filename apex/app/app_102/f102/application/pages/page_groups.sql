prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'CICD'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(2410612631180475)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
