CREATE TRIGGER DelFriendAuditTrig
AFTER DELETE ON Friend
REFERENCING OLD AS O
FOR EACH ROW MODE DB2SQL
BEGIN
  INSERT INTO FriendAudit (Operation, OldName, OldPhone)
  VALUES ('Delete ', O.Name, O.PhoneNo);
END
