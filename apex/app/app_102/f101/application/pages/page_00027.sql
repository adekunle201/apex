prompt --application/pages/page_00027
begin
--   Manifest
--     PAGE: 00027
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
 p_id=>27
,p_name=>'Workflow Debug Messages'
,p_alias=>'WORKFLOW-DEBUG-MESSAGES'
,p_step_title=>'Workflow Debug Messages'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(1254109290491918041)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1510224945602920240)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1510225650028920241)
,p_plug_name=>'Workflow Debug Messages'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select message_timestamp,',
'       elapsed_time,',
'       execution_time,',
'       message,',
'       page_id,',
'       workflow_instance_id,',
'       session_id,',
'       message_level,',
'       trim(replace(call_stack,''%'')) as call_stack',
' from apex_debug_messages',
'where application_id = :APP_ID',
'and apex_user = ''nobody''',
'and call_stack like ''%\%WORKFLOW.%'' escape ''\''',
'and message_level < 9',
'order by message_timestamp desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Workflow Debug Messages'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1510225720410920241)
,p_name=>'Workflow Debug Messages'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'STEVE'
,p_internal_uid=>866295632768486808
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510226956618920247)
,p_db_column_name=>'MESSAGE_TIMESTAMP'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510227370948920247)
,p_db_column_name=>'ELAPSED_TIME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510227711454920248)
,p_db_column_name=>'EXECUTION_TIME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Execution'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510228173820920248)
,p_db_column_name=>'MESSAGE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Message'
,p_column_html_expression=>'<code>#MESSAGE#</code>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510228917851920249)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510229289207920249)
,p_db_column_name=>'WORKFLOW_INSTANCE_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>unistr('Instance\00A0Id')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510229730707920250)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>unistr('Session\00A0Id')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510230498726920251)
,p_db_column_name=>'MESSAGE_LEVEL'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>unistr('Message\00A0Level')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1510231378879920252)
,p_db_column_name=>'CALL_STACK'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>unistr('Call\00A0Stack')
,p_column_html_expression=>'<code>#CALL_STACK#</code>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1510234613780943839)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8663046'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MESSAGE_TIMESTAMP:MESSAGE:WORKFLOW_INSTANCE_ID:SESSION_ID:CALL_STACK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5611726256797964064)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page is handy for debugging purposes to show APEX debug messages related to ',
'    workflows from the current application. To enable more verbose debug logging for one',
'    of the sample''s workflow, you can set the <em>Debug Level</em> property on its workflow',
'    version, or use the <code>set_log_level</code> procedure in the <code>APEX_WORKFLOWS</code>',
'    package. Since the APEX workflow engine works in the background, using a distinct APEX',
'    session from the end-user running the user interface of your application, some debug',
'    messages related to workflows will not appear in the usual debug log window, but they are',
'    logged in the <code>APEX_DEBUG_MESSAGES</code> view, which the report region in this page',
'    is using to show its contents. ',
'</p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
