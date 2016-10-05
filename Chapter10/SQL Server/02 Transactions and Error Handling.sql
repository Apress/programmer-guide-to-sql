BEGIN TRANSACTION MyTransaction

INSERT INTO Student (StudentID, Name) VALUES (101, 'Dave')
IF @@ERROR != 0
BEGIN
   ROLLBACK TRANSACTION MyTransaction
   PRINT 'Cannot insert Dave! Transaction rolled back.'
   RETURN
END 

INSERT INTO Student (StudentID, Name) VALUES (102, 'Claire')
IF @@ERROR != 0
BEGIN
   ROLLBACK TRANSACTION MyTransaction
   PRINT 'Cannot insert Claire! Transaction rolled back.'
   RETURN
END 

INSERT INTO Student (StudentID, Name) VALUES (103, 'Anne')
IF @@ERROR != 0
BEGIN
   ROLLBACK TRANSACTION MyTransaction
   PRINT 'Cannot insert Anne! Transaction rolled back.'
   RETURN 
END 

COMMIT TRANSACTION MyTransaction
IF @@ERROR != 0
   PRINT 'Could not COMMIT transaction'
ELSE
   PRINT 'Transaction committed.'
