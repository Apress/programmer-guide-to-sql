SELECT C.Name AS "Category", Product.Name AS "Product",
       Product.Price as "Price"
FROM Product, Category C
WHERE Product.ProductID IN
  (SELECT TOP 2 ProductID FROM ProductCategory 
   WHERE ProductCategory.CategoryID = C.CategoryID
   ORDER BY Price DESC)
ORDER BY C.Name, Product.Price DESC;
