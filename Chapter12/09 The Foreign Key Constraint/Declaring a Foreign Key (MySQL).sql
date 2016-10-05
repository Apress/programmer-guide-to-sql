CREATE TABLE Phone (
   PhoneID INT PRIMARY KEY NOT NULL,
   FriendID INT,
   PhoneNo VARCHAR(20),
   FOREIGN KEY(FriendID) REFERENCES Friend(FriendID),
   INDEX idx1(FriendID))
TYPE=InnoDB;
