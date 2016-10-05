SELECT StudentID, Name,
   (SELECT COUNT(*) FROM StudentExam
    WHERE StudentExam.StudentID = Student.StudentID)
    AS ExamsTaken
FROM Student
ORDER BY ExamsTaken DESC;
