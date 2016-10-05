SELECT Department.Name AS "Department", 
       COUNT(Product.Name) AS "Featured Products"
FROM Product 
   INNER JOIN ProductCategory 
   ON Product.ProductID = ProductCategory.ProductID
   INNER JOIN Category 
   ON ProductCategory.CategoryID = Category.CategoryID
   INNER JOIN Department 
   ON Category.DepartmentID = Department.DepartmentID
WHERE Product.OnDepartmentPromotion = 1
GROUP BY Department.Name
ORDER BY Department.Name;
