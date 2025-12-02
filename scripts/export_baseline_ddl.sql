set serveroutput on size unlimited
set long 100000
set longchunksize 100000
set pages 0
set lines 200
set trimspool on
set feedback off
set heading off

spool C:\Projects\apex-cicd\apex\db\schema_baselines.sql

declare
  -- Helper to write DDL plus a separator
  procedure emit(p_ddl in clob) is
  begin
    if p_ddl is not null then
      dbms_output.put_line(p_ddl);
      dbms_output.put_line('/');
      dbms_output.put_line('');
    end if;
  end;

begin
  -- Make generated DDL more portable
  dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'SEGMENT_ATTRIBUTES', false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'STORAGE',            false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'TABLESPACE',         false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform, 'SQLTERMINATOR',      true);

  ----------------------------------------------------------------------------
  -- TABLES
  ----------------------------------------------------------------------------
  for rec in (
    select table_name as object_name
    from   user_tables
    order  by table_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('TABLE', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for TABLE '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- INDEXES (non-generated)
  ----------------------------------------------------------------------------
  for rec in (
    select index_name as object_name
    from   user_indexes
    where  generated = 'N'
    order  by index_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('INDEX', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for INDEX '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- SEQUENCES
  ----------------------------------------------------------------------------
  for rec in (
    select sequence_name as object_name
    from   user_sequences
    order  by sequence_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('SEQUENCE', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for SEQUENCE '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- VIEWS
  ----------------------------------------------------------------------------
  for rec in (
    select view_name as object_name
    from   user_views
    order  by view_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('VIEW', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for VIEW '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;
  ----------------------------------------------------------------------------
  -- MATERIALIZED VIEWS
  ----------------------------------------------------------------------------
  for rec in (
    select MVIEW_NAME as object_name
    from   USER_MVIEWS
    order  by MVIEW_NAME
  ) loop
    begin
      emit(dbms_metadata.get_ddl('MATERIALIZED VIEW', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for VIEW '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;
  ----------------------------------------------------------------------------
  -- SYNONYMS
  ----------------------------------------------------------------------------
  for rec in (
    select synonym_name as object_name
    from   user_synonyms
    order  by synonym_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('SYNONYM', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for SYNONYM '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- PACKAGES (specs)
  ----------------------------------------------------------------------------
  for rec in (
    select object_name
    from   user_objects
    where  object_type = 'PACKAGE'
    order  by object_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('PACKAGE', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for PACKAGE '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- PACKAGE BODIES
  ----------------------------------------------------------------------------
  for rec in (
    select object_name
    from   user_objects
    where  object_type = 'PACKAGE BODY'
    order  by object_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('PACKAGE_BODY', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for PACKAGE BODY '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

 ----------------------------------------------------------------------------
  -- TRIGGERS
  ----------------------------------------------------------------------------
  for rec in (
    select object_name
    from   user_objects
    where  object_type = 'TRIGGER'
    order  by object_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('TRIGGER', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for TRIGGER '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;
  ----------------------------------------------------------------------------
  -- PROCEDURES
  ----------------------------------------------------------------------------
  for rec in (
    select object_name
    from   user_objects
    where  object_type = 'PROCEDURE'
    order  by object_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('PROCEDURE', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for PROCEDURE '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- FUNCTIONS
  ----------------------------------------------------------------------------
  for rec in (
    select object_name
    from   user_objects
    where  object_type = 'FUNCTION'
    order  by object_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('FUNCTION', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for FUNCTION '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- TYPES (object / varray)
  ----------------------------------------------------------------------------
  for rec in (
    select type_name as object_name
    from   user_types
    order  by type_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('TYPE', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for TYPE '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

  ----------------------------------------------------------------------------
  -- TYPE BODIES
  ----------------------------------------------------------------------------
  for rec in (
    select object_name
    from   user_objects
    where  object_type = 'TYPE BODY'
    order  by object_name
  ) loop
    begin
      emit(dbms_metadata.get_ddl('TYPE_BODY', rec.object_name, user));
    exception
      when others then
        dbms_output.put_line('-- Failed to get DDL for TYPE BODY '||rec.object_name||': '||sqlerrm);
        dbms_output.put_line('');
    end;
  end loop;

end;
/
spool off;

set feedback on
set heading on