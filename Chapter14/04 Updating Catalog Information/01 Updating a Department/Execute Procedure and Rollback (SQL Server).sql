BEGIN TRANSACTION
EXECUTE UpdateDepartment 1, 'Strange new name', 'Strange new description'
SELECT * FROM Department
ROLLBACK TRANSACTION;
