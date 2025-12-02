prompt --application/shared_components/user_interface/lovs/approval_task_lov
begin
--   Manifest
--     APPROVAL_TASK_LOV
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
 p_id=>wwv_flow_imp.id(1267807040865073951)
,p_lov_name=>'APPROVAL_TASK_LOV'
,p_lov_query=>'select name,static_id from apex_appl_taskdefs where application_id = :APP_ID'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'STATIC_ID'
,p_display_column_name=>'NAME'
,p_default_sort_column_name=>'NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>738866192
);
wwv_flow_imp.component_end;
end;
/
