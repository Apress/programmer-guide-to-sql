CREATE PROCEDURE DB2ADMIN.CreateProductToCategory 
(i_CategoryID INT,
 i_ProductName VARCHAR(50),
 i_ProductDescription VARCHAR(1000),
 i_ProductPrice DECIMAL(7,2),
 i_ProductImage VARCHAR(50),
 i_OnDepartmentPromotion SMALLINT,
 i_OnCatalogPromotion SMALLINT)
 
P1: BEGIN
   DECLARE pid INT;
   INSERT INTO Product 
              (Name, Description, Price, ImagePath,
               OnDepartmentPromotion, OnCatalogPromotion)
   VALUES (i_ProductName, i_ProductDescription, 
           i_ProductPrice, i_ProductImage, 
           i_OnDepartmentPromotion, i_OnCatalogPromotion);

   SET pid = IDENTITY_VAL_LOCAL();

   INSERT INTO ProductCategory (ProductID, CategoryID)
   VALUES (pid, i_CategoryID);

END P1 
