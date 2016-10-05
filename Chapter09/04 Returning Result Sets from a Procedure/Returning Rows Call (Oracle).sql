SET SERVEROUT ON
DECLARE
   TYPE studCurType IS REF CURSOR;
   mycur studCurType;
   studrow Student%ROWTYPE;
BEGIN
   student_pkg.GetStudents(mycur);
   FETCH mycur INTO studrow;
   WHILE mycur%FOUND
   LOOP
      dbms_output.put_line(studrow.StudentID || '   ' ||
                           studrow.Name);
      FETCH mycur INTO studrow;
   END LOOP;
END;
/
