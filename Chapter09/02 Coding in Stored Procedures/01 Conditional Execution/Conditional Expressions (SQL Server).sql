CREATE PROCEDURE GetStudentComments (
         @i_StudentID INT, @o_Comments VARCHAR(100) OUTPUT)
AS
BEGIN
DECLARE @exams_sat    INT;
DECLARE @avg_mark     INT;
DECLARE @tmp_comments VARCHAR(100);
SET @exams_sat = (SELECT COUNT(ExamID) FROM StudentExam
                  WHERE StudentID = @i_StudentID);
IF @exams_sat = 0
   SET @avg_mark = -1;
ELSE
   SET @avg_mark = (SELECT AVG(Mark) FROM StudentExam
                    WHERE StudentID = @i_StudentID);
   SET @tmp_comments = CASE
      WHEN @avg_mark < 0 THEN
         'n/a – this student sat no exams'
      WHEN @avg_mark < 50 THEN
         'Very poor. Needs to spend less time in the bar.'
      WHEN @avg_mark < 60 THEN
         'Adequate, but could work harder.'
      WHEN @avg_mark < 70 THEN
         'Very satisfactory. Should pass easily.'
      ELSE 'Excellent! Will pass with flying colors.'
   END;
SET @o_Comments = @tmp_comments;
END;
