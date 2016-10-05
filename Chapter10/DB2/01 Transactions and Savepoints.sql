INSERT INTO Student (StudentID, Name) VALUES (98, 'Good Student');

SAVEPOINT BeforeAddingBadStudent ON ROLLBACK RETAIN CURSORS;
INSERT INTO Student (StudentID, Name) VALUES (99, 'Bad Student');
ROLLBACK TO SAVEPOINT BeforeAddingBadStudent;

COMMIT;
