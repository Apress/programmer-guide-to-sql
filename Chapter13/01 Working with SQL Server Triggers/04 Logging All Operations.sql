ALTER TRIGGER LogFriendTrigger
ON Friend
FOR INSERT, DELETE, UPDATE
AS  

IF EXISTS (SELECT 1 FROM Inserted) AND EXISTS (SELECT 1 FROM DELETED)
  BEGIN
   INSERT INTO FriendAudit (Operation, OldName, OldPhone, NewName, NewPhone)
      SELECT 'Update', d.Name, d.PhoneNo, i.Name, i.PhoneNo
      FROM Deleted d JOIN Inserted i
      ON d.Name = i.Name
   PRINT 'Update Logged'
  END
ELSE IF EXISTS (SELECT 1 FROM Inserted) 
  BEGIN
    INSERT INTO FriendAudit (Operation, NewName, NewPhone)
      SELECT 'Insert', Inserted.Name, Inserted.PhoneNo     
      FROM Inserted
    PRINT 'Insert Logged'
  END
ELSE IF EXISTS (SELECT 1 FROM Deleted)
  BEGIN
    INSERT INTO FriendAudit (Operation, OldName, OldPhone)
      SELECT 'Delete', Deleted.Name, Deleted.PhoneNo 
      FROM Deleted
    PRINT 'Delete Logged'
  END;
