CREATE TABLE Friend (
   Name    VARCHAR(50) PRIMARY KEY NOT NULL, 
   PhoneNo VARCHAR(15) DEFAULT 'Unknown Phone',
   SSN     VARCHAR(15) NOT NULL,
   CHECK (SSN LIKE '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'));
