CREATE PROCEDURE RBS_SelectUsers
AS
SELECT FirstName, LastName, LoginId, UserId FROM Users
ORDER BY Lastname, FirstName