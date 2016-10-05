SELECT Product.ProductID, Product.Name
FROM Product
   INNER JOIN ProductCategory 
   ON Product.ProductID = ProductCategory.ProductID
   INNER JOIN Category 
   ON ProductCategory.CategoryID = Category.CategoryID
WHERE Category.DepartmentID = 1
ORDER BY Product.Name;
