SELECT ProductID, Name FROM
     (SELECT ProductID, Name, ROWNUM AS rn FROM
          (SELECT ProductID, Name 
           FROM Product 
           ORDER BY ProductID)
     ) inner
WHERE inner.rn BETWEEN 6 AND 10;
