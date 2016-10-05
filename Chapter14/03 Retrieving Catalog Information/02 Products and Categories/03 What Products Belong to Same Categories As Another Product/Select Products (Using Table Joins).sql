SELECT DISTINCT P1.ProductID, P1.Name
FROM Product P1 
  INNER JOIN ProductCategory PC1 
    ON P1.ProductID = PC1.ProductID
  INNER JOIN ProductCategory PC2
    ON PC1.CategoryID = PC2.CategoryID
WHERE PC2.ProductID = 6
ORDER BY Name;
