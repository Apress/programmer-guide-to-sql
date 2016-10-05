CREATE PROCEDURE DB2ADMIN.GetStudentComments (
           IN i_StudentID INT, OUT o_Comments VARCHAR(100))
P1: BEGIN
DECLARE exams_sat    INT;
DECLARE avg_mark     INT;
DECLARE tmp_comments VARCHAR(100);
SET exams_sat = (SELECT COUNT(ExamID) FROM StudentExam
                 WHERE StudentID = i_StudentID);
IF exams_sat = 0 THEN
   SET tmp_comments = 'n/a - this student sat no exams';
ELSE
   SET avg_mark = (SELECT AVG(Mark) FROM StudentExam
                   WHERE StudentID = i_StudentID);
   CASE
      WHEN avg_mark < 50 THEN SET tmp_comments = 
         'Very poor. Needs to spend less time in the bar.';
      WHEN avg_mark < 60 THEN SET tmp_comments = 
         'Adequate, but could work harder.';
      WHEN avg_mark < 70 THEN SET tmp_comments = 
         'Very satisfactory. Should pass easily.';
      ELSE SET tmp_comments = 
         'Excellent! Will pass with flying colors';
   END CASE;
END IF;
SET o_Comments = tmp_comments;
END P1
