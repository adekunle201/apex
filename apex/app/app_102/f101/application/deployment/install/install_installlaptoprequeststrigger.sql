prompt --application/deployment/install/install_installlaptoprequeststrigger
begin
--   Manifest
--     INSTALL: INSTALL-InstallLaptopRequestsTrigger
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(1526537637131058723)
,p_install_id=>wwv_flow_imp.id(1266119789670636890)
,p_name=>'InstallLaptopRequestsTrigger'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger "EBA_DEMO_APPR_LAPTOP_REQUESTS_T"',
'before',
'update on "EBA_DEMO_APPR_LAPTOP_REQUESTS"',
'for each row',
'begin',
'    if :old.delivered_date is null and :new.delivered_date is not null then',
'        eba_demo_appr.laptop_delivered(:new.id);',
'    end if;',
'end;',
'/ '))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(1526543133509108134)
,p_script_id=>wwv_flow_imp.id(1526537637131058723)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'EBA_DEMO_APPR_LAPTOP_REQUESTS_T'
);
wwv_flow_imp.component_end;
end;
/
