CREATE PROCEDURE RBS_DeleteUser
@UserID int
AS
DELETE Users WHERE UserId = @UserId