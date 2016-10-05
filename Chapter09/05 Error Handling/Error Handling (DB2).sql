CREATE PROCEDURE DB2ADMIN.ErrorTest (
                               i_StudID   INT,
                               i_StudName VARCHAR(50),
                           OUT o_Status   CHAR(5))
P1: BEGIN
   DECLARE SQLSTATE CHAR(5) DEFAULT '00000';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
      SET o_Status = SQLSTATE;
   IF i_StudID = 13 THEN
      SIGNAL SQLSTATE '75000'
         SET MESSAGE_TEXT =
            'Can''t insert a student with an unlucky ID';
   END IF;
   INSERT INTO Student VALUES (i_StudID, i_StudName);
   SET o_Status = SQLSTATE;
END P1
