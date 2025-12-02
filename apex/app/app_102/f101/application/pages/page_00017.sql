prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_name=>'Employee Self Review Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Employee Self Review Details'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_read_only_when_type=>'EXPRESSION'
,p_read_only_when=>':P17_APPRAISAL_ID_PROVIDED = ''Y'' or :P17_EXPECTING_INPUT_FROM != :APP_USER'
,p_read_only_when2=>'PLSQL'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1221156371250251858)
,p_plug_name=>'Employee Self Review'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>110
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_APPRAISALS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P17_TASK_ID,',
'    p_operation => apex_approval.c_task_op_claim )'))
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1225326080175859235)
,p_plug_name=>'Subject'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_result clob;',
'begin',
'    select to_clob(replace(replace(replace(''',
'            <div class="a-CardView has-title has-badge">',
'              <div class="a-CardView-header">',
'                <div class="a-CardView-headerBody">',
'                  <h3 class="a-CardView-title">#SUBJECT#</h3>',
'                </div>',
'                <div class="a-CardView-badge #BADGE_CSS_CLASSES#" title="#BADGE_TEXT#">',
'                  <span class="a-CardView-badgeValue">#BADGE_TEXT#</span>',
'                </div>',
'              </div>',
'            </div>'',',
'           ''#SUBJECT#''          , subject          ),',
'           ''#BADGE_TEXT#''       , badge_text       ),',
'           ''#BADGE_CSS_CLASSES#'', badge_css_classes) )',
'      into l_result',
'      from table ( apex_approval.get_tasks (',
'                       p_context => ''SINGLE_TASK'',',
'                       p_task_id => :P17_TASK_ID ) );',
'',
'    return l_result;',
'exception',
'    when no_data_found then',
'        return l_result;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P17_TASK_ID'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P17_EMPNO'
,p_plug_display_when_cond2=>'&CURRENT_USER_EMPNO.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1225356025468859263)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--stickToBottom:t-ButtonRegion--slimPadding:margin-bottom-none'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>210
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1225356454378859263)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1225356025468859263)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P17_APPRAISAL_ID_PROVIDED'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1507170039314601180)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1225356025468859263)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P17_APPRAISAL_ID_PROVIDED'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1225357257879859264)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1225356025468859263)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P17_APPRAISAL_ID_PROVIDED = ''N'' and',
'apex_approval.is_allowed (',
'    p_task_id   => :P17_TASK_ID,',
'    p_operation => apex_approval.c_task_op_complete )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1225357665944859264)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(1225356025468859263)
,p_button_name=>'COMPLETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Complete'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P17_APPRAISAL_ID_PROVIDED = ''N'' and',
'apex_approval.is_allowed (',
'    p_task_id   => :P17_TASK_ID,',
'    p_operation => apex_approval.c_task_op_complete )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-box-arrow-out-east'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1225378399445859279)
,p_branch_name=>'Reload Dialog'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.::&DEBUG.::P17_TASK_ID:&P17_TASK_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221156498080251860)
,p_name=>'P17_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221156656154251861)
,p_name=>'P17_EMPNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'EMPNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221156749590251862)
,p_name=>'P17_PERIOD_START'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'PERIOD_START'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221156799933251863)
,p_name=>'P17_PERIOD_END'
,p_source_data_type=>'DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'PERIOD_END'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221156947697251864)
,p_name=>'P17_APPRAISAL_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Appraisal Date'
,p_source=>'APPRAISAL_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157008703251865)
,p_name=>'P17_ORIGINATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'ORIGINATOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157107198251866)
,p_name=>'P17_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157273312251867)
,p_name=>'P17_EMP_ACHIEVEMENTS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Self Review - My Achievements'
,p_source=>'EMP_ACHIEVEMENTS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_MARKDOWN_EDITOR'
,p_read_only_when=>'P17_STATUS'
,p_read_only_when2=>'ORIGINATED'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'syntax_highlighting', 'Y',
  'toolbar', 'SIMPLE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157357769251868)
,p_name=>'P17_EMP_DEVELOPMENT_GOALS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Self Review -  Development Goals'
,p_source=>'EMP_DEVELOPMENT_GOALS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_MARKDOWN_EDITOR'
,p_read_only_when=>'P17_STATUS'
,p_read_only_when2=>'ORIGINATED'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'syntax_highlighting', 'Y',
  'toolbar', 'SIMPLE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157425363251869)
,p_name=>'P17_MGR_APPRAISAL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Manager Appraisal Comments'
,p_source=>'MGR_APPRAISAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_MARKDOWN_EDITOR'
,p_display_when=>'P17_STATUS'
,p_display_when2=>'SUBMITTED:MGR_SUBMITTED:VP_REVIEWED:COMPLETED'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_read_only_when=>'P17_STATUS'
,p_read_only_when2=>'SUBMITTED'
,p_read_only_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'syntax_highlighting', 'Y',
  'toolbar', 'SIMPLE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157546538251870)
