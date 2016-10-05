CREATE PROCEDURE RBS_UpdatePermission
@PermissionId int,
@Description varchar(50),
@CategoryId int
AS
UPDATE Permissions
SET
Description = @Description,
CategoryId = @CategoryId
WHERE
PermissionId = @PermissionId;