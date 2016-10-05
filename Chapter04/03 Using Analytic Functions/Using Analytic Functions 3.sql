SELECT StudentID, Mark, AVG(Mark) OVER
(PARTITION BY StudentID
 ORDER BY StudentID, Mark) Running_Avg_by_Student
FROM StudentExam
ORDER BY StudentID, Mark;
