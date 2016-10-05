CREATE PROCEDURE ErrorTest(@i_StudID INT,
                           @i_StudName VARCHAR(10))
AS
BEGIN
   DECLARE @errno INT;
   INSERT INTO Student VALUES (@i_StudID, @i_StudName);
   SET @errno = @@ERROR;
   IF @errno <> 0
   BEGIN
      RAISERROR (
         'Can''t insert row with ID %d into database', 10, 
         1, @i_StudID);
      RETURN @errno;
   END;
   ELSE
      RETURN 0;
END;
