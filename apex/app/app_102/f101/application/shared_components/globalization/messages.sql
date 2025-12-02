prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(331715491309899350)
,p_name=>'SUBSTITUTE_SAME_AS_ORIGINAL'
,p_message_text=>'The substitute user must be different from the original user.'
,p_version_scn=>738875874
);
wwv_flow_imp.component_end;
end;
/
