SELECT Ranking, StudentID, AverageMark FROM (
   SELECT RANK() OVER (ORDER BY AVG(Mark) DESC) AS Ranking,
          StudentID, AVG(Mark) AS AverageMark
   FROM StudentExam
   GROUP BY StudentID)
WHERE Ranking <= 4;
