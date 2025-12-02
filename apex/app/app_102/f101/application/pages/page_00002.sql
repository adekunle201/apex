prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Task Details'
,p_alias=>'TASK-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Task Details'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(() => {',
'    apex.jQuery("a.taskActionMenu").each((index, item) => {',
'        const element = apex.jQuery(item);',
'        const actionName = decodeURI(element.attr("href")).match(/\$([^?]+)/)[1];',
'        const actionLabel = element.text();',
'        apex.actions.add({',
'            name: actionName,',
'            label: actionLabel,',
'            action: (event, element, args) => {',
'                if (args.do === "submit") {',
'                    apex.page.submit(actionName.toUpperCase());',
'                }',
'                else if (args.do === "openRegion") {',
'                    apex.theme.openRegion(actionName.toUpperCase());',
'                }',
'            }',
'        });',
'    });',
'});'))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12473354253901374)
,p_plug_name=>'Subject'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_id,',
'       task_type,',
'       task_def_name,',
'       details_app_name,',
'       details_link_target,',
'       subject,',
'       initiator,',
'       actual_owner,',
'       priority,',
'       due_on,',
'       due_in,',
'       due_in_hours,',
'       due_code,',
'       state_code,',
'       is_completed,',
'       outcome,',
'       created_on,',
'       created_ago,',
'       created_ago_hours,',
'       last_updated_on,',
'       badge_text,',
'       badge_state',
'  from table ( apex_human_task.get_tasks (',
'                   p_context => ''SINGLE_TASK'',',
'                   p_task_id => :P2_TASK_ID ) );'))
,p_template_component_type=>'PARTIAL'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'BADGE_COL_WIDTH', 't-ContentRow-badge--auto',
  'BADGE_LABEL', 'State',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_SIZE', 't-Badge--md',
  'BADGE_STATE', 'BADGE_STATE',
  'BADGE_VALUE', 'BADGE_TEXT',
  'DESCRIPTION', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<strong>&TASK_DEF_NAME!HTML.</strong>',
    '{if INITIATOR/}',
    '    <span role="separator" aria-label="&middot;"> &middot; </span>',
    '    &{APEX.TASK.INITIATED_BY_USER_SINCE 0=&INITIATOR!HTML. 1=&CREATED_AGO.}.',
    '{endif/}',
    '{if ACTUAL_OWNER/}',
    '    <span role="separator" aria-label="&middot;"> &middot; </span>',
    '    &{APEX.TASK.ASSIGNED_TO_USER 0=&ACTUAL_OWNER!HTML.}.',
    '{endif/}',
    '{if !IS_COMPLETED/}',
    '    {case DUE_CODE/}',
    '        {when OVERDUE/}',
    '            <span role="separator" aria-label="&middot;"> &middot; </span>',
    '            <strong class="u-danger-text">&{APEX.TASK.DUE_SINCE 0=&DUE_IN.}.</strong>',
    '        {when NEXT_HOUR/}',
    '            <span role="separator" aria-label="&middot;"> &middot; </span>',
    '            <strong class="u-danger-text">&{APEX.TASK.DUE_SINCE 0=&DUE_IN.}.</strong>',
    '        {when NEXT_24_HOURS/}',
    '            <span role="separator" aria-label="&middot;"> &middot; </span>',
    '            <span class="u-danger-text">&{APEX.TASK.DUE_SINCE 0=&DUE_IN.}.</span>',
    '        {otherwise/}',
    '            {if DUE_IN/}',
    '                <span role="separator" aria-label="&middot;"> &middot; </span>',
    '                &{APEX.TASK.DUE_SINCE 0=&DUE_IN.}.',
    '            {endif/}',
    '    {endcase/}',
    '{endif/}',
    '{if !IS_COMPLETED/}',
    '    <span role="separator" aria-label="&middot;"> &middot; </span>',
    '    {case PRIORITY/}',
    '        {when 1/}',
    '            <strong class="u-danger-text">&{APEX.TASK.PRIORITY.1.DESCRIPTION}.</strong>',
    '        {when 2/}',
    '            <span class="u-danger-text">&{APEX.TASK.PRIORITY.2.DESCRIPTION}.</span>',
    '        {when 3/}',
    '            &{APEX.TASK.PRIORITY.3.DESCRIPTION}.',
    '        {when 4/}',
    '            &{APEX.TASK.PRIORITY.4.DESCRIPTION}.',
    '        {when 5/}',
    '            &{APEX.TASK.PRIORITY.5.DESCRIPTION}.',
    '    {endcase/}',
    '{endif/}',
    '{if OUTCOME/}',
    '    <span role="separator" aria-label="&middot;"> &middot; </span>',
    '    &OUTCOME.',
    '{endif/}')),
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'Y',
  'TITLE', '&SUBJECT.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12473825099901379)
