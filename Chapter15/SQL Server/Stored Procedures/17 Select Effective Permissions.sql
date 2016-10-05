CREATE PROCEDURE RBS_SelectEffectivePermissions
@UserId int
AS
SELECT RolePermission.PermissionId,
Max(Mode) as Mode,
Description
FROM RolePermission
INNER JOIN UserRoles On RolePermission.RoleId = UserRoles.RoleId
INNER JOIN Permissions ON RolePermission.PermissionId =
Permissions.PermissionId
WHERE UserRoles.UserId = @UserId
GROUP BY RolePermission.PermissionId, Permissions.Description;