CREATE PROCEDURE CreateProductToCategory
(@CategoryID int,
 @ProductName varchar(50),
 @ProductDescription varchar(1000),
 @ProductPrice money,
 @ProductImage varchar(50),
 @OnDepartmentPromotion bit,
 @OnCatalogPromotion bit)
AS

DECLARE @ProductID int

INSERT INTO Product (Name, Description, Price, 
                     ImagePath, OnDepartmentPromotion, OnCatalogPromotion)
VALUES (@ProductName, @ProductDescription, CONVERT(money,@ProductPrice),
        @ProductImage, @OnDepartmentPromotion, @OnCatalogPromotion)

SELECT @ProductID = @@Identity

INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
RETURN;
