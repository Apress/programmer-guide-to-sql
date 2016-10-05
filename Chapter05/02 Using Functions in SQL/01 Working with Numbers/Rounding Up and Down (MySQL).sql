SELECT StudentID, AVG(Mark) AS AverageMark,
       FLOOR(AVG(Mark)) AS RoundDown,
       CEILING(AVG(Mark)) AS RoundUp,
       ROUND(AVG(Mark), 0) AS ClosestInt
FROM StudentExam
GROUP BY StudentID;
