CREATE OR REPLACE PROCEDURE RemoveProduct
(ProdID int, CategID int)
AS

BEGIN
  DECLARE 
    CategoriesCount integer;
  BEGIN
    DELETE FROM ProductCategory 
    WHERE CategoryID = CategID AND ProductID = ProdID;

    SELECT COUNT(*) INTO CategoriesCount FROM ProductCategory 
      WHERE ProductID = ProdID;

    IF CategoriesCount = 0 THEN
      DELETE FROM Product WHERE ProductID = ProdID;
    END IF;
  END;
END;
/
