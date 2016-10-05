SELECT StudentID, AVG(Mark) AS AverageMark
FROM StudentExam
WHERE ExamID IN ( 5, 8, 11 )
GROUP BY StudentID
HAVING AVG(Mark) < 50 OR AVG(Mark) > 70;
