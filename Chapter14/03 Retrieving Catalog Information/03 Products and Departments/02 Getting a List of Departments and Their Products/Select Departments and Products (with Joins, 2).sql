SELECT Department.Name AS "Department", 
       Product.Name AS "Product"
FROM Product, ProductCategory, Category, Department
WHERE Product.ProductID = ProductCategory.ProductID
  AND ProductCategory.CategoryID = Category.CategoryID
  AND Category.DepartmentID = Department.DepartmentID
ORDER BY Department.Name, Product.Name;
