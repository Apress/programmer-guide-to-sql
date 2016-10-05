CREATE PROCEDURE DB2ADMIN.SearchCatalog 
(i_AllWords SMALLINT,
 i_Word1 VARCHAR(15),
 i_Word2 VARCHAR(15),
 i_Word3 VARCHAR(15),
 i_Word4 VARCHAR(15),
 i_Word5 VARCHAR(15))
 
RESULT SETS 1
P1: BEGIN

DECLARE curs1 CURSOR WITH RETURN FOR
   SELECT Name, Description FROM Product
   WHERE (Name || Description LIKE '%' ||i_Word1|| '%')
      OR (Name || Description LIKE '%' ||i_Word2|| '%' 
                              AND i_Word2 IS NOT NULL)
      OR (Name || Description LIKE '%' ||i_Word3|| '%' 
                              AND i_Word3 IS NOT NULL)
      OR (Name || Description LIKE '%' ||i_Word4|| '%' 
                              AND i_Word4 IS NOT NULL)
      OR (Name || Description LIKE '%' ||i_Word5|| '%' 
                              AND i_Word5 IS NOT NULL);

DECLARE curs2 CURSOR WITH RETURN FOR
   SELECT Name, Description FROM Product
   WHERE (Name || Description LIKE '%' ||i_Word1|| '%')
     AND (Name || Description LIKE '%' ||i_Word2|| '%' 
                              OR i_Word2 IS NULL)
     AND (Name || Description LIKE '%' ||i_Word3|| '%' 
                              OR i_Word3 IS NULL)
     AND (Name || Description LIKE '%' ||i_Word4|| '%' 
                              OR i_Word4 IS NULL)
     AND (Name || Description LIKE '%' ||i_Word5|| '%' 
                              OR i_Word5 IS NULL);

IF i_AllWords = 0 THEN
   OPEN curs1;
ELSE
   OPEN curs2;
END IF;

END P1
