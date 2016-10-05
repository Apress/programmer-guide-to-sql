SELECT SE.ExamID,
       SE.Mark,
       S.Name AS StudentName
FROM StudentExam AS SE 
   JOIN Student AS S
   ON SE.StudentID = S.StudentID
ORDER BY ExamID
