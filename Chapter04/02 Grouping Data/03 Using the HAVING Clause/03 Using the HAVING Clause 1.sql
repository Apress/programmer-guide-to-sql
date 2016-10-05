SELECT StudentID, AVG(Mark) AS AverageMark
FROM StudentExam
GROUP BY StudentID
HAVING AVG(Mark) < 50 OR AVG(Mark) > 70;
