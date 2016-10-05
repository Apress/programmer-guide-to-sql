CREATE TABLE Permissions (
PermissionId int IDENTITY (1, 1) NOT NULL ,
Description varchar (50) NOT NULL ,
CategoryId int NOT NULL
)


ALTER TABLE Permissions
ADD CONSTRAINT PK_Permissions PRIMARY KEY (PermissionID);


ALTER TABLE Permissions
ADD CONSTRAINT FK_Perms_PermCats FOREIGN KEY (CategoryID)
REFERENCES PermissionCategories (CategoryID)
ON DELETE CASCADE;