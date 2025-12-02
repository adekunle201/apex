prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Request Employee Appraisal '
,p_alias=>'REQUEST-EMPLOYEE-APPRAISAL'
,p_page_mode=>'MODAL'
,p_step_title=>'Request Appraisal for'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.ui-dialog-title'', ',
'   parent ? parent.document ',
'          : document).text(',
'             ''Request Appraisal for '' + ',
'             apex.items.P16_ENAME.value );',
'',
'apex.items.P16_APPRAISAL_DATE.dayFormatter = function (pDateISOString) {',
'  const day = apex.date.parse(pDateISOString, "YYYY-MM-DD").getDay();',
'  return {',
'      // disable when day is Saturday or Sunday',
'      disabled: [0, 6].includes(day),',
'      // set a styling css class like u-danger-text',
'      class: null,',
'      // set a tooltip that is shown on hover',
'      tooltip: null',
'  };',
'};',
'apex.items.P16_APPRAISAL_DATE.refresh();             '))
,p_inline_css=>'.a-DatePicker { flex-grow: 1; }'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1835977586305887717)
,p_plug_name=>'Request Appraisal Input'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_APPRAISALS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1835984137074887745)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1222450370582764986)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1835984137074887745)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1222450717695764986)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1835984137074887745)
,p_button_name=>'SUBMIT_APPRAISAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221154015172251835)
,p_name=>'P16_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_source_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221154149494251836)
,p_name=>'P16_PERIOD_START'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_source_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_default=>'add_months( last_day(sysdate) , -13) +1'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PERIOD_START'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221154221699251837)
,p_name=>'P16_PERIOD_END'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_source_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_default=>'add_months( last_day(sysdate) , -1) '
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PERIOD_END'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221154333975251838)
,p_name=>'P16_APPRAISAL_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_source_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_default=>'sysdate + 14'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Appraisal Date'
,p_source=>'APPRAISAL_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_row_css_classes=>'u-align-items-center'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'INLINE',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1493591759523442857)
,p_name=>'P16_APPRAISAL_PERIOD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_prompt=>'Appraisal Period'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1493592413445442864)
,p_name=>'P16_ENAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1835978488676887730)
,p_name=>'P16_EMPNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_item_source_plug_id=>wwv_flow_imp.id(1835977586305887717)
,p_source=>'EMPNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1493592523103442865)
,p_computation_sequence=>10
,p_computation_item=>'P16_ENAME'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename',
'from eba_demo_appr_emp',
'where empno = :P16_EMPNO'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1222453437040764993)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1222450370582764986)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1222453904529764994)
,p_event_id=>wwv_flow_imp.id(1222453437040764993)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1222449658162764985)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1835977586305887717)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form RequestAppraisal Input'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>578519570520331552
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1222452182819764991)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WORKFLOW'
,p_process_name=>'Start Employee Appraisal Workflow'
,p_attribute_01=>'START'
,p_attribute_02=>wwv_flow_imp.id(1493593553552442875)
,p_attribute_03=>'P16_ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1222450717695764986)
,p_internal_uid=>578522095177331558
);
wwv_flow_imp_shared.create_workflow_comp_param(
 p_id=>wwv_flow_imp.id(1513818380120464345)
,p_page_process_id=>wwv_flow_imp.id(1222452182819764991)
,p_workflow_variable_id=>wwv_flow_imp.id(1513818203528464344)
,p_page_id=>16
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':P16_ENAME ||'' (''|| :P16_APPRAISAL_PERIOD ||'')'''
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1222453061135764992)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SUBMIT_APPRAISAL,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>578522973493331559
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1222449246484764984)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1835977586305887717)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Request Salary Change'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>578519158842331551
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1493591832255442858)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Compute Appraisal Period'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EBA_DEMO_APPR'
,p_attribute_04=>'APPRAISAL_PERIOD'
,p_internal_uid=>849661744613009425
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1493591948105442859)
,p_page_process_id=>wwv_flow_imp.id(1493591832255442858)
,p_page_id=>16
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P16_APPRAISAL_PERIOD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1493592251113442862)
,p_page_process_id=>wwv_flow_imp.id(1493591832255442858)
,p_page_id=>16
,p_name=>'p_start_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P16_PERIOD_START'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1493592331297442863)
,p_page_process_id=>wwv_flow_imp.id(1493591832255442858)
,p_page_id=>16
,p_name=>'p_end_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P16_PERIOD_END'
);
wwv_flow_imp.component_end;
end;
/
