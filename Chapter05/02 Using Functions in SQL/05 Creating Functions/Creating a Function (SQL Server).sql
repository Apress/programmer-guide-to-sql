CREATE FUNCTION FormatName (@FullName varchar(50))
RETURNS varchar(50)
AS
BEGIN
   RETURN RIGHT(@FullName, LEN(@FullName) -
               CHARINDEX(' ', @FullName) + 1) + ', ' +
          LEFT(@FullName, CHARINDEX(' ', @FullName) - 1)      
END
