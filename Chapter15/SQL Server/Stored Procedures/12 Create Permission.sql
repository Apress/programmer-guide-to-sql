CREATE PROCEDURE RBS_CreatePermission
@Description varchar(50),
@NewPermissionId int output
AS
INSERT INTO Permissions(Description) VALUES(@Description)
SET @NewPermissionId = @@IDENTITY