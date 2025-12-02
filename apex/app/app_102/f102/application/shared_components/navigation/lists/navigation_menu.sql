prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(2405830706180198)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>3131418
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2417293080180614)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
