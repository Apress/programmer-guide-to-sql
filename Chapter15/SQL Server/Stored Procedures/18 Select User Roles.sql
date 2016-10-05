CREATE PROCEDURE RBS_SelectUserRoles
@UserId int
AS
SELECT UserRoles.RoleId, Description, CanGrant FROM UserRoles
INNER JOIN Roles ON UserRoles.RoleId = Roles.RoleId
WHERE UserId = @UserId
ORDER BY Description;