CREATE PROCEDURE UpdateDepartment
(@DepartmentID int,
@DepartmentName varchar(50),
@DepartmentDescription varchar(1000))

AS
UPDATE Department
SET Name = @DepartmentName, 
    Description = @DepartmentDescription
WHERE DepartmentID = @DepartmentID;
