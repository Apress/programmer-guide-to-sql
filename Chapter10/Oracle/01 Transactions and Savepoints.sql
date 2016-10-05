INSERT INTO Student (StudentID, Name) VALUES (98, 'Good Student');

SAVEPOINT BeforeAddingBadStudent;
INSERT INTO Student (StudentID, Name) VALUES (99, 'Bad Student');
ROLLBACK TO BeforeAddingBadStudent;

COMMIT;
