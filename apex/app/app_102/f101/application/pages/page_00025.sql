prompt --application/pages/page_00025
begin
--   Manifest
--     PAGE: 00025
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
 p_id=>25
,p_name=>'Pending Actions'
,p_alias=>'PENDING-ACTIONS'
,p_step_title=>'Pending Appraisals'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1513818184432464343)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(1253911714754917774)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1823698041373199893)
,p_name=>'Pending Actions'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.task_id, ',
'       t.subject,',
'       t.priority,',
'       case ',
'            when t.state_code = ''ASSIGNED'' then ',
'                t.state||'' to ''||t.actual_owner',
'            when t.state_code = ''UNASSIGNED'' then ',
'                t.state||'' (''||eba_demo_appr.approvers_for_task(t.task_id)||'')''',
'        end status,',
'        eba_demo_appr.admins_for_task(t.task_id) as admins,',
'        t.due_on due_by',
'from apex_tasks t',
'left join apex_appl_taskdefs d on d.task_def_id = t.task_def_id',
'where t.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'and t.task_type_code = ''ACTION''',
'and t.application_id = :APP_ID',
'order by due_by'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No pending actions'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1506736900878734374)
,p_query_column_id=>1
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1506737377688734375)
,p_query_column_id=>2
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>11
,p_column_heading=>'Subject'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1506737693876734376)
,p_query_column_id=>3
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>21
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1506738175921734376)
,p_query_column_id=>4
,p_column_alias=>'STATUS'
,p_column_display_sequence=>31
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1506738564971734376)
,p_query_column_id=>5
,p_column_alias=>'ADMINS'
,p_column_display_sequence=>41
,p_column_heading=>'Admins'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1506738898627734377)
,p_query_column_id=>6
,p_column_alias=>'DUE_BY'
,p_column_display_sequence=>51
,p_column_heading=>'Due By'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4725066928242777368)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page is handy for demo purposes since it shows the relevant assignees and administrators',
'    determined at task creation time for each pending action task. Use this information',
'    to know which sample user to log in as to complete or administer a given action task. The',
'    three action tasks below each dynamically computes its assignee at runtime by calling a',
'    PL/SQL function that uses the primary key of the EBA_DEMO_APPR_APPRAISALS table, passed in',
'    using the bind variable <code>:APEX$TASK_PK</code>, to return the following usernames related',
'    to the employee to whom the appraisal pertains:',
'</p>',
'<ul>',
'    <li>',
'        the employee themselves, for the <em>Appraisal - Employee Input</em> action task,',
'    </li>',
'    <li>',
'        the manager of the employee, for the <em>Appraisal - Manager Input</em> action task, and',
'    </li>',
'    <li>',
'        the second-level manager of the employee (or null if none exists), for the  <em>Appraisal - VP Review</em> action task.',
'    </li>         ',
'</ul>',
'<p>',
'    This page''s classic report region queries data from <strong>APEX_TASKS</strong>, ',
'    <strong>APEX_TASK_PARTICIPANTS</strong>, and ',
'    <strong>APEX_APPL_TASKDEFS</strong> views. It filters the list to only include action',
'    tasks using the WHERE clause <code>TASK_TYPE_CODE = ''ACTION''</code>. Most applications ',
'    using approvals would typically only need one or more of the unified task list pages to allow',
'    end users to work with tasks. This sample includes <strong>My Tasks</strong>, ',
'    <strong>My Requests</strong>, and <strong>Task Administration</strong>',
'    unified task list pages for that purpose.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp.component_end;
end;
/
