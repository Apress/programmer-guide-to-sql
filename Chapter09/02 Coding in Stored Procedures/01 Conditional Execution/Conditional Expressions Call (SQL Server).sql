DECLARE @comments VARCHAR(100);
EXEC GetStudentComments 12, @comments OUTPUT;
PRINT @comments;
