CREATE PROCEDURE RBS_ValidateLogin
@loginid varchar(10),
@password binary(20),
@FirstName varchar(40) output,
@LastName varchar(40) output
AS
DECLARE @UserId int
SELECT @UserId = UserId, @FirstName = firstname, @LastName = lastname
FROM Users
WHERE loginid = @loginid AND password = @password
IF @UserId IS NOT NULL
RETURN @UserId
ELSE
RETURN -1