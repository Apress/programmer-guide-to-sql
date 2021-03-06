CREATE GLOBAL TEMPORARY TABLE tmp
AS
SELECT Student.Name AS StudentName, AVG(Mark) AS AverageMark
FROM StudentExam
   INNER JOIN Student
   ON StudentExam.StudentID = Student.StudentID
GROUP BY Student.Name;

INSERT INTO tmp
   SELECT Student.Name AS StudentName, AVG(Mark) AS AverageMark
   FROM StudentExam
      INNER JOIN Student
      ON StudentExam.StudentID = Student.StudentID
   GROUP BY Student.Name;

SELECT StudentName, AverageMark FROM tmp WHERE AverageMark < 50;
SELECT StudentName, AverageMark FROM tmp WHERE AverageMark > 70;
