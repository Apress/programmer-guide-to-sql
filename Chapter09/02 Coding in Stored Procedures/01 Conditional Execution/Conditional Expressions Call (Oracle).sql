SET SERVEROUT ON
DECLARE
   comments VARCHAR(100);
BEGIN
   GetStudentComments(2, comments);
   dbms_output.put_line(comments);
END;
/
