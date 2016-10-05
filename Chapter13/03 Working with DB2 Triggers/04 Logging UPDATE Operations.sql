CREATE TRIGGER UpdFriendAuditTrig
AFTER UPDATE ON Friend
REFERENCING OLD AS O NEW AS N
FOR EACH ROW MODE DB2SQL
BEGIN ATOMIC
  INSERT INTO FriendAudit (Operation, OldName, OldPhone, NewName, NewPhone)
  VALUES ('Update ', O.Name, O.PhoneNo, N.Name, N.PhoneNo);
END
