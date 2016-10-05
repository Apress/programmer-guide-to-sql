SELECT StudentID
   FROM StudentExam
   WHERE Mark < 40
UNION ALL
SELECT StudentID
   FROM Enrollment
   WHERE GRADE < 40
ORDER BY StudentID;
