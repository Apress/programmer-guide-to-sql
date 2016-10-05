SELECT Name, 'Professor' As Role FROM Professor
   WHERE ProfessorID = (
      SELECT ProfessorID FROM Class WHERE ClassID = 1)
UNION
SELECT Name, 'Student' FROM Student
   WHERE StudentID IN (
      SELECT StudentID FROM Enrollment WHERE ClassID = 1);
