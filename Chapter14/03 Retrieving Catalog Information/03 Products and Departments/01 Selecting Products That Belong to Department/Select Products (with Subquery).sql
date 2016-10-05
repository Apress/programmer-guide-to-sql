SELECT Product.ProductID, Product.Name
FROM Product INNER JOIN ProductCategory
ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID IN
   (SELECT CategoryID 
    FROM Category
    WHERE DepartmentID = 1)
 ORDER BY Product.Name;
