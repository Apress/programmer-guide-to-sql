CREATE PROCEDURE RemoveProduct
(@ProductID int, @CategoryID int)
AS

DELETE FROM ProductCategory 
WHERE CategoryID=@CategoryID AND ProductID=@ProductID

IF (SELECT COUNT(*) FROM ProductCategory 
                    WHERE ProductID=@ProductID) = 0
    DELETE FROM Product WHERE ProductID=@ProductID;
