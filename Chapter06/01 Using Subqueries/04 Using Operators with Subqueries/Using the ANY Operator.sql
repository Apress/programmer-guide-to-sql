SELECT StudentID, Grade FROM Enrollment e
WHERE Grade < ANY (
   SELECT Mark/2 FROM StudentExam s
   WHERE s.StudentID = e.StudentID);
