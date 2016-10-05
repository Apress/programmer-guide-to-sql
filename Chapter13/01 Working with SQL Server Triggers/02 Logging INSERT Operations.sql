CREATE TRIGGER LogFriendTrigger
ON Friend
FOR INSERT

AS  
DECLARE @NewName VARCHAR(50)
DECLARE @NewPhone VARCHAR(15)

SELECT @NewName=Name FROM Inserted 
SELECT @NewPhone=PhoneNo FROM Inserted 

INSERT INTO FriendAudit (Operation, NewName, NewPhone)
VALUES ('Insert',@NewName,@NewPhone);
