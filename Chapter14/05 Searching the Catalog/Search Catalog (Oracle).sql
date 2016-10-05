CREATE OR REPLACE PACKAGE Types
AS 
    TYPE CursorType IS REF CURSOR; 
END; 
/ 

CREATE OR REPLACE PROCEDURE SearchCatalog 
(retCursor IN OUT Types.CursorType,
 AllWords IN NUMBER := 0,
 Word1 IN VARCHAR := NULL,
 Word2 IN VARCHAR := NULL,
 Word3 IN VARCHAR := NULL,
 Word4 IN VARCHAR := NULL,
 Word5 IN VARCHAR := NULL)
AS

BEGIN
  IF AllWords <> 1 THEN
    OPEN retCursor FOR 
    SELECT Name, Description 
    FROM Product
    WHERE (Name||Description LIKE '%'||Word1||'%')
       OR (Name||Description LIKE '%'||Word2||'%' AND Word2 IS NOT NULL)
       OR (Name||Description LIKE '%'||Word3||'%' AND Word3 IS NOT NULL)
       OR (Name||Description LIKE '%'||Word4||'%' AND Word4 IS NOT NULL)
       OR (Name||Description LIKE '%'||Word5||'%' AND Word5 IS NOT NULL);
  ELSE
    OPEN retCursor FOR 
    SELECT Name, Description 
    FROM Product
    WHERE (Name||Description LIKE '%'||Word1||'%')
      AND (Name||Description LIKE '%'||Word2||'%' OR Word2 IS NULL)
      AND (Name||Description LIKE '%'||Word3||'%' OR Word3 IS NULL)
      AND (Name||Description LIKE '%'||Word4||'%' OR Word4 IS NULL)
      AND (Name||Description LIKE '%'||Word5||'%' OR Word5 IS NULL);
  END IF;
END;
/
