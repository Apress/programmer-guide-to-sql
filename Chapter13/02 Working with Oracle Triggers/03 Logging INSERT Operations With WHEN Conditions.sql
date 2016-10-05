CREATE OR REPLACE TRIGGER FriendAuditTrigger
AFTER INSERT ON Friend
FOR EACH ROW
WHEN (NEW.Name='Peter')
BEGIN
  INSERT INTO FriendAudit (FriendAuditID, Operation, NewName, NewPhone)
  VALUES (FriendAuditIDSeq.NEXTVAL, 'Insert ', :NEW.Name, :NEW.PhoneNo);
END;
/
