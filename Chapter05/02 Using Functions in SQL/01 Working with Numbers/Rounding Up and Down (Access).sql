SELECT StudentID, AVG(Mark) AS AverageMark,
       INT(AVG(Mark)) AS RoundDown,
       ROUND(AVG(Mark) + .5, 0) AS RoundUp,
       ROUND(AVG(Mark), 0) AS ClosestInt
FROM StudentExam
GROUP BY StudentID;
