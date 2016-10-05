CREATE PROCEDURE DeleteDepartment
(DeptID IN integer)
AS
  BEGIN  
    DELETE FROM Department
    WHERE DepartmentID = DeptID
    AND NOT EXISTS (SELECT Name FROM Category WHERE DepartmentID = DeptID);
  END;
/
