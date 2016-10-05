SELECT D.Name AS "Department", 
     (SELECT COUNT(ProductID)
      FROM ProductCategory INNER JOIN Category
      ON ProductCategory.CategoryID = Category.CategoryID 
      WHERE Category.DepartmentID = D.DepartmentID) AS "Products"
FROM Department D;
