CREATE OR REPLACE FUNCTION FormatName(FullName IN varchar) 
RETURN varchar
IS
FormattedName varchar(50);
BEGIN
   FormattedName :=
      SUBSTR(FullName, INSTR(FullName, ' ') + 1) || ', ' ||
      SUBSTR(FullName, 1, INSTR(FullName, ' ') - 1);
   RETURN(FormattedName);
END;
/