prompt --install

begin
    apex_application_install.set_workspace('UAT');
    apex_application_install.set_application_id(102);
    apex_application_install.generate_offset;
end;
/

@@../apex/app/app_102/f102/application/set_environment.sql
--@@../apex/app/app_102/f102/application/delete_application.sql
@@../apex/app/app_102/f102/application/create_application.sql

@@../apex/app/app_102/f102/application/application_properties.sql
@@../apex/app/app_102/f102/application/user_interfaces.sql

@@../apex/app/app_102/f102/application/shared_components/navigation/lists/navigation_menu.sql
@@../apex/app/app_102/f102/application/shared_components/navigation/lists/navigation_bar.sql
@@../apex/app/app_102/f102/application/shared_components/navigation/listentry.sql

@@../apex/app/app_102/f102/application/shared_components/files/icons_app_icon_512_png.sql
@@../apex/app/app_102/f102/application/shared_components/files/icons_app_icon_32_png.sql
@@../apex/app/app_102/f102/application/shared_components/files/icons_app_icon_144_rounded_png.sql
@@../apex/app/app_102/f102/application/shared_components/files/icons_app_icon_192_png.sql
@@../apex/app/app_102/f102/application/shared_components/files/icons_app_icon_256_rounded_png.sql

@@../apex/app/app_102/f102/application/plugin_settings.sql
@@../apex/app/app_102/f102/application/shared_components/security/authorizations/administration_rights.sql
@@../apex/app/app_102/f102/application/shared_components/navigation/navigation_bar.sql
@@../apex/app/app_102/f102/application/shared_components/logic/application_settings.sql

@@../apex/app/app_102/f102/application/shared_components/navigation/tabs/standard.sql
@@../apex/app/app_102/f102/application/shared_components/navigation/tabs/parent.sql
@@../apex/app/app_102/f102/application/pages/page_groups.sql

@@../apex/app/app_102/f102/application/shared_components/navigation/breadcrumbs/breadcrumb.sql
@@../apex/app/app_102/f102/application/shared_components/navigation/breadcrumbentry.sql

@@../apex/app/app_102/f102/application/shared_components/user_interface/templates/popuplov.sql
@@../apex/app/app_102/f102/application/shared_components/user_interface/themes.sql
@@../apex/app/app_102/f102/application/shared_components/user_interface/theme_style.sql
@@../apex/app/app_102/f102/application/shared_components/user_interface/theme_files.sql
@@../apex/app/app_102/f102/application/shared_components/user_interface/template_opt_groups.sql
@@../apex/app/app_102/f102/application/shared_components/user_interface/template_options.sql

@@../apex/app/app_102/f102/application/shared_components/globalization/language.sql
@@../apex/app/app_102/f102/application/shared_components/logic/build_options.sql
@@../apex/app/app_102/f102/application/shared_components/globalization/messages.sql
@@../apex/app/app_102/f102/application/shared_components/globalization/dyntranslations.sql

@@../apex/app/app_102/f102/application/shared_components/security/authentications/oracle_apex_accounts.sql

@@../apex/app/app_102/f102/application/user_interfaces/combined_files.sql

@@../apex/app/app_102/f102/application/pages/page_00000.sql
@@../apex/app/app_102/f102/application/pages/page_00001.sql
@@../apex/app/app_102/f102/application/pages/page_09999.sql

@@../apex/app/app_102/f102/application/deployment/definition.sql
@@../apex/app/app_102/f102/application/deployment/checks.sql
@@../apex/app/app_102/f102/application/deployment/buildoptions.sql
@@../apex/app/app_102/f102/application/end_environment.sql
