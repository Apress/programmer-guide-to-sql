CREATE PROCEDURE DB2ADMIN.AssignProductToCategory 
(i_ProductID INT, 
 i_CategoryID INT )
P1: BEGIN
   INSERT INTO ProductCategory (ProductID, CategoryID)
   VALUES (i_ProductID, i_CategoryID);
END P1  
