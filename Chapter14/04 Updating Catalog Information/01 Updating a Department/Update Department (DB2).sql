CREATE PROCEDURE DB2ADMIN.UpdateDepartment 
(i_DepartmentID INT, 
 i_DepartmentName VARCHAR(50), 
 i_DepartmentDescription VARCHAR(1000))

P1: BEGIN
    UPDATE Department
    SET Name = i_DepartmentName,
        Description = i_DepartmentDescription
    WHERE DepartmentID = i_DepartmentID;
END P1 
