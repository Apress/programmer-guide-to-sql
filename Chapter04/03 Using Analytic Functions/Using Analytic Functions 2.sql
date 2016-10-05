SELECT StudentID, Mark, AVG(Mark) OVER
(ORDER BY StudentID, Mark) Running_Average
FROM StudentExam
ORDER BY StudentID, Mark;
