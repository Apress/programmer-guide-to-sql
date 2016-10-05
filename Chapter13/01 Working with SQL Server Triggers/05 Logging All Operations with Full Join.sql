ALTER TRIGGER LogFriendTrigger
ON Friend
FOR INSERT, DELETE, UPDATE
AS  

INSERT INTO FriendAudit (Operation, OldName, OldPhone, NewName, NewPhone)
  SELECT 'Log', d.Name, d.PhoneNo, i.Name, i.PhoneNo
    FROM Deleted d FULL JOIN Inserted i
    ON d.Name = i.Name;
