SELECT StudentID
   FROM StudentExam
   WHERE Mark < 40
MINUS
SELECT StudentID
   FROM Enrollment
   WHERE GRADE > 69
ORDER BY StudentID;
