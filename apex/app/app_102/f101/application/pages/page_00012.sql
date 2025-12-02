prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Pending Approvals'
,p_alias=>'PENDING-APPROVALS'
,p_step_title=>'Pending Approvals'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([',
'{',
'  name: "handle-task-deadlines-action",',
'  action: function( event, element, args)',
'  {',
'    // Trigger custom event to perform the server-side call',
'    $("body").trigger("handle-task-deadlines-event");',
'  }',
'},',
'{',
'  name: "refresh-action",',
'  action: function( event, element, args)',
'  {',
'    // Trigger custom event to perform the refresh',
'    $("body").trigger("refresh-event");',
'  }',
'}',
'])'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(960891912836898950)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(960892563841898966)
,p_name=>'Pending Approvals'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'margin-top-md'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.task_id, ',
'       t.subject,',
'       t.priority,',
'       t.initiator,',
'       case ',
'            when t.state_code = ''ASSIGNED'' then ',
'                t.state||'' to ''||t.actual_owner',
'            when t.state_code = ''UNASSIGNED'' then ',
'                t.state||'' (''||eba_demo_appr.approvers_for_task(t.task_id)||'')''',
'            when t.state_code = ''EXPIRED'' then',
'                ''Expired after ''||',
unistr('                (select listagg(t3.actual_owner,''\2190'')'),
'                   from apex_tasks t3',
'                   connect by prior t3.previous_task_id = t3.task_id',
'                   start with t3.task_id = t.task_id)',
'        end status,',
'        eba_demo_appr.admins_for_task(t.task_id) as admins,',
'        t.due_on due_by,',
'        eba_demo_appr.details_task_url(',
'          p_url     => d.details_link_target,',
'          p_app_id  => d.application_id,',
'          p_task_id => t.task_id) details_link_target,',
'       due_in, ',
'       case ',
'          when due_in_hours <   0 then ''OVERDUE''',
'          when due_in_hours <   1 then ''NEXT_HOUR''',
'          when due_in_hours <  24 then ''NEXT_24_HOURS''',
'          when due_in_hours < 168 then ''NEXT_7_DAYS''',
'          when due_in_hours < 720 then ''NEXT_30_DAYS''',
'          else            ''MORE_THAN_30_DAYS''',
'      end due_code,',
'      case when state_code in (''COMPLETED'', ''CANCELED'') ',
'                                               then ''Y''',
'                                               else ''N''',
'                                          end is_completed         ',
'from (',
'select task_id,',
'       task_def_id,',
'       subject,',
'       priority,',
'       initiator,',
'       actual_owner,',
'       due_on,',
'       apex_util.get_since(due_on) due_in,',
'       round((cast(due_on as date) - sysdate) * 24, 1) due_in_hours,',
'       state_code,',
'       state,',
'       task_type_code,',
'       application_id',
'       from apex_Tasks',
') t',
'left join apex_appl_taskdefs d on d.task_def_id = t.task_def_id',
'where t.application_id = :APP_ID',
'  and t.task_type_code = ''APPROVAL''',
'  and (',
'        (t.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'      or',
'      (',
'          t.state_code = ''EXPIRED'' ',
'           and not exists (select 1 ',
'                             from apex_tasks t2 ',
'                            where previous_task_id = t.task_id)',
'      )',
'      ))',
'order by due_by'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No pending approvals'
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
 p_id=>wwv_flow_imp.id(960892895988898982)
,p_query_column_id=>1
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(960662040535713445)
,p_query_column_id=>2
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>11
,p_column_heading=>'Subject'
,p_column_link=>'#DETAILS_LINK_TARGET#'
,p_column_linktext=>'#SUBJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(960662133814713446)
,p_query_column_id=>3
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>21
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1524037835579448450)
,p_query_column_id=>4
,p_column_alias=>'INITIATOR'
,p_column_display_sequence=>31
,p_column_heading=>'Requester'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(960662269405713447)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>41
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1178611599633098353)
,p_query_column_id=>6
,p_column_alias=>'ADMINS'
,p_column_display_sequence=>51
,p_column_heading=>'Admins'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(960662448262713449)
,p_query_column_id=>7
,p_column_alias=>'DUE_BY'
,p_column_display_sequence=>61
,p_column_heading=>'Due'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if !IS_COMPLETED/}',
'    {case DUE_CODE/}',
'        {when OVERDUE/}',
'            <strong class="u-danger-text">#DUE_IN#</strong>',
'        {when NEXT_HOUR/}',
'            <strong class="u-danger-text">#DUE_IN#</strong>',
'        {when NEXT_24_HOURS/}',
'            <span class="u-danger-text">#DUE_IN#</span>',
'        {otherwise/}',
'            {if DUE_IN/}<span>#DUE_IN#</span>{endif/}',
'    {endcase/}',
'{endif/} '))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1158624513361716436)
,p_query_column_id=>8
,p_column_alias=>'DETAILS_LINK_TARGET'
,p_column_display_sequence=>71
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1524037904511448451)
,p_query_column_id=>9
,p_column_alias=>'DUE_IN'
,p_column_display_sequence=>91
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1524038038569448452)
,p_query_column_id=>10
,p_column_alias=>'DUE_CODE'
,p_column_display_sequence=>101
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1524038179672448453)
,p_query_column_id=>11
,p_column_alias=>'IS_COMPLETED'
,p_column_display_sequence=>111
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1524037227588448444)
,p_plug_name=>'Handle Deadlines and Refresh'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'An hourly job handles task deadlines, but you can ',
'<a href="#action$handle-task-deadlines-action">handle them now</a>',
'or just',
'<a href="#action$refresh-action">update the list</a>.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3862261450711476441)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page is handy for demo purposes since it shows the relevant approvers and administrators',
'    determined at task creation time for each pending approval task. Use this information',
'    to know which sample user to log in as to approve or administer a given approval task. ',
'</p>',
'<ul>',
'    <li>',
'        The Job Change approval task definition configures its participants at design time.',
'    </li>',
'    <li>',
'        The Salary Change approval task definition dynamically computes its participants at',
'        runtime by calling a PL/SQL function that uses the rows in the EBA_DEMO_APPR_APPROVERS',
'        table to determine the approvers and administrators based on the job code of',
'        the employee changing roles as well as the proposed new salary.',
'    </li>',
'    <li>',
'        The <em>Laptop Approval</em> approval task definition dynamically computes its participants at',
'        runtime by calling a PL/SQL function that uses the number of times the task has been',
'        renewed to determine to whom to assign it.',
'    </li>',
'</ul>',
'<p>',
'    Since by design the same user cannot approve an approval task they initiated, even if the',
'    current user <em>would</em> technically be a valid "potential owner" participant, their',
'    username won''t appear as an approver on a job or salary request they created.',
'</p>',
'<p>',
'    This page''s classic report region queries data from <strong>APEX_TASKS</strong>, ',
'    <strong>APEX_TASK_PARTICIPANTS</strong>, and ',
'    <strong>APEX_APPL_TASKDEFS</strong> views. It filters the list to only include approval',
'    tasks using the WHERE clause <code>TASK_TYPE_CODE = ''APPROVAL''</code>. Most applications ',
'    using approvals would typically only need one or more of the unified task list pages to allow',
'    end users to work with tasks. This sample includes <strong>My Tasks</strong>, ',
'    <strong>My Requests</strong>, and <strong>Approvals Administration</strong>',
'    unified task list pages for that purpose.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1524037293197448445)
,p_name=>'Handle Task Deadlines'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'handle-task-deadlines-event'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1524037464202448446)
,p_event_id=>wwv_flow_imp.id(1524037293197448445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Handle Task Deadlines'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_approval.handle_task_deadlines;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1524037487935448447)
,p_event_id=>wwv_flow_imp.id(1524037293197448445)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Pending Approvals'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(960892563841898966)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1524037684467448448)
,p_name=>'Refresh Approvals List'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'refresh-event'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1524037713119448449)
,p_event_id=>wwv_flow_imp.id(1524037684467448448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Pending Approvals'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(960892563841898966)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1524039535979448467)
,p_name=>'When Dialog Closed'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(960892563841898966)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1524039601516448468)
,p_event_id=>wwv_flow_imp.id(1524039535979448467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(960892563841898966)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
