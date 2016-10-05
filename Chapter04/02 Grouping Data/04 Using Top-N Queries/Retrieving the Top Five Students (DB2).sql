SELECT StudentID, AVG(Mark) AS AverageMark
FROM StudentExam
GROUP BY StudentID
ORDER BY AverageMark DESC
FETCH FIRST 5 ROWS ONLY;
