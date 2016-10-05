CREATE OR REPLACE PACKAGE BODY student_pkg
AS
   PROCEDURE GetStudents(o_StudCur OUT studCur)
   IS
   BEGIN
      OPEN o_StudCur FOR
         SELECT StudentID, Name FROM Student;
   END GetStudents;
END student_pkg;
/