,p_name=>'TASK_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12474334339901379)
,p_name=>'TASK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12474814967901379)
,p_name=>'TASK_DEF_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_DEF_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12475256498901380)
,p_name=>'DETAILS_APP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DETAILS_APP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12475789016901380)
,p_name=>'DETAILS_LINK_TARGET'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DETAILS_LINK_TARGET'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12476284476901380)
,p_name=>'SUBJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUBJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12476777358901380)
,p_name=>'INITIATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12477334498901380)
,p_name=>'ACTUAL_OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTUAL_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12477779940901380)
,p_name=>'PRIORITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRIORITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12478310381901381)
,p_name=>'DUE_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DUE_ON'
,p_data_type=>'TIMESTAMP_TZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_format_mask=>'SINCE'
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12478749386901381)
,p_name=>'DUE_IN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DUE_IN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12479326881901381)
,p_name=>'DUE_IN_HOURS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DUE_IN_HOURS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12479800609901381)
,p_name=>'DUE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DUE_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12480275249901381)
,p_name=>'STATE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATE_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12480793907901382)
,p_name=>'IS_COMPLETED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_COMPLETED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12481334915901382)
,p_name=>'OUTCOME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OUTCOME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>160
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12481821084901382)
,p_name=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_ON'
,p_data_type=>'TIMESTAMP_TZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_format_mask=>'SINCE'
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12482271388901382)
,p_name=>'CREATED_AGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_AGO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>180
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12482755385901383)
,p_name=>'CREATED_AGO_HOURS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_AGO_HOURS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12483307619901383)
,p_name=>'LAST_UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_ON'
,p_data_type=>'TIMESTAMP_TZ'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_format_mask=>'SINCE'
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12483778180901383)
,p_name=>'BADGE_TEXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BADGE_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12484283685901383)
,p_name=>'BADGE_STATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BADGE_STATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12490723087901395)
,p_plug_name=>'Delegate'
,p_region_name=>'DELEGATE'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_delegate )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12492285133901399)
,p_plug_name=>'Priority'
,p_region_name=>'SET_PRIORITY'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_set_priority )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12493927731901401)
,p_plug_name=>'Due'
,p_region_name=>'SET_DUE_DATE'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_set_due_date )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12495502230901402)
,p_plug_name=>'Request Information'
,p_region_name=>'REQUEST_INFO'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_request_info )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12497045478901404)
,p_plug_name=>'Submit Information'
,p_region_name=>'SUBMIT_INFO'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_submit_info )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12498680919901405)
,p_plug_name=>'Invite Participant'
,p_region_name=>'ADD_OWNER'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_add_owner )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12500253854901406)
,p_plug_name=>'Remove Participant'
,p_region_name=>'REMOVE_OWNER'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_remove_owner )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12501938034901408)
,p_plug_name=>'Cancel Task'
,p_region_name=>'CANCEL'
,p_parent_plug_id=>wwv_flow_imp.id(12473354253901374)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Do you really want to cancel this task?</p>',
'<p>This will mark the task as no longer needed.</p>'))
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_cancel )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12503079487901409)
,p_plug_name=>'Details'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select param_static_id,',
'       param_label,',
'       param_value,',
'       is_updatable,',
'       is_required',
'  from apex_task_parameters',
' where task_id = :P2_TASK_ID',
'   and is_visible = ''Y''',
' order by param_label;'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P2_TASK_ID'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_task_parameters',
' where task_id = :P2_TASK_ID'))
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'N',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'OVERLINE', '&PARAM_LABEL.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&PARAM_VALUE.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12503441823901409)
,p_name=>'PARAM_STATIC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARAM_STATIC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12503952430901410)
,p_name=>'PARAM_LABEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARAM_LABEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_use_as_row_header=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12504480129901410)
,p_name=>'PARAM_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARAM_VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12505007195901410)
,p_name=>'IS_UPDATABLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_UPDATABLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12505533698901410)
,p_name=>'IS_REQUIRED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_REQUIRED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12506466080901412)
,p_plug_name=>'Edit Parameter'
,p_parent_plug_id=>wwv_flow_imp.id(12503079487901409)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P2_CAN_UPDATE_PARAMS = ''Y'''
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12509676158901415)
,p_plug_name=>'Comments'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_string.get_initials(created_by) as user_initials,',
'       ''u-color-''||ora_hash(created_by,45)  as user_css_class,',
'       created_by                           as user_name,',
'       text                                 as comment_text,',
'       created_on                           as comment_date',
'  from apex_task_comments',
' where nvl(:P2_ALL_COMMENTS, ''N'') = ''N''',
'       and task_id = :P2_TASK_ID',
'    or nvl(:P2_ALL_COMMENTS, ''N'') = ''Y''',
'       and task_id in ( ',
'                select task_id',
'                  from apex_tasks',
'               connect by prior previous_task_id = task_id',
'                 start with task_id = :P2_TASK_ID )',
' order by created_on desc'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$COMMENTS'
,p_ajax_items_to_submit=>'P2_TASK_ID,P2_ALL_COMMENTS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_plug_query_no_data_found=>'No Comments'
,p_no_data_found_icon_classes=>'fa-comments-o fa-lg'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'N',
  'AVATAR_CSS_CLASSES', '&USER_CSS_CLASS.',
  'AVATAR_DESCRIPTION', '&USER_NAME.',
  'AVATAR_INITIALS', 'USER_INITIALS',
  'AVATAR_SHAPE', 't-Avatar--circle',
  'AVATAR_TYPE', 'initials',
  'COMMENT_DATE', 'COMMENT_DATE',
  'COMMENT_TEXT', 'COMMENT_TEXT',
  'DISPLAY_AVATAR', 'Y',
  'STYLE', 't-Comments--chat',
  'USER_NAME', 'USER_NAME')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12510136914901416)
