CREATE SEQUENCE FriendIDSeq;

CREATE TABLE Friend (
   FriendID INT PRIMARY KEY NOT NULL,
   Name VARCHAR(50), 
   PhoneNo VARCHAR(15) DEFAULT 'Unknown Phone');

INSERT INTO Friend (FriendID, Name, PhoneNo) 
            VALUES (FriendIDSeq.NextVal, 'Mike', '123');
INSERT INTO Friend (FriendID, Name, PhoneNo) 
            VALUES (FriendIDSeq.NextVal, 'John', '456');
INSERT INTO Friend (FriendID, Name, PhoneNo) 
            VALUES (FriendIDSeq.NextVal, 'Cath', '789');

SELECT * FROM Friend;