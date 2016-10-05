SELECT StudentID,
       MAX(TO_DAYS(CURRENT_DATE) - TO_DAYS(EnrolledOn))
                                        AS DaysEnrolled
FROM Enrollment
GROUP BY StudentID
ORDER BY DaysEnrolled DESC;
