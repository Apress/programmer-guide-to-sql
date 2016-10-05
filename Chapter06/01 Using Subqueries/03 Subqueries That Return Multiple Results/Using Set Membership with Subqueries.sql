SELECT StudentID, Name FROM Student WHERE StudentID IN
  (SELECT StudentID FROM Enrollment WHERE ClassID IN
    (SELECT ClassID FROM Class WHERE ProfessorID IN
      (SELECT ProfessorID FROM Professor
      WHERE Name LIKE '%Williams%')));
