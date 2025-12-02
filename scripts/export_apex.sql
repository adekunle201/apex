set echo off
set termout off
set feedback off
set heading off

-- Set your APEX app id here
define APP_ID=102

-- Export file path
define FILE_NAME=../src/app_&APP_ID._export.sql

spool &FILE_NAME

begin
  apex_export.get_application(
      p_application_id => &APP_ID,
      p_type           => 'F',
      p_split          => false
  );
end;
/

spool off
exit;
