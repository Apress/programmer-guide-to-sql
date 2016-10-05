SELECT Name
FROM Product INNER JOIN ProductCategory
ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = 3;
