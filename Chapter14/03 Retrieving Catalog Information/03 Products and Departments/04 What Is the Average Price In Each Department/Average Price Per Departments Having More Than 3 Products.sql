SELECT Department.Name AS "Department", 
       COUNT(Product.Name) AS "Products",
       AVG(Product.Price) AS "Average Price"
FROM Product 
   INNER JOIN ProductCategory 
   ON Product.ProductID = ProductCategory.ProductID
   INNER JOIN Category 
   ON ProductCategory.CategoryID = Category.CategoryID
   INNER JOIN Department 
   ON Category.DepartmentID = Department.DepartmentID
GROUP BY Department.Name
HAVING COUNT(Product.Price)>=3
ORDER BY AVG(Product.Price) DESC;
