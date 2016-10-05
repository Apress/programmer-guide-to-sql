CREATE PROCEDURE RBS_CreateUser
@loginid varchar(10),
@FirstName varchar(40),
@LastName varchar(40),
@Password binary(20),
@Address1 varchar(80),
@Address2 varchar(80),
@City varchar(30),
@State varchar(20),
@ZipCode varchar(10),
@EmailAddress varchar(255),
@NewUserId int output
AS
INSERT INTO Users(loginid, firstname, lastname, password,
address1, address2, city, state, zipcode,
emailaddress)
VALUES(@loginid, @FirstName, @LastName, @Password,
@Address1, @Address2, @City, @State, @ZipCode,
@EmailAddress)
SET @NewUserId = @@IDENTITY