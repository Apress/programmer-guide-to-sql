CREATE VIEW ClassAttendees AS
SELECT Class.ClassID AS ClassID, 
   SUBSTR(Professor.Name, POSSTR(Professor.Name, ' ') + 1)
         || ', ' 
         || SUBSTR(Professor.Name, 1, 
               POSSTR(Professor.Name, ' ') - 1)
   AS Name, 'Professor' AS Role
FROM Professor 
   INNER JOIN Class ON Professor.ProfessorID = 
      Class.ProfessorID
UNION 
SELECT Enrollment.ClassID AS ClassID,
   SUBSTR(Student.Name, POSSTR(Student.Name, ' ') + 1) || ', ' ||
   SUBSTR(Student.Name, 1, POSSTR(Student.Name, ' ') - 1)
   AS Name, 'Student' AS Role FROM Student INNER JOIN Enrollment
ON Student.StudentID = Enrollment.StudentID;
