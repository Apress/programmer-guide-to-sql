SELECT StudentID, Name FROM Student s
WHERE EXISTS (
   SELECT StudentID FROM StudentExam e
   WHERE Mark < 40 AND e.StudentID = s.StudentID);
