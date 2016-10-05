INSERT INTO Professor (ProfessorID, Name) 
   SELECT StudentID + 7, Name 
   FROM Student;
