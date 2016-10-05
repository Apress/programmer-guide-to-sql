SELECT StudentID, AVG(CAST(Mark AS FLOAT)) AS AverageMark,
       FLOOR(AVG(CAST(Mark AS FLOAT))) AS RoundDown,
       CEIL(AVG(CAST(Mark AS FLOAT))) AS RoundUp,
       ROUND(AVG(CAST(Mark AS FLOAT)), 0) AS ClosestInt
FROM StudentExam
GROUP BY StudentID;
