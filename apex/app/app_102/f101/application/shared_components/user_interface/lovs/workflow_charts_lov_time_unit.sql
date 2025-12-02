prompt --application/shared_components/user_interface/lovs/workflow_charts_lov_time_unit
begin
--   Manifest
--     WORKFLOW_CHARTS.LOV.TIME_UNIT
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
 p_id=>wwv_flow_imp.id(13959209202357618)
,p_lov_name=>'WORKFLOW_CHARTS.LOV.TIME_UNIT'
,p_lov_query=>'.'||wwv_flow_imp.id(13959209202357618)||'.'
,p_location=>'STATIC'
,p_version_scn=>813923021
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(13959451076357619)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Seconds'
,p_lov_return_value=>'SEC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(13959917879357622)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Minutes'
,p_lov_return_value=>'MIN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(13960324704357623)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Hours'
,p_lov_return_value=>'HOUR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(13960692586357623)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Days'
,p_lov_return_value=>'DAY'
);
wwv_flow_imp.component_end;
end;
/
