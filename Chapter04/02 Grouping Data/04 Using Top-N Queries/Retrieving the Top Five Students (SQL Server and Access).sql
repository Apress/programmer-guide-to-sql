SELECT TOP 5 StudentID, AVG(Mark) AS AverageMark
FROM StudentExam
GROUP BY StudentID
ORDER BY AVG(Mark) DESC;
