CREATE OR REPLACE TRIGGER FriendAuditTrigger
AFTER INSERT OR DELETE OR UPDATE ON Friend
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO FriendAudit (FriendAuditID, Operation, NewName, NewPhone)
    VALUES (FriendAuditIDSeq.NEXTVAL, 'Insert ', :NEW.Name, :NEW.PhoneNo);
  ELSIF DELETING THEN
    INSERT INTO FriendAudit (FriendAuditID, Operation, OldName, OldPhone)
    VALUES (FriendAuditIDSeq.NEXTVAL, 'Delete ', :OLD.Name, :OLD.PhoneNo);
  ELSIF UPDATING THEN
    INSERT INTO FriendAudit (FriendAuditID, Operation,
                             OldName, OldPhone, NewName, NewPhone)
    VALUES (FriendAuditIDSeq.NEXTVAL, 'Update ', 
            :OLD.Name, :OLD.PhoneNo, :NEW.Name, :NEW.PhoneNo);
  END IF;
END;
/
