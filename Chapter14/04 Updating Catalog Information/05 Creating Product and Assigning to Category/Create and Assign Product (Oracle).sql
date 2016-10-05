CREATE PROCEDURE CreateProductToCategory
(CategoryID integer,
 ProductName IN varchar2,
 ProductDescription IN varchar2)
AS
BEGIN
  INSERT INTO Product (Name, Description)
  VALUES (ProductName, ProductDescription);

  INSERT INTO ProductCategory (ProductID, CategoryID)
  VALUES (ProductID.CurrVal, CategoryID);
END;
/
