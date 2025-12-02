prompt --application/shared_components/logic/application_computations/p29_show_for_subordinates
begin
--   Manifest
--     APPLICATION COMPUTATION: P29_SHOW_FOR_SUBORDINATES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(1516068290990377735)
,p_computation_sequence=>10
,p_computation_item=>'P29_SHOW_FOR_SUBORDINATES'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'null'
,p_version_scn=>37166357216470
);
wwv_flow_imp.component_end;
end;
/
