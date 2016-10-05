DECLARE @StudentName varchar(50);
EXEC GetStudentName 4, @StudentName OUTPUT;
PRINT @StudentName;
