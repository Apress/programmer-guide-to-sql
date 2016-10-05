SELECT StudentExam.ExamID,
       StudentExam.Mark,
       Student.Name AS StudentName
FROM StudentExam, Student
WHERE StudentExam.StudentID = Student.StudentID
ORDER BY ExamID;
