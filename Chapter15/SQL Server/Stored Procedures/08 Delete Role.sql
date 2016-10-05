CREATE PROCEDURE RBS_DeleteRole
@RoleId int
AS
DELETE Roles WHERE RoleId = @RoleId