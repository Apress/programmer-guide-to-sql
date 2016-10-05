CREATE TABLE Friend (
   Name    VARCHAR(50) PRIMARY KEY NOT NULL, 
   PhoneNo VARCHAR(15) DEFAULT 'Unknown Phone',
   Age     INT CHECK (Age BETWEEN 10 and 100));
