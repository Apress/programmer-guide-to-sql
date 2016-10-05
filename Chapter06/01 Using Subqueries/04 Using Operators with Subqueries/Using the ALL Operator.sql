SELECT StudentID, Grade FROM Enrollment e
WHERE Grade > ALL (
   SELECT Mark FROM StudentExam s
   WHERE s.StudentID = e.StudentID);
