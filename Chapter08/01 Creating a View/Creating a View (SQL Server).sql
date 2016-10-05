CREATE VIEW ClassAttendees AS
SELECT Class.ClassID, SUBSTRING(Professor.Name,
   LEN(Professor.Name) - CHARINDEX(' ', REVERSE(Professor.Name)) + 2, 100)
   + ', '
   + LEFT(Professor.Name, LEN(Professor.Name)
   - CHARINDEX(' ', REVERSE(Professor.Name)))
   AS Name, 'Professor' AS Role 
FROM Professor 
   INNER JOIN Class ON Professor.ProfessorID = 
      Class.ProfessorID
UNION 
SELECT Enrollment.ClassID, SUBSTRING(Student.Name,
       LEN(Student.Name) - CHARINDEX(' ', REVERSE(Student.Name)) + 2, 100)
       + ', '
       + LEFT(Student.Name,
              LEN(Student.Name) - CHARINDEX(' ', REVERSE(Student.Name)))
       AS Name, 'Student' 
FROM Student 
   INNER JOIN Enrollment ON Student.StudentID = 
      Enrollment.StudentID
