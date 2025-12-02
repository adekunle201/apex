prompt --application/shared_components/files/app_css
begin
--   Manifest
--     APP STATIC FILES: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A2050726576656E74206361726420726567696F6E732066726F6D20666C617368696E6720696E697469616C20726F77206F6620656D707479206361726473206265666F72652064617461206C6F6164202A2F0D0A2E6E6F2D616E696D202E612D4361';
wwv_flow_imp.g_varchar2_table(2) := '7264566965772D6974656D203E20646976207B0D0A20202020646973706C61793A206E6F6E653B0D0A7D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1257481584974692574)
,p_file_name=>'app.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
