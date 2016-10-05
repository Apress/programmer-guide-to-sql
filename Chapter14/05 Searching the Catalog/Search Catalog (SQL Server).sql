CREATE PROCEDURE SearchCatalog 
(@AllWords bit,
@Word1 varchar(15) = NULL,
@Word2 varchar(15) = NULL,
@Word3 varchar(15) = NULL,
@Word4 varchar(15) = NULL,
@Word5 varchar(15) = NULL)
AS

IF @AllWords = 0 
   SELECT Name, Description
   FROM Product
   WHERE (Name + Description LIKE '%'+@Word1+'%')
      OR (Name + Description LIKE '%'+@Word2+'%' AND @Word2 IS NOT NULL)
      OR (Name + Description LIKE '%'+@Word3+'%' AND @Word3 IS NOT NULL)
      OR (Name + Description LIKE '%'+@Word4+'%' AND @Word4 IS NOT NULL)
      OR (Name + Description LIKE '%'+@Word5+'%' AND @Word5 IS NOT NULL)

IF @AllWords = 1 
   SELECT Name, Description
   FROM Product
   WHERE (Name + Description LIKE '%'+@Word1+'%')
     AND (Name + Description LIKE '%'+@Word2+'%' OR @Word2 IS NULL)
     AND (Name + Description LIKE '%'+@Word3+'%' OR @Word3 IS NULL)
     AND (Name + Description LIKE '%'+@Word4+'%' OR @Word4 IS NULL)
     AND (Name + Description LIKE '%'+@Word5+'%' OR @Word5 IS NULL);
