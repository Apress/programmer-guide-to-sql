CREATE PROCEDURE RBS_UpdateRole
@RoleId int,
@Description varchar(40)
AS
UPDATE Roles SET Description = @Description WHERE RoleId = @RoleId