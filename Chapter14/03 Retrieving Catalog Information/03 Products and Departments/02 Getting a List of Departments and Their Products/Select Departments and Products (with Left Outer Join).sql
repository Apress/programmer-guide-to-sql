SELECT Department.Name AS "Department", 
       Product.Name AS "Product"
FROM Department
   LEFT JOIN Category
   ON Department.DepartmentID = Category.DepartmentID
   LEFT JOIN ProductCategory
   ON Category.CategoryID = ProductCategory.CategoryID
   LEFT JOIN Product
   ON ProductCategory.ProductID = Product.ProductID
ORDER BY Department.Name, Product.Name;
