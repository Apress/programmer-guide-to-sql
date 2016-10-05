CREATE TABLE RolePermission (
RoleId int NOT NULL ,
PermissionId int NOT NULL ,
Mode int NOT NULL
);


ALTER TABLE RolePermission
ADD CONSTRAINT PK_RolePermission
PRIMARY KEY (RoleID, PermissionID);



ALTER TABLE RolePermission
ADD CONSTRAINT FK_RolePermission_Permissions
FOREIGN KEY(PermissionId)
REFERENCES Permissions (PermissionId
ON DELETE CASCADE
, CONSTRAINT FK_RolePermission_Roles
FOREIGN KEY (RoleId)
REFERENCES Roles (RoleId)
ON DELETE CASCADE;