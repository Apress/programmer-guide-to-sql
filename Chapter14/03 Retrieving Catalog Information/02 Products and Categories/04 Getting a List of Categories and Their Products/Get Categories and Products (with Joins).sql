SELECT C.Name as "Category Name", P.Name as "Product Name"
FROM Product P 
INNER JOIN ProductCategory PC ON P.ProductID = PC.ProductID
INNER JOIN Category C ON PC.CategoryID = C.CategoryID
ORDER BY C.Name, P.Name;
