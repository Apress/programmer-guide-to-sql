ALTER TRIGGER LogFriendTrigger
ON Friend
FOR INSERT, DELETE
AS  

IF EXISTS (SELECT 1 FROM Inserted) 
  BEGIN
    INSERT INTO FriendAudit (Operation, NewName, NewPhone)
      SELECT 'Insert', Inserted.Name, Inserted.PhoneNo     
      FROM Inserted
  END

ELSE IF EXISTS (SELECT 1 FROM Deleted)
  BEGIN
    INSERT INTO FriendAudit (Operation, OldName, OldPhone)
      SELECT 'Delete', Deleted.Name, Deleted.PhoneNo 
      FROM Deleted
  END;
