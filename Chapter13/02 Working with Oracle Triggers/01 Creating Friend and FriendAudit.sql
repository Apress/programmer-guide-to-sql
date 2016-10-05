CREATE TABLE Friend (Name VARCHAR(50) PRIMARY KEY NOT NULL, 
                     PhoneNo VARCHAR(15));

CREATE TABLE FriendAudit
(FriendAuditID INT PRIMARY KEY NOT NULL,
 Operation VARCHAR(10),
 RecordedOn DATE DEFAULT SysDate, 
 OldName VARCHAR(50),
 NewName VARCHAR(50),
 OldPhone VARCHAR(15),
 NewPhone VARCHAR(15));
