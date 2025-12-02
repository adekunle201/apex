prompt --application/pages/page_00029
begin
--   Manifest
--     PAGE: 00029
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
 p_id=>29
,p_name=>'Appraisal History'
,p_alias=>'APPRAISAL-HISTORY'
,p_step_title=>'Appraisal History'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1507169331658601173)
,p_name=>'Appraisal History'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with reports as (',
'    select empno',
'        from (',
'            select empno, ename',
'              from eba_demo_appr_emp',
'              start with empno = :CURRENT_USER_EMPNO',
'              connect by prior empno = mgr',
'        )',
'    where empno != :CURRENT_USER_EMPNO',
')',
'select a.id,',
'       e.ename,',
'       eba_demo_appr.appraisal_period(a.period_start,a.period_end) as appraisal_period,',
'       a.appraisal_date,',
'       a.input_completed,',
'       a.manager_completed,',
'       a.vp_review_date,',
'       case a.status',
'          when ''ORIGINATED''    then ''Awaiting employee self-evaluation''',
'          when ''SUBMITTED''     then ''Awaiting manager evaluation''',
'          when ''MGR_SUBMITTED'' then ''Awaiting VP review''',
'          when ''VP_REVIEWED''   then ''VP Reviewed''',
'          when ''COMPLETED''     then ''Completed''',
'       end as status',
'from eba_demo_appr_appraisals a',
'left join eba_demo_appr_emp e on e.empno = a.empno',
'where (nvl(:P29_SHOW_FOR_SUBORDINATES,''N'') = ''N'' and a.empno = :CURRENT_USER_EMPNO)',
'      or',
'      (nvl(:P29_SHOW_FOR_SUBORDINATES,''N'') = ''Y'' and a.empno in (select empno from reports))',
'order by date_originated desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P29_SHOW_FOR_SUBORDINATES'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No appraisals yet.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1513817317767464335)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1513817721586464339)
,p_query_column_id=>2
,p_column_alias=>'ENAME'
,p_column_display_sequence=>10
,p_column_heading=>'Employee'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_condition=>'P29_SHOW_FOR_SUBORDINATES'
,p_display_when_condition2=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1507169477311601174)
,p_query_column_id=>3
,p_column_alias=>'APPRAISAL_PERIOD'
,p_column_display_sequence=>20
,p_column_heading=>'Period'
,p_column_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::P17_ID:#ID#'
,p_column_linktext=>'#APPRAISAL_PERIOD#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1507169510443601175)
,p_query_column_id=>4
,p_column_alias=>'APPRAISAL_DATE'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Appraisal\00A0Date')
,p_column_format=>'DD-MON-YYYY HH24:MI:SS'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1507169667012601176)
,p_query_column_id=>5
,p_column_alias=>'INPUT_COMPLETED'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Input\00A0Completed')
,p_column_format=>'DD-MON-YYYY HH24:MI:SS'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1507169736071601177)
,p_query_column_id=>6
,p_column_alias=>'MANAGER_COMPLETED'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Manager\00A0Completed')
,p_column_format=>'DD-MON-YYYY HH24:MI:SS'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1507169837981601178)
,p_query_column_id=>7
,p_column_alias=>'VP_REVIEW_DATE'
,p_column_display_sequence=>60
,p_column_heading=>unistr('VP\00A0Reviewed')
,p_column_format=>'DD-MON-YYYY HH24:MI:SS'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1507169902715601179)
,p_query_column_id=>8
,p_column_alias=>'STATUS'
,p_column_display_sequence=>70
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1513817827823464340)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(1253911714754917774)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4748082913773466701)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page shows employee appraisal history for the logged-in user. If the current user',
'    is a manager, they can flip the switch to see the employee appraisal history of their',
'    subordinates.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1513817394538464336)
,p_name=>'P29_SHOW_FOR_SUBORDINATES'
,p_item_sequence=>10
,p_item_default=>'N'
,p_prompt=>unistr('Show\00A0for\00A0Subordinates?')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select empno',
'from eba_demo_appr_emp',
'where mgr = :CURRENT_USER_EMPNO',
'fetch first row only'))
,p_display_when_type=>'EXISTS'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1513817564765464337)
,p_name=>'When Subordinates Switched'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P29_SHOW_FOR_SUBORDINATES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1513817592478464338)
,p_event_id=>wwv_flow_imp.id(1513817564765464337)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Appraisal History'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1507169331658601173)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
