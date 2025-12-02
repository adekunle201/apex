set serveroutput on size unlimited
set long 1000000
set longchunksize 1000000
set lines 200
set pages 0
set trimspool on
set feedback off
set heading off

spool C:\Projects\apex-cicd\apex\db\schema_baselines.sql

DECLARE
  procedure emit(p_clob in clob) is
  begin
    if p_clob is not null then
      dbms_output.put_line(p_clob);
      dbms_output.put_line('/');
      dbms_output.put_line(''); -- separator
    end if;
  end;
BEGIN
  -- Output cleanup options
  dbms_metadata.set_transform_param(dbms_metadata.session_transform,'STORAGE',false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform,'TABLESPACE',false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform,'SEGMENT_ATTRIBUTES',false);
  dbms_metadata.set_transform_param(dbms_metadata.session_transform,'SQLTERMINATOR',true);

  ----------------------------------------------------------------------------
  -- TABLES
  ----------------------------------------------------------------------------
  FOR t IN (SELECT table_name FROM user_tables ORDER BY table_name) LOOP
  Begin
    emit(dbms_metadata.get_ddl('TABLE', t.table_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
	
  END LOOP;

  ----------------------------------------------------------------------------
  -- INDEXES (non-system)
  ----------------------------------------------------------------------------
  FOR i IN (
    SELECT index_name
    FROM user_indexes
    WHERE generated = 'N'
    ORDER BY index_name
  ) LOOP
  begin
    emit(dbms_metadata.get_ddl('INDEX', i.index_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- SEQUENCES
  ----------------------------------------------------------------------------
  FOR s IN (
    SELECT sequence_name
    FROM user_sequences
    ORDER BY sequence_name
  ) LOOP
  begin
    emit(dbms_metadata.get_ddl('SEQUENCE', s.sequence_name));
  exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
	END LOOP;

  ----------------------------------------------------------------------------
  -- VIEWS
  ----------------------------------------------------------------------------
  FOR v IN (
    SELECT view_name
    FROM user_views
    ORDER BY view_name
  ) LOOP
  begin
    emit(dbms_metadata.get_ddl('VIEW', v.view_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- MATERIALIZED VIEWS
  ----------------------------------------------------------------------------
  FOR mv IN (
    SELECT mview_name
    FROM user_mviews
    ORDER BY mview_name
  ) LOOP
  begin
    emit(dbms_metadata.get_ddl('MATERIALIZED VIEW', mv.mview_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- SYNONYMS (if any)
  ----------------------------------------------------------------------------
  FOR syn IN (
    SELECT synonym_name
    FROM user_synonyms
    ORDER BY synonym_name
  ) LOOP
  Begin
    emit(dbms_metadata.get_ddl('SYNONYM', syn.synonym_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- PACKAGES (specs only)
  ----------------------------------------------------------------------------
  FOR p IN (
    SELECT object_name
    FROM user_objects
    WHERE object_type = 'PACKAGE'
    ORDER BY object_name
  ) LOOP
  begin
    emit(dbms_metadata.get_ddl('PACKAGE', p.object_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- PACKAGE BODIES
  ----------------------------------------------------------------------------
  FOR pb IN (
    SELECT object_name
    FROM user_objects
    WHERE object_type = 'PACKAGE BODY'
    ORDER BY object_name
  ) LOOP
  Begin
    emit(dbms_metadata.get_ddl('PACKAGE_BODY', pb.object_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- PROCEDURES
  ----------------------------------------------------------------------------
  FOR pr IN (
    SELECT object_name
    FROM user_objects
    WHERE object_type = 'PROCEDURE'
    ORDER BY object_name
  ) LOOP
  Begin
    emit(dbms_metadata.get_ddl('PROCEDURE', pr.object_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- FUNCTIONS
  ----------------------------------------------------------------------------
  FOR f IN (
    SELECT object_name
    FROM user_objects
    WHERE object_type = 'FUNCTION'
    ORDER BY object_name
  ) LOOP
  Begin
    emit(dbms_metadata.get_ddl('FUNCTION', f.object_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

  ----------------------------------------------------------------------------
  -- TRIGGERS (last, to avoid dependency errors)
  ----------------------------------------------------------------------------
  FOR tr IN (
    SELECT object_name
    FROM user_objects
    WHERE object_type = 'TRIGGER'
    ORDER BY object_name
  ) LOOP
  Begin
    emit(dbms_metadata.get_ddl('TRIGGER', tr.object_name));
	exception
      when others then
        dbms_output.put_line('-- Failed to get DDL '||sqlerrm);
        dbms_output.put_line('');
    end;
  END LOOP;

END;
/
spool off;

set feedback on
set heading on
