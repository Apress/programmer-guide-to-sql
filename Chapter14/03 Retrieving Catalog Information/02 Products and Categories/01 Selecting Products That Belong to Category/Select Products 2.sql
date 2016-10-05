SELECT Name
FROM Product, ProductCategory
WHERE Product.ProductID = ProductCategory.ProductID
AND ProductCategory.CategoryID = 3;
