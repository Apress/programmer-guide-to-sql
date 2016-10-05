CREATE PROCEDURE RBS_LoadUser
@UserId int,
@Loginid varchar(10) output,
@FirstName varchar(40) output,
@LastName varchar(40) output,
@Address1 varchar(80) output,
@Address2 varchar(80) output,
@City varchar(30) output,
@State varchar(2) output,
@ZipCode varchar(10) output,
@EmailAddress varchar(255) output
AS
SELECT
@LoginId = loginid,
@FirstName = FirstName,
@LastName = LastName,
@Address1 = Address1,
@Address2 = Address2,
@City = City,
@State = State,
@ZipCode = ZipCode,
@EmailAddress = EmailAddress
FROM Users
WHERE
UserId = @UserId