,p_name=>'P17_MGR_OBJECTIVES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Manager''s Objectives Comments'
,p_source=>'MGR_OBJECTIVES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_MARKDOWN_EDITOR'
,p_display_when=>'P17_STATUS'
,p_display_when2=>'SUBMITTED:MGR_SUBMITTED:VP_REVIEWED:COMPLETED'
,p_display_when_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_read_only_when=>'P17_STATUS'
,p_read_only_when2=>'SUBMITTED'
,p_read_only_when_type=>'VALUE_OF_ITEM_IN_CONDITION_NOT_IN_COLON_DELIMITED_LIST'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'syntax_highlighting', 'Y',
  'toolbar', 'SIMPLE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157692788251872)
,p_name=>'P17_DATE_ORIGINATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'DATE_ORIGINATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221157858466251873)
,p_name=>'P17_INPUT_COMPLETED'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'INPUT_COMPLETED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1221158016075251875)
,p_name=>'P17_VP_REVIEW_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'VP_REVIEW_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1225325246666859234)
,p_name=>'P17_TASK_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1225325598439859235)
,p_name=>'P17_SUCCESS_MESSAGE'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1493592974583442869)
,p_name=>'P17_APPRAISAL_PERIOD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Appraisal Period'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
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
 p_id=>wwv_flow_imp.id(1507165800672601138)
,p_name=>'P17_MANAGER_COMPLETED'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_item_source_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_source=>'MANAGER_COMPLETED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1507170093388601181)
,p_name=>'P17_APPRAISAL_ID_PROVIDED'
,p_item_sequence=>120
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1513817896667464341)
,p_name=>'P17_ENAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1221156371250251858)
,p_prompt=>'Employee'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>':P17_APPRAISAL_ID_PROVIDED = ''Y'' or :P17_EMPNO != :CURRENT_USER_EMPNO'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
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
 p_id=>wwv_flow_imp.id(1524039734892448469)
,p_name=>'P17_EXPECTING_INPUT_FROM'
,p_item_sequence=>130
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1513818021357464342)
,p_computation_sequence=>10
,p_computation_item=>'P17_ENAME'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename',
'from eba_demo_appr_emp',
'where empno = :P17_EMPNO'))
,p_compute_when=>':P17_APPRAISAL_ID_PROVIDED = ''Y'' or :P17_EMPNO != :CURRENT_USER_EMPNO'
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1507170228876601182)
,p_computation_sequence=>10
,p_computation_item=>'P17_APPRAISAL_ID_PROVIDED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'CASE WHEN :P17_ID IS NOT NULL THEN ''Y'' ELSE ''N'' END'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1221158256791251877)
,p_computation_sequence=>20
,p_computation_item=>'P17_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select detail_pk',
'from apex_tasks',
'where task_id = :P17_TASK_ID'))
,p_compute_when=>'P17_ID'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1524039817337448470)
,p_computation_sequence=>30
,p_computation_item=>'P17_EXPECTING_INPUT_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select actual_owner',
'from apex_tasks',
'where task_id = :P17_TASK_ID'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1225366177738859270)
,p_name=>'Refresh - Comments'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_ALL_COMMENTS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1225367039277859271)
,p_name=>'Refresh - History'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_ALL_HISTORY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1225370836363859274)
,p_name=>'Cancel'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1225356454378859263)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1225371199829859274)
,p_event_id=>wwv_flow_imp.id(1225370836363859274)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1507170382548601183)
,p_name=>'On Click Ok'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1507170039314601180)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1513817267312464334)
,p_event_id=>wwv_flow_imp.id(1507170382548601183)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1225372543608859275)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Claim'
,p_attribute_01=>'CLAIM_TASK'
,p_attribute_02=>'P17_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(1253911166594917770)
,p_internal_uid=>581442455966425842
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1221158130909251876)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1221156371250251858)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Appraisal Region Automatic DML'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'COMPLETE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Evaluation Saved'
,p_internal_uid=>577228043266818443
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1225372959216859275)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Complete'
,p_attribute_01=>'COMPLETE_TASK'
,p_attribute_02=>'P17_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1225357665944859264)
,p_internal_uid=>581442871574425842
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1225377612953859279)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Success Message'
,p_process_sql_clob=>':P17_SUCCESS_MESSAGE := apex_application.g_print_success_message;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>581447525311425846
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1225377999239859279)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CLAIM,SET_PRIORITY,SET_DUE,INVITE_PARTICIPANT,REMOVE_PARTICIPANT,RENEW,UPDATE_PARAMETER,SAVE'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
,p_process_success_message=>'&P17_SUCCESS_MESSAGE.'
,p_internal_uid=>581447911597425846
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1221156485353251859)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1221156371250251858)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Employee Self Review Details'
,p_internal_uid=>577226397710818426
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1493593120454442871)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Compute Appraisal Period'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'EBA_DEMO_APPR'
,p_attribute_04=>'APPRAISAL_PERIOD'
,p_internal_uid=>849663032812009438
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1493593287386442872)
,p_page_process_id=>wwv_flow_imp.id(1493593120454442871)
,p_page_id=>17
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P17_APPRAISAL_PERIOD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1493593330334442873)
,p_page_process_id=>wwv_flow_imp.id(1493593120454442871)
,p_page_id=>17
,p_name=>'p_start_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P17_PERIOD_START'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1493593405106442874)
,p_page_process_id=>wwv_flow_imp.id(1493593120454442871)
,p_page_id=>17
,p_name=>'p_end_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P17_PERIOD_END'
);
wwv_flow_imp.component_end;
end;
/
