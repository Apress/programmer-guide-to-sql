DECLARE @ProfName VARCHAR(50);
DECLARE @StudentName VARCHAR(50);
DECLARE @ProfID INT;
DECLARE cur_profs CURSOR FOR
   SELECT ProfessorID, Name FROM Professor;
OPEN cur_profs;
FETCH NEXT FROM cur_profs INTO @ProfID, @ProfName;
WHILE @@FETCH_STATUS = 0
BEGIN
   PRINT @ProfName;
   DECLARE cur_students CURSOR FOR
      SELECT DISTINCT Name FROM Student s
      INNER JOIN Enrollment e
      ON s.StudentID = e.StudentID
         INNER JOIN Class c
         ON e.ClassID = c.ClassID
      WHERE c.ProfessorID = @ProfID;
   OPEN cur_students;
   FETCH NEXT FROM cur_students INTO @StudentName;
   WHILE @@FETCH_STATUS = 0
   BEGIN
      PRINT @StudentName;
      FETCH NEXT FROM cur_students INTO @StudentName;
   END
   CLOSE cur_students;
   DEALLOCATE cur_students;
   PRINT '---------------';
   FETCH NEXT FROM cur_profs INTO @ProfID, @ProfName;
END
CLOSE cur_profs;
DEALLOCATE cur_profs;
