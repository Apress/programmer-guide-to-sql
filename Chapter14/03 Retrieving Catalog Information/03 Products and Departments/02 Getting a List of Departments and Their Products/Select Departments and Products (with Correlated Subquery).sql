SELECT D.Name AS "Department", P.Name AS "Product"
FROM Product P, Department D
WHERE ProductID IN 
     (SELECT ProductID 
      FROM ProductCategory INNER JOIN Category
      ON ProductCategory.CategoryID = Category.CategoryID 
      WHERE Category.DepartmentID = D.DepartmentID)
ORDER BY D.Name, P.Name;
