SELECT e1.StudentID, e1.ClassID, (
   SELECT COUNT(*) FROM Enrollment e2
   WHERE e1.ClassID = e2.ClassID)—1
   AS OtherStudentsInClass
FROM Enrollment e1
WHERE StudentID = 6;
