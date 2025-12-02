prompt --application/deployment/install/install_droptables
begin
--   Manifest
--     INSTALL: INSTALL-DropTables
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
 p_id=>wwv_flow_imp.id(960689676160932318)
,p_install_id=>wwv_flow_imp.id(1266119789670636890)
,p_name=>'DropTables'
,p_sequence=>1
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_tables_to_drop apex_t_varchar2 := apex_t_varchar2(''eba_demo_appr_laptop_requests'',',
'                                                        ''eba_demo_appr_laptop_stock'',',
'                                                        ''eba_demo_appr_sal_history'',',
'                                                        ''eba_demo_appr_emp'',',
'                                                        ''eba_demo_appr_dept'',',
'                                                        ''eba_demo_appr_approvers'',',
'                                                        ''eba_demo_appr_appraisals'',',
'                                                        ''eba_demo_appr_vacation'');',
'',
'begin',
'    for j in 1..l_tables_to_drop.count loop',
'        begin',
'            execute immediate apex_string.format(''drop table %s cascade constraints'',l_tables_to_drop(j));',
'        exception',
'            when others then',
'                if sqlcode != -942 then',
'                    raise;',
'                end if;',
'        end;',
'    end loop;',
'end;   ',
'/'))
);
wwv_flow_imp.component_end;
end;
/
