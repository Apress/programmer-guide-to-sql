CREATE TABLE Users (
UserId int IDENTITY (1, 1) NOT NULL ,
FirstName varchar (40) NOT NULL ,
LastName varchar (40) NOT NULL ,
LoginId varchar (10) NOT NULL ,
Password binary (20) ,
Address1 varchar (80) NOT NULL ,
Address2 varchar (80) NULL ,
City varchar (30) NOT NULL ,
State varchar (2) NOT NULL ,
ZipCode varchar (10) NOT NULL ,
EmailAddress varchar (255) NOT NULL
);



ALTER TABLE Users ADD
CONSTRAINT PK_Users PRIMARY KEY
(
UserId
);
