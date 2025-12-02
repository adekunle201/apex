prompt --application/shared_components/user_interface/lovs/distinct_job_codes_lov
begin
--   Manifest
--     DISTINCT_JOB_CODES_LOV
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
 p_id=>wwv_flow_imp.id(1269631100227682593)
,p_lov_name=>'DISTINCT_JOB_CODES_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select job dv, job rv',
'from (',
'    select distinct job from eba_demo_appr_emp',
')',
'order by job'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'RV'
,p_display_column_name=>'DV'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DV'
,p_default_sort_direction=>'ASC'
,p_version_scn=>738866194
);
wwv_flow_imp.component_end;
end;
/
