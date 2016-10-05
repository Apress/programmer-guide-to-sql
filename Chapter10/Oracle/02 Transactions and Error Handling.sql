BEGIN

   INSERT INTO Student (StudentID, Name) VALUES (101, 'Dave');
   INSERT INTO Student (StudentID, Name) VALUES (102, 'Claire');

   SAVEPOINT BeforeAddingAnne;
   INSERT INTO Student (StudentID, Name) VALUES (103, 'Anne');
   ROLLBACK TO BeforeAddingAnne;

   COMMIT;

EXCEPTION 
   WHEN OTHERS
      THEN ROLLBACK;
END;
/
