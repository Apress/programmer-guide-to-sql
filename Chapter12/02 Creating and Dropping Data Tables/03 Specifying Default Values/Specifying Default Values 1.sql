DROP TABLE Friend;

CREATE TABLE Friend (
   Name    VARCHAR(50) NOT NULL, 
   PhoneNo VARCHAR(15) DEFAULT 'Unknown Phone' NOT NULL);

INSERT INTO Friend (Name, PhoneNo) VALUES ('John Doe', '555 2323');
INSERT INTO Friend (Name) VALUES ('John Doe');
INSERT INTO Friend (Name, PhoneNo) VALUES ('John Doe', NULL);
