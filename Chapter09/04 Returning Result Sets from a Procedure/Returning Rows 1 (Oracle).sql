CREATE OR REPLACE PACKAGE student_pkg
AS
TYPE studCur IS REF CURSOR;
PROCEDURE GetStudents(o_StudCur OUT studCur);
END student_pkg;
/
