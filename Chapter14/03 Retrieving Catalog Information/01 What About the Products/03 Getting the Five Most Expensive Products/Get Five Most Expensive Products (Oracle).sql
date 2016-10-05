SELECT Name, Price FROM
     (SELECT Name, Price 
      FROM Product 
      ORDER BY Price DESC, Name ASC)
WHERE ROWNUM<=5;
