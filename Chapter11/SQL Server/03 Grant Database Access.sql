CREATE DATABASE TestDatabase
GO
USE TestDatabase
GO
CREATE TABLE TestTable (TestRow INT);
GO
EXEC sp_grantdbaccess 'Alice'
