-- =====================================================
-- 1. Establish workspace context for APEX import
-- =====================================================


BEGIN
    apex_application_install.set_workspace('UAT');
    apex_application_install.set_workspace_id(
        apex_util.find_security_group_id('UAT')
    );
    apex_application_install.set_application_id(null);
    --apex_application_install.set_application_alias('APP_102');
    apex_application_install.generate_offset;
END;

exit;
