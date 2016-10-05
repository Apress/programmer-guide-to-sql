SELECT ProductID, Name
FROM 
  (SELECT TOP 5 ProductID, Name
   FROM 
     (SELECT TOP 10 ProductID, Name
      FROM Product 
      ORDER BY ProductID) AS P1
   ORDER BY ProductID DESC) AS P2
ORDER BY ProductID
