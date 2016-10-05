CREATE PROCEDURE DeleteDepartment
(@DepartmentID int)
AS
IF NOT EXISTS 
    (SELECT Name FROM Category WHERE DepartmentID = @DepartmentID)
DELETE FROM Department
WHERE DepartmentID = @DepartmentID;
