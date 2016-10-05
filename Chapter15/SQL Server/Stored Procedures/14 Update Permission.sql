CREATE PROCEDURE RBS_LoadPermission
@PermissionId int,
@Description varchar(50) output,
@CategoryName varchar(50) output,
@CategoryId int output
AS
SELECT @Description = p.Description,
@CategoryId = p.CategoryId,
@CategoryName = pc.Description
FROM
Permissions p
INNER JOIN PermissionCategories pc
ON p.CategoryId = pc.CategoryId
WHERE p.PermissionId = @PermissionId;