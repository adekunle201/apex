old:begin
  apex_export.get_application(
      p_application_id => &APP_ID,
      p_type           => 'F',
      p_split          => false
  );
end;

new:begin
  apex_export.get_application(
      p_application_id => 102,
      p_type           => 'F',
      p_split          => false
  );
end;
  apex_export.get_application(
  *
ERROR at line 2:
ORA-06550: line 2, column 3:
PLS-00221: 'GET_APPLICATION' is not a procedure or is undefined
ORA-06550: line 2, column 3:
PL/SQL: Statement ignored

https://docs.oracle.com/error-help/db/ora-06550/

