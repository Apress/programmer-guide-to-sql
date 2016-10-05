CREATE PROCEDURE GetClassAttendees (
                      OUT AllClassAttendees VARCHAR(1000))
P1: BEGIN
DECLARE ProfID   INT;
DECLARE ProfName VARCHAR(50);
DECLARE tmp_msg  VARCHAR(1000) DEFAULT '';
DECLARE eof      SMALLINT      DEFAULT 0;
DECLARE cur_profs CURSOR FOR
   SELECT ProfessorID, Name FROM Professor;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
   SET eof = 1;
OPEN cur_profs;
WHILE eof = 0
DO
   FETCH cur_profs INTO ProfID, ProfName;
   SET tmp_msg = tmp_msg || ProfName || ': ';
   FOR cur_students AS SELECT DISTINCT Name FROM Student s
                    INNER JOIN Enrollment e
                    ON s.StudentID = e.StudentID
                       INNER JOIN Class c
                       ON e.ClassID = c.ClassID
                    WHERE c.ProfessorID = ProfID
   DO
      SET tmp_msg = tmp_msg || Name || ', ';
   END FOR;
END WHILE;
CLOSE cur_profs;
SET AllClassAttendees = LEFT(tmp_msg, LENGTH(tmp_msg) – 2);
END P1
