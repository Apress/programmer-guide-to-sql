SELECT C.Name as "Category Name", P.Name as "Product Name"
FROM Product P, ProductCategory PC, Category C
WHERE P.ProductID = PC.ProductID AND PC.CategoryID = C.CategoryID
ORDER BY C.Name, P.Name;
