CREATE PROCEDURE RBS_LoadRole
@RoleId int,
@Description varchar(40) output
AS
SELECT @Description = Description
FROM Roles
WHERE RoleId = @RoleId