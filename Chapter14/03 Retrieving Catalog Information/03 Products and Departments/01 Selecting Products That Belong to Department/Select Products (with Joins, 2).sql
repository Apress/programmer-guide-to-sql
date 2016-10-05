SELECT Product.ProductID, Product.Name
FROM Product, ProductCategory, Category
WHERE Product.ProductID = ProductCategory.ProductID
   AND ProductCategory.CategoryID = Category.CategoryID
   AND Category.DepartmentID = 1
ORDER BY Product.Name;