,p_name=>'USER_INITIALS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_INITIALS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12510551464901417)
,p_name=>'USER_CSS_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_CSS_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12511050398901417)
,p_name=>'USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_use_as_row_header=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12511619374901417)
,p_name=>'COMMENT_TEXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12512042686901417)
,p_name=>'COMMENT_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENT_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_format_mask=>'SINCE'
,p_use_as_row_header=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12513742446901420)
,p_plug_name=>'Add Comment'
,p_parent_plug_id=>wwv_flow_imp.id(12509676158901415)
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>1485369341786500999
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_add_comment )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_landmark_type=>'form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12515407372901421)
,p_plug_name=>'History'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_msg,',
'       event_creator,',
'       event_timestamp',
'  from table ( apex_human_task.get_task_history (',
'                   p_task_id     => :P2_TASK_ID,',
'                   p_include_all => :P2_ALL_HISTORY ) )',
' order by event_timestamp desc'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$COMMENTS'
,p_ajax_items_to_submit=>'P2_TASK_ID,P2_ALL_HISTORY'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'N',
  'COMMENT_DATE', 'EVENT_TIMESTAMP',
  'COMMENT_TEXT', 'DISPLAY_MSG',
  'DISPLAY_AVATAR', 'N',
  'STYLE', 't-Comments--basic',
  'USER_NAME', 'EVENT_CREATOR')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12515769883901425)
