SELECT StudentID, Mark, AVG(Mark) OVER
() Average_Mark
FROM StudentExam
ORDER BY StudentID, Mark;
