SELECT Department.Name AS "Department", 
       AVG(Product.Price) AS "Average Price"
FROM Product 
   INNER JOIN ProductCategory 
   ON Product.ProductID = ProductCategory.ProductID
   INNER JOIN Category 
   ON ProductCategory.CategoryID = Category.CategoryID
   INNER JOIN Department 
   ON Category.DepartmentID = Department.DepartmentID
GROUP BY Department.Name;
