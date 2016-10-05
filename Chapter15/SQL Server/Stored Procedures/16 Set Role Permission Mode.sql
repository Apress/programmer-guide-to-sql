CREATE PROCEDURE RBS_SetRolePermissionMode
@PermissionId int,
@RoleId int,
@Mode int
AS
DECLARE @Count int
SELECT @Count = Count(PermissionId) FROM RolePermission WHERE
RoleId = @RoleId AND PermissionId = @PermissionId
IF @Count = 0
INSERT INTO RolePermission(RoleId, PermissionId, Mode)
VALUES(@RoleId, @PermissionId, @Mode)
ELSE
UPDATE RolePermission
SET
Mode = @Mode
WHERE
PermissionId = @PermissionId AND
RoleId = @RoleId;