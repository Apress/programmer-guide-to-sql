CREATE PROCEDURE DB2ADMIN.InsertStudent (
      i_StudentID   INT, 
      i_StudentName VARCHAR(50))
P1: BEGIN
   INSERT INTO Student (StudentID, Name)
   VALUES (i_StudentID, i_StudentName);
END P1
