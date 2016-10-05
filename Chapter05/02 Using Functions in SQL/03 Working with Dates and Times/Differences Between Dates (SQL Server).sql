SELECT StudentID, MAX(DATEDIFF(dd, EnrolledOn, GETDATE()))
                                           AS DaysEnrolled
FROM Enrollment
GROUP BY StudentID
ORDER BY DaysEnrolled DESC;
