CREATE PROCEDURE InsertProfessor (
   @i_ProfID INT,
   @i_ProfName VARCHAR(50) = 'Prof. A.N. Other')
AS
   INSERT INTO Professor (ProfessorID, Name)
   VALUES (@i_ProfID, @i_ProfName);
