SELECT CategoryID, Name
FROM Category 
WHERE CategoryID IN
   (SELECT CategoryID 
    FROM ProductCategory
    WHERE ProductCategory.ProductID = 6);
