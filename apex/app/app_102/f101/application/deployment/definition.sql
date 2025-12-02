prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(1266119789670636890)
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DROP TABLE EBA_DEMO_APPR_EMP CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_DEPT CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_APPROVERS CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_LAPTOP_REQUESTS CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_LAPTOP_STOCK CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_APPRAISALS CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_SAL_HISTORY CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_VACATION CASCADE CONSTRAINTS;',
'DROP PACKAGE EBA_DEMO_APPR;',
'DROP PACKAGE EBA_DEMO_APPR_DATA;'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
wwv_flow_imp.component_end;
end;
/
