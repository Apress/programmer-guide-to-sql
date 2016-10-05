SELECT StudentID
   FROM StudentExam
   WHERE Mark < 40
INTERSECT
SELECT StudentID
   FROM Enrollment
   WHERE GRADE < 40
ORDER BY StudentID;
