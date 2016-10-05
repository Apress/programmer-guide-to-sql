CREATE PROCEDURE RBS_UpdateUser
@UserId int,
@loginid varchar(10),
@Password binary(20),
@FirstName varchar(40),
@LastName varchar(40),
@Address1 varchar(80),
@Address2 varchar(80),
@City varchar(30),
@State varchar(2),
@ZipCode varchar(10),
@EmailAddress varchar(255)
AS
UPDATE Users SET
loginid = @loginid,
Password = @Password,
FirstName = @FirstName,
LastName = @LastName,
Address1 = @Address1,
Address2 = @Address2,
City = @City,
State = @State,
ZipCode = @ZipCode,
EmailAddress = @EmailAddress
WHERE UserId = @UserID