CREATE PROCEDURE DB2ADMIN.DeleteDepartment 
(i_DepartmentID INT)
P1: BEGIN
   IF NOT EXISTS (SELECT Name FROM Category
                  WHERE DepartmentID = i_DepartmentID) 
   THEN
      DELETE FROM Department 
      WHERE DepartmentID = i_DepartmentID;
   END IF;
END P1   
