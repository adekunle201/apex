prompt --application/shared_components/user_interface/lovs/eba_demo_conf_emp_lov
begin
--   Manifest
--     EBA_DEMO_CONF_EMP_LOV
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
 p_id=>wwv_flow_imp.id(1293541748035463493)
,p_lov_name=>'EBA_DEMO_CONF_EMP_LOV'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'EBA_DEMO_APPR_EMP'
,p_return_column_name=>'EMPNO'
,p_display_column_name=>'ENAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ENAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>738866194
);
wwv_flow_imp.component_end;
end;
/
