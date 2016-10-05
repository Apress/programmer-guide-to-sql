CREATE FUNCTION FormatName(FullName varchar(50))
   RETURNS varchar(50)
   LANGUAGE SQL
   DETERMINISTIC
   CONTAINS SQL
BEGIN ATOMIC
   DECLARE FormattedName VARCHAR(50);
   SET FormattedName =
       SUBSTR(FullName, POSSTR(FullName, ' ') + 1) || ', ' ||
       SUBSTR(FullName, 1, POSSTR(FullName, ' ') - 1);
   RETURN FormattedName;
END
