CREATE OR REPLACE PROCEDURE GetStudentName(
                                i_StudentID   IN  INT,
                                o_StudentName OUT VARCHAR)
AS
BEGIN
   SELECT Name INTO o_StudentName FROM Student
   WHERE StudentID = i_StudentID;
END;
/
