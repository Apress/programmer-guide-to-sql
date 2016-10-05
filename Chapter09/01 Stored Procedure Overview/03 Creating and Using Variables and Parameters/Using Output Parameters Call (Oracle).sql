SET SERVEROUT ON
DECLARE
   StudentName VARCHAR(50);
BEGIN
   GetStudentName(3, StudentName);
   dbms_output.put_line(StudentName);
END;
/
