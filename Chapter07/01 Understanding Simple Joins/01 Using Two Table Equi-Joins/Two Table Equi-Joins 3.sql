SELECT StudentExam.ExamID,
       StudentExam.Mark,
       Student.Name AS StudentName
FROM StudentExam JOIN Student
ON StudentExam.StudentID = Student.StudentID
WHERE StudentExam.Mark >= 80
ORDER BY ExamID;
