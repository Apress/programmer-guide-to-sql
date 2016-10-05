CREATE PROCEDURE GetStudentName(i_StudentID INT,
                            OUT o_StudentName VARCHAR(50))
P1: BEGIN
   SET o_StudentName = (SELECT Name FROM Student
                        WHERE StudentID = i_StudentID);
END P1
