CREATE PROCEDURE GetStudentName(
                       @i_StudentID   INT,
                       @o_StudentName VARCHAR(50) OUTPUT)
AS
BEGIN
   SET @o_StudentName = (SELECT Name FROM Student
                         WHERE StudentID = @i_StudentID);
END;
