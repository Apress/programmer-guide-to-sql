WITH RankedMarks (Ranking, StudentID, AverageMark)
AS (
   SELECT RANK() OVER (ORDER BY AVG(Mark) DESC) AS Ranking,
          StudentID, AVG(Mark) As AverageMark
   FROM StudentExam
   GROUP BY StudentID)
SELECT Ranking, StudentID, AverageMark
FROM RankedMarks
WHERE Ranking <= 4;
