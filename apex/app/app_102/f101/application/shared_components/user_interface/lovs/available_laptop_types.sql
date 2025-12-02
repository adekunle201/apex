prompt --application/shared_components/user_interface/lovs/available_laptop_types
begin
--   Manifest
--     AVAILABLE_LAPTOP_TYPES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1260931800047437892)
,p_lov_name=>'AVAILABLE_LAPTOP_TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(1260931800047437892)||'.'
,p_location=>'STATIC'
,p_version_scn=>738866192
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1260932147236437893)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'MacBook Pro 14"'
,p_lov_return_value=>'MAC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1260932562678437893)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Lenovo T490'
,p_lov_return_value=>'WIN'
);
wwv_flow_imp.component_end;
end;
/
