CREATE USER TEMPORARY TABLESPACE IUTemp
   MANAGED BY SYSTEM USING ('C:\IUTemp_tbsp');
DECLARE GLOBAL TEMPORARY TABLE tmp (
   StudentName VARCHAR(50), AverageMark INT) IN IUTemp;

INSERT INTO SESSION.tmp
   SELECT Student.Name AS StudentName, AVG(Mark) AS AverageMark
   FROM StudentExam
      INNER JOIN Student
      ON StudentExam.StudentID = Student.StudentID
   GROUP BY Student.Name;

SELECT StudentName, AverageMark FROM SESSION.tmp WHERE AverageMark < 50;
SELECT StudentName, AverageMark FROM SESSION.tmp WHERE AverageMark > 70;
