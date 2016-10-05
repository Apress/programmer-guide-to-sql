CREATE PROCEDURE AssignProductToCategory 
(@ProductID int, @CategoryID int)
AS

INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
RETURN;
