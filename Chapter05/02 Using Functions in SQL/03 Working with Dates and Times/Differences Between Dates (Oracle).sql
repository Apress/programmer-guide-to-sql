SELECT StudentID,
       FLOOR(MAX(CURRENT_DATE - EnrolledOn)) AS DaysEnrolled
FROM Enrollment
GROUP BY StudentID
ORDER BY DaysEnrolled DESC;
