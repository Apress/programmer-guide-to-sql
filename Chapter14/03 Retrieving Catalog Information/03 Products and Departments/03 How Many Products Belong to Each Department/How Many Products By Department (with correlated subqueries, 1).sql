SELECT D.Name AS "Department", COUNT(P.Name) AS "Products"
FROM Department D, Product P
WHERE ProductID IN 
     (SELECT ProductID 
      FROM ProductCategory INNER JOIN Category
      ON ProductCategory.CategoryID = Category.CategoryID 
      WHERE Category.DepartmentID = D.DepartmentID)
GROUP BY D.Name
ORDER BY D.Name;
