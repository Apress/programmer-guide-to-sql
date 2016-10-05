SELECT StudentID, AVG(Mark) AS AverageMark
FROM StudentExam
GROUP BY StudentID
ORDER BY AverageMark DESC
LIMIT 0, 5;
