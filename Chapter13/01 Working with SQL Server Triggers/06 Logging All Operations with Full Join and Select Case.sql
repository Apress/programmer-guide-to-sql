ALTER TRIGGER LogFriendTrigger
ON Friend
FOR INSERT, DELETE, UPDATE
AS  

DECLARE @Operation TINYINT 
SELECT @Operation=0
IF EXISTS (SELECT 1 FROM Inserted) SELECT @Operation = @Operation + 1
IF EXISTS (SELECT 2 FROM Deleted) SELECT @Operation = @Operation + 2

INSERT INTO FriendAudit (Operation, OldName, OldPhone, NewName, NewPhone)
  SELECT CASE @Operation        
           WHEN 1 THEN 'Insert'          
           WHEN 2 THEN 'Delete'
           WHEN 3 THEN 'Update' 
         END, 
         d.Name, d.PhoneNo, i.Name, i.PhoneNo
    FROM Deleted d FULL JOIN Inserted i
    ON d.Name = i.Name;
