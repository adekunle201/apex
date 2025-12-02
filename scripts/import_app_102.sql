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
DECLARE
    v_errm   VARCHAR2(4000);
    v_stack  VARCHAR2(4000);
begin
    @apex/app/app_102/f102/install.sql
    EXCEPTION
        WHEN OTHERS THEN
            v_errm  := SQLERRM;
            v_stack := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;

            DBMS_OUTPUT.PUT_LINE('===============================');
            DBMS_OUTPUT.PUT_LINE(' APEX IMPORT ERROR OCCURRED');
            DBMS_OUTPUT.PUT_LINE('-------------------------------');
            DBMS_OUTPUT.PUT_LINE('Error message: ' || v_errm);
            DBMS_OUTPUT.PUT_LINE('Error stack:');
            DBMS_OUTPUT.PUT_LINE(v_stack);
            DBMS_OUTPUT.PUT_LINE('===============================');

            -- RAISE AGAIN so CI/CD fails normally
            RAISE;
    END;


exit;
