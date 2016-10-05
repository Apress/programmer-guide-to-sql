SELECT C.Name as "Category Name", Product.Name as "Product Name"
FROM Product, Category C
WHERE Product.ProductID IN
  (SELECT ProductID FROM ProductCategory 
   WHERE ProductCategory.CategoryID = C.CategoryID)
ORDER BY C.Name, Product.Name;
