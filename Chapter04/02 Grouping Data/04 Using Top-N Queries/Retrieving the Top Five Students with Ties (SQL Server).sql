SELECT TOP 4 WITH TIES StudentID, AVG(Mark) AS AverageMark
FROM StudentExam
GROUP BY StudentID
ORDER BY AverageMark DESC;

