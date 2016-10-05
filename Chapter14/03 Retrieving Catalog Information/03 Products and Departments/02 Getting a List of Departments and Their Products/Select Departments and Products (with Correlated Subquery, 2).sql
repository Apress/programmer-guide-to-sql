SELECT D.Name AS "Department", Product.Name AS "Product"
FROM Product, Department D
WHERE ProductID IN 
     (SELECT ProductID from ProductCategory
      WHERE ProductCategory.CategoryID IN
             (SELECT CategoryID FROM Category 
              WHERE D.DepartmentID = DepartmentID))
ORDER BY D.Name, Product.Name;
