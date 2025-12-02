-- =====================================================
-- 1. Establish workspace context for APEX import
-- =====================================================
BEGIN
    apex_application_install.set_workspace('UAT');
    apex_application_install.set_workspace_id(
        apex_util.find_security_group_id('UAT')
    );
    apex_application_install.set_application_id(5010);
    apex_application_install.set_application_alias('APP_102');
    apex_application_install.generate_offset;
END;
/

-- =====================================================
-- 2. Run the APEX application installer
-- =====================================================
@apex/app/app_102/f102/install.sql

exit;
