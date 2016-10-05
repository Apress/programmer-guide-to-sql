CREATE PROCEDURE RBS_CreateRole
@Description varchar(50),
@NewRoleId int output
AS
INSERT INTO Roles(Description) VALUES(@Description)
SET @NewRoleId = @@IDENTITY