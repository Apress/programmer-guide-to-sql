SELECT StudentID, Mark,
       (Mark * 100) / 80.0 AS ActualPercentage, IfPassed,
       Comments
FROM StudentExam
WHERE ExamID = 3;
