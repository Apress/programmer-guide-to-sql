SELECT StudentID,
       MAX(DAYS(CURRENT_DATE) - DAYS(EnrolledOn))
                                  AS DaysEnrolled
FROM Enrollment
GROUP BY StudentID
ORDER BY DaysEnrolled DESC;
