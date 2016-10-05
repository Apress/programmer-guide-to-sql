SET SERVEROUT ON
DECLARE
   CURSOR cur_profs IS
      SELECT ProfessorID, Name FROM Professor;
   prof cur_profs%ROWTYPE;
BEGIN
   OPEN cur_profs;
   FETCH cur_profs INTO prof;
   WHILE cur_profs%FOUND
   LOOP
      dbms_output.put_line(prof.Name);
      FOR c1 IN (SELECT DISTINCT Name FROM Student s
                 INNER JOIN Enrollment e
                 ON s.StudentID = e.StudentID
                    INNER JOIN Class c
                    ON e.ClassID = c.ClassID
                 WHERE c.ProfessorID = prof.ProfessorID)
      LOOP
         dbms_output.put_line(c1.Name);
      END LOOP;
      FETCH cur_profs INTO prof;
      dbms_output.put_line('----------------');
   END LOOP;
   CLOSE cur_profs;
END;
/
