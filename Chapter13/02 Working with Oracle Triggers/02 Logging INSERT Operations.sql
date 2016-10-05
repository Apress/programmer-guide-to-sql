CREATE TRIGGER FriendAuditTrigger
AFTER INSERT ON Friend
FOR EACH ROW
BEGIN
  INSERT INTO FriendAudit (FriendAuditID, Operation, NewName, NewPhone)
  VALUES (FriendAuditIDSeq.NEXTVAL, 'Insert ', :NEW.Name, :NEW.PhoneNo);
END;
/
