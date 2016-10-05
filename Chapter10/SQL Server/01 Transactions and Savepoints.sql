BEGIN TRANSACTION MyTransaction;

INSERT INTO Student (StudentID, Name) VALUES (98, 'Good Student');

SAVE TRANSACTION BeforeAddingBadStudent;
INSERT INTO Student (StudentID, Name) VALUES (99, 'Bad Student');
ROLLBACK TRANSACTION BeforeAddingBadStudent;

COMMIT TRANSACTION MyTransaction;

SELECT * FROM Student;