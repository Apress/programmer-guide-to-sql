CREATE PROCEDURE UpdateDepartment
(DeptID IN integer,
DepartmentName IN varchar2,
DepartmentDescription IN varchar2)

AS
  BEGIN
    UPDATE Department
    SET Name = DepartmentName,
        Description = DepartmentDescription
    WHERE DepartmentID = DeptID;
  END;
/
