SELECT DISTINCT Product.ProductID, Product.Name
FROM Product INNER JOIN ProductCategory
ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID IN 
   (SELECT Category.CategoryID
   FROM Category INNER JOIN ProductCategory
   ON Category.CategoryID = ProductCategory.CategoryID
   WHERE ProductCategory.ProductID = 6)
ORDER BY Name;
