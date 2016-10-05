CREATE OR REPLACE PROCEDURE InsertStudent(
                                  i_StudentID   IN INT,
                                  i_StudentName IN VARCHAR)
AS
BEGIN
   INSERT INTO Student (StudentID, Name)
   VALUES (i_StudentID, i_StudentName);
END;
/
