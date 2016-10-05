SELECT StudentExam.ExamID, 
       StudentExam.Mark, 
       Exam.SustainedOn, 
       student.Name
FROM Exam 
   INNER JOIN (student 
      INNER JOIN StudentExam ON student.StudentID = StudentExam.StudentID) 
   ON Exam.ExamID = StudentExam.ExamID
ORDER BY StudentExam.ExamID;
