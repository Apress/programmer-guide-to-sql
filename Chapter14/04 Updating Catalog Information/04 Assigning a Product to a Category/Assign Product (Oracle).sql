CREATE PROCEDURE AssignProductToCategory
(ProdID IN integer,
 CategID IN integer)

AS
  BEGIN
    INSERT INTO ProductCategory (ProductID, CategoryID)
    VALUES (ProdID, CategID);
  END;
/
