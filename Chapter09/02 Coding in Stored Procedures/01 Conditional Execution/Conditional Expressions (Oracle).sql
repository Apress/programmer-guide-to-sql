CREATE OR REPLACE PROCEDURE GetStudentComments(
                                   i_StudentID IN  INT,
                                   o_Comments  OUT VARCHAR)
AS
   exams_sat    INT;
   avg_mark     INT;
   tmp_comments VARCHAR(100);
BEGIN
SELECT COUNT(ExamID) INTO exams_sat FROM StudentExam
   WHERE StudentID = i_StudentID;
IF exams_sat = 0 THEN
   tmp_comments := 'n/a - this student sat no exams';
ELSE
   SELECT AVG(Mark) INTO avg_mark FROM StudentExam
   WHERE StudentID = i_StudentID;
   CASE
      WHEN avg_mark < 50 THEN tmp_comments :=
         'Very poor. Needs to spend less time in the bar.';
      WHEN avg_mark < 60 THEN tmp_comments :=
         'Adequate, but could work harder.';
      WHEN avg_mark < 70 THEN tmp_comments :=
         'Very satisfactory. Should pass easily.';
      ELSE tmp_comments :=
         'Excellent! Will pass with flying colors.';
   END CASE;
END IF;
o_Comments := tmp_comments;
END;
/
