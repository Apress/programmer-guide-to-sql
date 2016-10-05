WITH tmp (CategoryName, ProductName, ProductPrice, rank) 
AS 
    (SELECT C.Name, P.Name, P.Price, 
            ROWNUMBER() OVER (PARTITION BY C.Name ORDER BY P.Price DESC) 
            AS rank
     FROM Product P 
     JOIN ProductCategory PC ON P.ProductID = PC.ProductID
     JOIN Category C ON C.CategoryID = PC.CategoryID)

SELECT CategoryName, ProductName, ProductPrice
FROM tmp
WHERE rank <= 2
ORDER BY CategoryName
