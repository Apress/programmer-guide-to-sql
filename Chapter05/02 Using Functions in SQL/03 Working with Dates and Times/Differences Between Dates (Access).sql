SELECT StudentID, MAX(DATE() - EnrolledOn) AS DaysEnrolled
FROM Enrollment
GROUP BY StudentID
ORDER BY MAX(DATE() - EnrolledOn) DESC;
