SELECT CategoryName, ProductName, ProductPrice
  FROM 
    (SELECT C.Name as CategoryName, 
            P.Name as ProductName, 
            P.Price as ProductPrice, 
            RANK() OVER (PARTITION BY C.Name ORDER BY P.Price DESC) 
            AS rank
     FROM Product P 
     JOIN ProductCategory PC ON P.ProductID = PC.ProductID
     JOIN Category C ON C.CategoryID = PC.CategoryID)
WHERE rank <= 2
ORDER BY CategoryName;