,p_name=>'DISPLAY_MSG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISPLAY_MSG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12516272235901425)
,p_name=>'EVENT_CREATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_CREATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_use_as_row_header=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12516810760901425)
,p_name=>'EVENT_TIMESTAMP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_TIMESTAMP'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_format_mask=>'SINCE'
,p_use_as_row_header=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12517704419901426)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--stickToBottom:t-ButtonRegion--slimPadding:margin-bottom-none'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12563302941478759)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page shows detailed information about the task whose id ',
'    is passed in <strong>P2_TASK_ID</strong> and is used in the',
'    sample to show <em>both</em> Job Change and Laptop Approval',
'    tasks. It was created by clicking on the <strong>Create Task ',
'    Details Page</strong> button on the task definition edit page',
'    in the APEX Builder. You can use the same task detail page',
'    for any task definition type, or generate a specific task',
'    detail page for each task definition that you enhance to',
'    feature task-specific information to provide additional context',
'    for the approvers. While this page was left as the builder',
'    generated it, the <strong>Salary Change Details</strong>',
'    page shows an example of a task-specific, customized page.',
'</p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12491525415901397)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12490723087901395)
,p_button_name=>'CLOSE_DELEGATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12493043239901400)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12492285133901399)
,p_button_name=>'CLOSE_SET_PRIORITY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12494675097901402)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12493927731901401)
,p_button_name=>'CLOSE_SET_DUE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12496252584901403)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12495502230901402)
,p_button_name=>'CLOSE_REQUEST_INFORMATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12497904059901404)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12497045478901404)
,p_button_name=>'CLOSE_SUBMIT_INFORMATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12499519796901406)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12498680919901405)
,p_button_name=>'CLOSE_INVITE_PARTICIPANT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12501080831901407)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12500253854901406)
,p_button_name=>'CLOSE_REMOVE_PARTICIPANT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12502333990901408)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12501938034901408)
,p_button_name=>'CLOSE_CANCEL_TASK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12508854369901414)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_button_name=>'CLOSE_UPDATE_PARAMETER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12514614149901421)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12513742446901420)
,p_button_name=>'CLOSE_ADD_COMMENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12518136889901427)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12517704419901426)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12518459949901428)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12517704419901426)
,p_button_name=>'CLAIM'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Claim Task'
,p_button_position=>'CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_claim )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12518849655901429)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12517704419901426)
,p_button_name=>'REJECT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reject'
,p_button_position=>'CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_reject )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-times-circle-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12519304512901430)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12517704419901426)
,p_button_name=>'APPROVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approve'
,p_button_position=>'CREATE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_approve )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12512627631901418)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12509676158901415)
,p_button_name=>'OPEN_DIALOG_ADD_COMMENT'
,p_button_static_id=>'OPEN_DIALOG_ADD_COMMENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Add Comment'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_submit_info )',
'and apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_add_comment )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12491863850901398)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12490723087901395)
,p_button_name=>'DELEGATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delegate'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12493511162901400)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12492285133901399)
,p_button_name=>'SET_PRIORITY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Priority'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12495128478901402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12493927731901401)
,p_button_name=>'SET_DUE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Due Date'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12496655918901403)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12495502230901402)
,p_button_name=>'REQUEST_INFORMATION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Request Information'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12498319160901405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12497045478901404)
,p_button_name=>'SUBMIT_INFORMATION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Information'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12499843434901406)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12498680919901405)
,p_button_name=>'INVITE_PARTICIPANT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Invite Participant'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12501457864901407)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12500253854901406)
,p_button_name=>'REMOVE_PARTICIPANT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Remove Participant'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12502640734901409)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12501938034901408)
,p_button_name=>'CANCEL_TASK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel Task'
,p_button_position=>'EDIT'
,p_button_css_classes=>'u-danger'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12509274930901415)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_button_name=>'UPDATE_PARAMETER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12513011351901419)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12509676158901415)
,p_button_name=>'OPEN_DIALOG_SUBMIT_INFORMATION'
,p_button_static_id=>'OPEN_DIALOG_SUBMIT_INFORMATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Information'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_submit_info )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12514959813901421)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12513742446901420)
,p_button_name=>'ADD_COMMENT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Comment'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(12547722486901459)
,p_branch_name=>'Reload Dialog'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.::&DEBUG.::P2_TASK_ID:&P2_TASK_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12472194317901371)
,p_name=>'P2_TASK_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12472590269901374)
,p_name=>'P2_CAN_UPDATE_PARAMS'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12491059730901395)
,p_name=>'P2_NEW_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12490723087901395)
,p_prompt=>'New Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'       val',
'  from table ( ',
'           apex_human_task.get_task_delegates ( ',
'               p_task_id => :P2_TASK_ID ) )'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12492663252901399)
,p_name=>'P2_NEW_PRIORITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12492285133901399)
,p_prompt=>'New Priority'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select priority',
'  from apex_tasks',
' where task_id = :P2_TASK_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'UNIFIED_TASK_LIST.LOV.PRIORITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select disp, ',
'       val ',
'  from table ( apex_approval.get_lov_priority )',
' order by insert_order'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12494306641901401)
,p_name=>'P2_NEW_DUE_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12493927731901401)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Due Date'
,p_format_mask=>'YYYY-MM-DD HH24:MI'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(due_on, ''YYYY-MM-DD HH24:MI'')',
'  from apex_tasks',
' where task_id = :P2_TASK_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'INLINE',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12495912547901402)
,p_name=>'P2_REQUEST_INFO_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12495502230901402)
,p_prompt=>'Message'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>7
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12497492881901404)
,p_name=>'P2_SUBMIT_INFO_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12497045478901404)
,p_prompt=>'Message'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>7
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12499115262901405)
,p_name=>'P2_NEW_POTENTIAL_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12498680919901405)
,p_prompt=>'New Potential Owner'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12500737173901406)
,p_name=>'P2_POTENTIAL_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12500253854901406)
,p_prompt=>'Potential Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'       val',
'  from table ( ',
'           apex_human_task.get_task_delegates ( ',
'               p_task_id => :P2_TASK_ID ) )'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'N',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12506882259901412)
,p_name=>'P2_PARAM_STATIC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12507311738901412)
,p_name=>'P2_PARAM_LABEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_prompt=>'Parameter'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12507678631901413)
,p_name=>'P2_PARAM_VALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_prompt=>'Current Value'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12508063272901413)
,p_name=>'P2_NEW_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_prompt=>'New Value'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12508504726901414)
,p_name=>'P2_IS_REQUIRED'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12506466080901412)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12513368822901419)
,p_name=>'P2_ALL_COMMENTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12509676158901415)
,p_prompt=>'Include comments from expired tasks'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_id ',
'  from apex_tasks',
' where task_id = :P2_TASK_ID',
'   and previous_task_id is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12514180784901420)
,p_name=>'P2_COMMENT_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12513742446901420)
,p_prompt=>'Comment'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>7
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12517291118901425)
,p_name=>'P2_ALL_HISTORY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12515407372901421)
,p_prompt=>'Include history from expired tasks'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_id ',
'  from apex_tasks',
' where task_id = :P2_TASK_ID',
'   and previous_task_id is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(12472983513901374)
,p_computation_sequence=>10
,p_computation_item=>'P2_CAN_UPDATE_PARAMS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'case ',
'    when apex_human_task.is_allowed (',
'            p_task_id   => :P2_TASK_ID,',
'            p_operation => apex_human_task.c_task_op_set_params )',
'    then ''Y''',
'    else ''N''',
'end'))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12538526514901444)
,p_validation_name=>'Delegate'
,p_validation_sequence=>10
,p_validation=>'P2_NEW_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a potential owner'
,p_when_button_pressed=>wwv_flow_imp.id(12491863850901398)
,p_associated_item=>wwv_flow_imp.id(12491059730901395)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12538899710901445)
,p_validation_name=>'Request Information'
,p_validation_sequence=>20
,p_validation=>'P2_REQUEST_INFO_TEXT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a message'
,p_when_button_pressed=>wwv_flow_imp.id(12496655918901403)
,p_associated_item=>wwv_flow_imp.id(12495912547901402)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12539291798901445)
,p_validation_name=>'Submit Information'
,p_validation_sequence=>30
,p_validation=>'P2_SUBMIT_INFO_TEXT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a message'
,p_when_button_pressed=>wwv_flow_imp.id(12498319160901405)
,p_associated_item=>wwv_flow_imp.id(12497492881901404)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12539707284901445)
,p_validation_name=>'Invite Participant'
,p_validation_sequence=>40
,p_validation=>'P2_NEW_POTENTIAL_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a potential owner'
,p_when_button_pressed=>wwv_flow_imp.id(12499843434901406)
,p_associated_item=>wwv_flow_imp.id(12499115262901405)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12540131940901446)
,p_validation_name=>'Remove Participant'
,p_validation_sequence=>50
,p_validation=>'P2_POTENTIAL_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a potential owner'
,p_when_button_pressed=>wwv_flow_imp.id(12501457864901407)
,p_associated_item=>wwv_flow_imp.id(12500737173901406)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12540515590901446)
,p_validation_name=>'Update Parameter'
,p_validation_sequence=>60
,p_validation=>'P2_NEW_VALUE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a new parameter value'
,p_validation_condition=>':REQUEST = ''UPDATE_PARAMETER'' and :P2_IS_REQUIRED = ''Y'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(12508063272901413)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(12540848006901447)
,p_validation_name=>'Add Comment'
,p_validation_sequence=>70
,p_validation=>'P2_COMMENT_TEXT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a comment'
,p_when_button_pressed=>wwv_flow_imp.id(12514959813901421)
,p_associated_item=>wwv_flow_imp.id(12514180784901420)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12519650147901430)
,p_name=>'Refresh - Comments'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_ALL_COMMENTS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12520096357901431)
,p_event_id=>wwv_flow_imp.id(12519650147901430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12509676158901415)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12521511749901432)
,p_name=>'Edit Parameter'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'a.parameter'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'body'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12521903695901432)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12506466080901412)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12522369887901432)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12509274930901415)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12522938037901432)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_PARAM_STATIC_ID'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.jQuery(this.triggeringElement).attr("data-id")'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12523408725901432)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_PARAM_LABEL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.jQuery(this.triggeringElement).attr("data-label")'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12523857224901433)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_PARAM_VALUE,P2_NEW_VALUE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.jQuery(this.triggeringElement).attr("data-value")'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12524426784901433)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_IS_REQUIRED'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.jQuery(this.triggeringElement).attr("data-required")'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12524882976901433)
,p_event_id=>wwv_flow_imp.id(12521511749901432)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_NEW_VALUE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12537125102901443)
,p_name=>'Disable/Enable Update Button'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_NEW_VALUE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'apex.items.P2_NEW_VALUE.value != apex.items.P2_PARAM_VALUE.value'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12537465131901443)
,p_event_id=>wwv_flow_imp.id(12537125102901443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12509274930901415)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12538007434901444)
,p_event_id=>wwv_flow_imp.id(12537125102901443)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12509274930901415)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12520596336901431)
,p_name=>'Refresh - History'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_ALL_HISTORY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12520972974901431)
,p_event_id=>wwv_flow_imp.id(12520596336901431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12515407372901421)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12525374561901433)
,p_name=>'Add Comment'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12512627631901418)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12525738843901433)
,p_event_id=>wwv_flow_imp.id(12525374561901433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12513742446901420)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12526305965901433)
,p_name=>'Submit Information'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12513011351901419)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12526732455901433)
,p_event_id=>wwv_flow_imp.id(12526305965901433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12497045478901404)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12527165452901433)
,p_name=>'Cancel'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12518136889901427)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12527578262901434)
,p_event_id=>wwv_flow_imp.id(12527165452901433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12528127232901434)
,p_name=>'Close Delegate Dialog'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12491525415901397)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12528467193901435)
,p_event_id=>wwv_flow_imp.id(12528127232901434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12490723087901395)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12528949601901436)
,p_name=>'Close Change Priority Dialog'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12493043239901400)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12529378776901436)
,p_event_id=>wwv_flow_imp.id(12528949601901436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12492285133901399)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12529936559901437)
,p_name=>'Close Change Due Date Dialog'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12494675097901402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12530249932901437)
,p_event_id=>wwv_flow_imp.id(12529936559901437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12493927731901401)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12530791336901438)
,p_name=>'Close Request Information Dialog'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12496252584901403)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12531233690901438)
,p_event_id=>wwv_flow_imp.id(12530791336901438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12495502230901402)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12531688441901438)
,p_name=>'Close Submit Information Dialog'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12497904059901404)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12532131078901439)
,p_event_id=>wwv_flow_imp.id(12531688441901438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12497045478901404)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12532555798901439)
,p_name=>'Close Invite Participant Dialog'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12499519796901406)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12532945464901439)
,p_event_id=>wwv_flow_imp.id(12532555798901439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12498680919901405)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12533494175901440)
,p_name=>'Close Remove Participant Dialog'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12501080831901407)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12533925619901440)
,p_event_id=>wwv_flow_imp.id(12533494175901440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12500253854901406)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12534391404901441)
,p_name=>'Close Cancel Task Dialog'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12502333990901408)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12534750755901441)
,p_event_id=>wwv_flow_imp.id(12534391404901441)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12501938034901408)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12535319015901442)
,p_name=>'Close Edit Parameter Dialog'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12508854369901414)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12535655263901442)
,p_event_id=>wwv_flow_imp.id(12535319015901442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12506466080901412)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12536183047901443)
,p_name=>'Close Add Comment Dialog'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12514614149901421)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12536611261901443)
,p_event_id=>wwv_flow_imp.id(12536183047901443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12513742446901420)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12541327223901448)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Renew Task'
,p_attribute_01=>'RENEW_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_09=>'P2_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RENEW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Task renewed'
,p_internal_uid=>3887088645497924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12541644505901448)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Claim'
,p_attribute_01=>'CLAIM_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12518459949901428)
,p_internal_uid=>3887405927497924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12542071051901449)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Approve'
,p_attribute_01=>'APPROVE_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12519304512901430)
,p_process_success_message=>'Task approved'
,p_internal_uid=>3887832473497925
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12542515312901450)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Reject'
,p_attribute_01=>'REJECT_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12518849655901429)
,p_process_success_message=>'Task rejected'
,p_internal_uid=>3888276734497926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12542903090901450)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Release'
,p_attribute_01=>'RELEASE_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RELEASE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Task released - can now be claimed by others'
,p_internal_uid=>3888664512497926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12543323996901451)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Delegate'
,p_attribute_01=>'DELEGATE_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_04=>'P2_NEW_OWNER'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12491863850901398)
,p_process_success_message=>'Task delegated to &P2_NEW_OWNER!HTML.'
,p_internal_uid=>3889085418497927
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12543728427901452)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Change Priority'
,p_attribute_01=>'SET_TASK_PRIORITY'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_05=>'P2_NEW_PRIORITY'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12493511162901400)
,p_process_success_message=>'Task priority changed'
,p_internal_uid=>3889489849497928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12544069095901452)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Change Due Date'
,p_attribute_01=>'SET_DUE_DATE'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_06=>'P2_NEW_DUE_DATE'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12495128478901402)
,p_process_success_message=>'Task due date updated'
,p_internal_uid=>3889830517497928
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12544450438901453)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Request Information'
,p_attribute_01=>'REQUEST_INFO'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_03=>'&P2_REQUEST_INFO_TEXT.'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12496655918901403)
,p_process_success_message=>'Information requested'
,p_internal_uid=>3890211860497929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12544865455901454)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Submit Information'
,p_attribute_01=>'SUBMIT_INFO'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_03=>'&P2_SUBMIT_INFO_TEXT.'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12498319160901405)
,p_process_success_message=>'Information submitted'
,p_internal_uid=>3890626877497930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12545245494901455)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Invite Participant'
,p_attribute_01=>'ADD_TASK_POTENTIAL_OWNER'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_04=>'P2_NEW_POTENTIAL_OWNER'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12499843434901406)
,p_process_success_message=>'Participant &P2_NEW_POTENTIAL_OWNER!HTML. added to task as potential owner'
,p_internal_uid=>3891006916497931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12545667091901456)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Remove Participant'
,p_attribute_01=>'REMOVE_POTENTIAL_OWNER'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_04=>'P2_POTENTIAL_OWNER'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12501457864901407)
,p_process_success_message=>'Participant &P2_POTENTIAL_OWNER!HTML. removed from task.'
,p_internal_uid=>3891428513497932
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12546081588901456)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Cancel Task'
,p_attribute_01=>'CANCEL_TASK'
,p_attribute_02=>'P2_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12502640734901409)
,p_process_success_message=>'Task canceled'
,p_internal_uid=>3891843010497932
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12546499182901457)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Update Parameter'
,p_attribute_01=>'SET_TASK_PARAMS'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_10=>'P2_PARAM_STATIC_ID'
,p_attribute_11=>'P2_NEW_VALUE'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12509274930901415)
,p_process_success_message=>'Parameter updated'
,p_internal_uid=>3892260604497933
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12546852064901458)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Add Comment'
,p_attribute_01=>'ADD_TASK_COMMENT'
,p_attribute_02=>'P2_TASK_ID'
,p_attribute_03=>'&P2_COMMENT_TEXT.'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12514959813901421)
,p_process_success_message=>'Comment added'
,p_internal_uid=>3892613486497934
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12547281195901458)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CLAIM,SET_PRIORITY,SET_DUE,INVITE_PARTICIPANT,REMOVE_PARTICIPANT,RENEW,UPDATE_PARAMETER,SAVE,ADD_COMMENT'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
,p_internal_uid=>3893042617497934
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(12484828215901383)
,p_region_id=>wwv_flow_imp.id(12473354253901374)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(12505994777901410)
,p_region_id=>wwv_flow_imp.id(12503079487901409)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
,p_link_attributes=>'class="parameter" data-id="&PARAM_STATIC_ID!ATTR." data-label="&PARAM_LABEL!ATTR." data-value="&PARAM_VALUE!ATTR." data-required="&IS_REQUIRED!ATTR." aria-haspopup="dialog"'
,p_button_display_type=>'TEXT'
,p_is_hot=>false
,p_show_as_disabled=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':IS_UPDATABLE = ''Y'' and :P2_CAN_UPDATE_PARAMS = ''Y'''
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12485269856901388)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Renew Task'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$renew?do=submit'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_renew )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12485932069901389)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$release?do=submit'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_release )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12486536933901390)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Delegate'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$delegate?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_delegate )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12487043727901391)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Change Priority'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$set_priority?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_set_priority )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12487650887901392)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Change Due Date'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$set_due_date?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_set_due_date )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12488271716901392)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Request Information'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$request_info?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_request_info )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12488896473901393)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Invite Participant'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$add_owner?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_add_owner )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12489528225901394)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Remove Participant'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$remove_owner?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_remove_owner )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12490090982901394)
,p_component_action_id=>wwv_flow_imp.id(12484828215901383)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Cancel Task'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$cancel?do=openRegion'
,p_link_attributes=>'class="taskActionMenu"'
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_human_task.is_allowed (',
'    p_task_id   => :P2_TASK_ID,',
'    p_operation => apex_human_task.c_task_op_cancel )'))
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp.component_end;
end;
/
