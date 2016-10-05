CREATE PROCEDURE RBS_SelectPermissions
@CategoryId Int
AS
IF @CategoryId = -1
SELECT p.PermissionId, p.CategoryId, p.Description,
pc.Description as CategoryName
FROM Permissions p
INNER JOIN PermissionCategories pc
ON p.CategoryId = pc.CategoryId
ORDER BY pc.Description, p.Description
ELSE
SELECT p.PermissionId, p.CategoryId, p.Description,
pc.Description as CategoryName
FROM Permissions p
INNER JOIN PermissionCategories pc
ON p.CategoryId = pc.CategoryId
WHERE p.CategoryId = @CategoryId
ORDER BY p.Description;