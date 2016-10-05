SELECT StudentExam.ExamID,
       StudentExam.Mark,
       Exam.SustainedOn,
       Student.Name AS StudentName
FROM StudentExam 
   INNER JOIN Student
   ON StudentExam.StudentID = Student.StudentID
   JOIN Exam
   ON StudentExam.ExamID = Exam.ExamID
ORDER BY StudentExam.ExamID;
