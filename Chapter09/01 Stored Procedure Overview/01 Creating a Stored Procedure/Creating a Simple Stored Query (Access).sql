CREATE PROCEDURE InsertStudent(@i_StudentID   INT,
                               @i_StudentName VARCHAR(50))
AS
INSERT INTO Student (StudentID, Name)
VALUES (@i_StudentID, @i_StudentName);
