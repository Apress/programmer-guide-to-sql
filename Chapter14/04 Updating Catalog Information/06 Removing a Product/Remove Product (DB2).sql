CREATE PROCEDURE DB2ADMIN.RemoveProduct 
( i_ProductID INT,
 i_CategoryID INT)
 
P1: BEGIN
   DELETE FROM ProductCategory 
   WHERE CategoryID = i_CategoryID AND 
         ProductID = i_ProductID;
   IF (SELECT COUNT(*) FROM ProductCategory 
       WHERE ProductID = i_ProductID) = 0 
   THEN
      DELETE FROM Product WHERE ProductID = i_ProductID;
   END IF;
END P1
