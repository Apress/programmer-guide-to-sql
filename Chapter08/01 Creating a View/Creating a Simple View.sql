CREATE VIEW StudentSummary
AS
SELECT Student.StudentID, Student.Name, 
   COUNT(*) AS ExamsTaken
FROM Student
INNER JOIN StudentExam
ON Student.StudentID = StudentExam.StudentID
GROUP BY Student.StudentID, Student.Name
