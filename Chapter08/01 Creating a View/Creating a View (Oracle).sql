CREATE VIEW ClassAttendees AS
SELECT Class.ClassID, 
   SUBSTR(Professor.Name, INSTR(Professor.Name, ' ') + 1)
          || ', '
          || SUBSTR(Professor.Name, 1, 
             INSTR(Professor.Name, ' ') - 1)
   AS Name, 'Professor' AS Role 
FROM Professor 
   INNER JOIN Class ON Professor.ProfessorID = 
      Class.ProfessorID
UNION 
SELECT Enrollment.ClassID, 
   SUBSTR(Student.Name, INSTR(Student.Name, ' ') + 1)
          || ', '
          || SUBSTR(Student.Name, 1, 
             INSTR(Student.Name, ' ') - 1)
   AS Name, 'Student' 
FROM Student
   INNER JOIN Enrollment ON Student.StudentID = Enrollment.StudentID;
