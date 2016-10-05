SELECT Department.Name AS "Department", 
       COUNT(Product.Name) AS "Products"
FROM Product 
   INNER JOIN ProductCategory 
   ON Product.ProductID = ProductCategory.ProductID
   INNER JOIN Category 
   ON ProductCategory.CategoryID = Category.CategoryID
   INNER JOIN Department 
   ON Category.DepartmentID = Department.DepartmentID
GROUP BY Department.Name
ORDER BY Department.Name;
