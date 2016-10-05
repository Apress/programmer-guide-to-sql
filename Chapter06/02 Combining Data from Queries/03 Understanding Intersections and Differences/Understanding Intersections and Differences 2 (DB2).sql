SELECT StudentID
   FROM StudentExam
   WHERE Mark < 40
EXCEPT
SELECT StudentID
   FROM Enrollment
   WHERE GRADE > 69
ORDER BY StudentID;
