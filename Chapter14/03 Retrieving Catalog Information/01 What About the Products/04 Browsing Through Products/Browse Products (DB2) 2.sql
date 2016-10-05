WITH temp AS 
  (SELECT ProductID, Name, 
          ROWNUMBER() OVER(ORDER BY ProductID) AS row 
   FROM Product)
SELECT ProductID, Name FROM temp WHERE row>5 and row<=10
