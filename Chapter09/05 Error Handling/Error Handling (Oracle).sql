CREATE OR REPLACE PROCEDURE ErrorTest(
                                    i_StudID   IN INT,
                                    i_StudName IN VARCHAR)
AS
   UnluckyNumber EXCEPTION;
BEGIN
   IF i_StudID = 13 THEN
      RAISE UnluckyNumber;
   END IF;
   INSERT INTO Student VALUES (i_StudID, i_StudName);
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
      dbms_output.put_line(
         'A student already exists with ID ' || i_StudID);
   WHEN UnluckyNumber THEN
      dbms_output.put_line(
         'Can''t insert a student with an unlucky ID');
END;
/
