SELECT Department.Name AS "Department", 
       Product.Name AS "Product"
FROM Department
   INNER JOIN Category
   ON Department.DepartmentID = Category.DepartmentID
   INNER JOIN ProductCategory
   ON Category.CategoryID = ProductCategory.CategoryID
   INNER JOIN Product
   ON ProductCategory.ProductID = Product.ProductID
ORDER BY Department.Name, Product.Name;
