CREATE TRIGGER InsFriendAuditTrig
AFTER INSERT ON Friend
REFERENCING NEW AS N
FOR EACH ROW MODE DB2SQL
WHEN (N.Name='Peter')
BEGIN ATOMIC
  INSERT INTO FriendAudit (Operation, NewName, NewPhone)
  VALUES ('Insert ', N.Name, N.PhoneNo);
END
