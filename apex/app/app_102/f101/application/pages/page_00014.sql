prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_page.create_page(
 p_id=>14
,p_name=>'More Information'
,p_alias=>'MORE-INFORMATION'
,p_step_title=>'More Information'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.is-markdownified code {',
'   background-color: inherit !important;',
'   border-style: none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1178612130481098358)
,p_plug_name=>'More Information'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    The <em>Sample Workflow, Approvals, and Tasks</em> app illustrates',
'    the key functionality of the Oracle APEX Workflow, Approvals, and Tasks components. ',
'    It lets users manage requests to change an employee''s salary, job, and bank acount,',
'    as well as request a new laptop, after getting the approval of an appropriate individual. ',
'    Managers can also initiate a subordinate''s appraisal process.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1178612277118098359)
,p_plug_name=>'Sample Application'
,p_parent_plug_id=>wwv_flow_imp.id(1178612130481098358)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'AboutTheSampleApplication.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1182837755555619810)
,p_plug_name=>'Approvals and Tasks Features'
,p_parent_plug_id=>wwv_flow_imp.id(1178612130481098358)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'AboutTheApprovalsFeature.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1524037111230448443)
,p_plug_name=>'Workflow Features'
,p_parent_plug_id=>wwv_flow_imp.id(1178612130481098358)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'AboutTheWorkflowFeature.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1524039444759448466)
,p_plug_name=>'Using the Sample'
,p_parent_plug_id=>wwv_flow_imp.id(1178612130481098358)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'UsingTheSample.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1182837136541619808)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(1253911714754917774)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp.component_end;
end;
/
