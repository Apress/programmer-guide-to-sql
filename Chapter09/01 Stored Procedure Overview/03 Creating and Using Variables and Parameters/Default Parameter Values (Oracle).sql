CREATE OR REPLACE PROCEDURE InsertProfessor (i_ProfID IN INT,
   i_ProfName IN VARCHAR DEFAULT 'Prof. A.N. Other')
AS
BEGIN
   INSERT INTO Professor (ProfessorID, Name)
   VALUES (i_ProfID, i_ProfName);
END;
/
