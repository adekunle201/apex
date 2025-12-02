prompt --application/shared_components/email/templates/laptop_delivered_notification
begin
--   Manifest
--     EMAIL TEMPLATE: Laptop Delivered Notification
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2200437608860210
,p_default_application_id=>101
,p_default_id_offset=>2202822233886717
,p_default_owner=>'CICD'
);
wwv_flow_imp_shared.create_email_template(
 p_id=>wwv_flow_imp.id(20094669161402079)
,p_name=>'Laptop Delivered Notification'
,p_static_id=>'LAPTOP_DELIVERED_NOTIFICATION'
,p_version_number=>2
,p_subject=>'#P_LAPTOP_TYPE# Laptop for #P_ENAME# Completed'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Dear &P_ENAME.,<br><br>',
'',
'Congratulations, your new #P_LAPTOP_TYPE# laptop has been delivered. <br><br>',
'',
'{if P_DELIVERED_FROM_STOCK/}We used stock on hand to get it to you more quickly.<br><br>{endif/}',
'',
'Best Regards,',
'  The backoffice team'))
,p_html_header=>'<b style="font-size: 24px;">Sample Workflow, Approvals, and Tasks</b>'
,p_version_scn=>2483266481
);
wwv_flow_imp.component_end;
end;
/
