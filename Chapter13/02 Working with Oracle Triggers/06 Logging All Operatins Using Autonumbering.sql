CREATE OR REPLACE TRIGGER FriendAuditTrigger
AFTER INSERT OR DELETE OR UPDATE ON Friend
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO FriendAudit (Operation, NewName, NewPhone)
    VALUES ('Insert ', :NEW.Name, :NEW.PhoneNo);
  ELSIF DELETING THEN
    INSERT INTO FriendAudit (Operation, OldName, OldPhone)
    VALUES ('Delete ', :OLD.Name, :OLD.PhoneNo);
  ELSIF UPDATING THEN
    INSERT INTO FriendAudit (Operation, OldName, OldPhone, NewName, NewPhone)
    VALUES ('Update ', :OLD.Name, :OLD.PhoneNo, :NEW.Name, :NEW.PhoneNo);
  END IF;
END;
/
