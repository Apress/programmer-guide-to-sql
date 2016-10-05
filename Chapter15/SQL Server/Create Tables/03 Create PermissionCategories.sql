CREATE TABLE PermissionCategories (
CategoryId int IDENTITY (1, 1) NOT NULL ,
Description varchar (50) NOT NULL
);
ALTER TABLE PermissionCategories
ADD CONSTRAINT PK_PermCategories PRIMARY KEY (CategoryID);
