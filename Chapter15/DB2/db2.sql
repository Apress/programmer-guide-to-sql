-----------------------------
-------- USERS TABLE --------
-----------------------------

CREATE TABLE Users (UserId int GENERATED ALWAYS AS IDENTITY,
                    FirstName varchar(40) NOT NULL,
                    LastName varchar(40) NOT NULL,
                    LoginId varchar(10) NOT NULL,
                    Password clob(20),
                    Address1 varchar(80) NOT NULL,
                    Address2 varchar(80),
                    City varchar(30) NOT NULL,
                    State varchar(20) NOT NULL,
                    ZipCode varchar(10) NOT NULL,
                    EmailAddress varchar(255) NOT NULL
);


CREATE PROCEDURE RBS_CreateUser (
   i_LoginID varchar(10),
   i_FirstName varchar(40),
   i_LastName varchar(40),
   i_Password clob(20),
   i_Address1 varchar(80),
   i_Address2 varchar(80),
   i_City varchar(30),
   i_State varchar(20),
   i_ZipCode varchar(10),
   i_EmailAddress varchar(255),
   OUT o_NewUserId int)
BEGIN
   INSERT INTO Users (LoginID, FirstName, LastName, Password, Address1, Address2, City, State, ZipCode, EmailAddress)
   VALUES (i_LoginID, i_FirstName, i_LastName, i_Password, i_Address1, i_Address2, i_City, i_State, i_ZipCode, i_EmailAddress);

   SET o_NewUserID = IDENTITY_VAL_LOCAL();
END




CREATE PROCEDURE RBS_DeleteUser (i_UserID int)
BEGIN
   DELETE FROM Users WHERE UserID = i_UserID;
END


CREATE PROCEDURE RBS_UpdateUser (
   i_UserID int,
   i_LoginID varchar(10),
   i_FirstName varchar(40),
   i_LastName varchar(40),
   i_Password clob(20),
   i_Address1 varchar(80),
   i_Address2 varchar(80),
   i_City varchar(30),
   i_State varchar(20),
   i_ZipCode varchar(10),
   i_EmailAddress varchar(255))
BEGIN
   UPDATE Users
      SET LoginID = i_LoginID, FirstName = i_FirstName, LastName = i_LastName, Password = i_Password, Address1 = i_Address1,
          Address2 = i_Address2, City = i_City, State = i_State, ZipCode = i_ZipCode, EmailAddress = i_EmailAddress
      WHERE UserID = i_UserID;
END


CREATE PROCEDURE RBS_SelectUsers()
RESULT SETS 1
BEGIN
   DECLARE curUsers CURSOR WITH RETURN FOR
      SELECT FirstName, LastName, LoginID, UserID FROM Users
      ORDER BY LastName, FirstName;
   OPEN curUsers;
END


CREATE PROCEDURE RBS_LoadUser (
   i_UserID int,
   o_LoginID varchar(10),
   o_FirstName varchar(40),
   o_LastName varchar(40),
   o_Password clob(20),
   o_Address1 varchar(80),
   o_Address2 varchar(80),
   o_City varchar(30),
   o_State varchar(20),
   o_ZipCode varchar(10),
   o_EmailAddress varchar(255))
BEGIN
   SELECT LoginID, FirstName, LastName, Password, Address1,
          Address2, City, State, ZipCode, EmailAddress
   INTO o_LoginId, o_FirstName, o_LastName, o_Password, o_Address1,
        o_Address2, o_City, o_State, o_ZipCode, o_EmailAddress
   FROM Users
   WHERE UserID = i_UserID;
END


CREATE PROCEDURE RBS_ValidateLogin (i_LoginID varchar(10), i_password clob(20), OUT o_FirstName varchar(40), OUT o_LastName varchar(40))
BEGIN
   DECLARE l_UserID int;

   SELECT UserID, FirstName, LastName
   INTO l_UserID, o_FirstName, o_LastName
   FROM Users
   WHERE LoginID = i_LoginID;

   IF l_UserID IS NOT NULL THEN
      RETURN l_UserID;
   ELSE
      RETURN -1;
   END IF;
END


-----------------------------
-------- ROLES TABLE --------
-----------------------------

CREATE TABLE Roles (
   RoleID int GENERATED ALWAYS AS IDENTITY,
   Description varchar(50) NOT NULL
);


CREATE PROCEDURE RBS_CreateRole (i_Description varchar(50), OUT o_NewRoleID int)
BEGIN
   INSERT INTO Roles (Description) VALUES (i_Description);

   SET o_NewRoleID = IDENTITY_VAL_LOCAL();
END


CREATE PROCEDURE RBS_DeleteRole (i_RoleID int)
BEGIN
   DELETE FROM Roles WHERE RoleID = i_RoleID;
END


CREATE PROCEDURE RBS_DeleteRole (i_RoleID int)
BEGIN
   DELETE FROM Roles WHERE RoleID = i_RoleID;
END


CREATE PROCEDURE RBS_UpdateRole (i_RoleID int, i_Description varchar(40))
BEGIN
   UPDATE Roles
   SET Description = i_Description
   WHERE RoleID = i_RoleID;
END


CREATE PROCEDURE RBS_LoadRole(i_RoleID int, OUT o_Description varchar(40))
BEGIN
   SELECT Description INTO o_Description
   FROM Roles
   WHERE RoleID = i_RoleID;
END


CREATE PROCEDURE RBS_SelectRoles()
RESULT SETS 1
BEGIN
   DECLARE curRoles CURSOR WITH RETURN FOR
      SELECT RoleID, Description FROM Roles
      ORDER BY Description;
   OPEN curRoles;
END


--------------------------------
-- PermissionCategories Table --
--------------------------------

CREATE TABLE PermissionCategories (
   CategoryID int GENERATED ALWAYS AS IDENTITY,
   Description varchar(50) NOT NULL
);


CREATE TABLE Permissions (
   PermissionID int GENERATED ALWAYS AS IDENTITY,
   Description varchar(50) NOT NULL,
   CategoryID int NOT NULL
);


CREATE PROCEDURE RBS_CreatePermission (i_Description varchar(50), OUT o_NewPermissionID int)
BEGIN
   INSERT INTO Permissions (Description)
   VALUES (i_Description);

   SET o_NewPermissionID = IDENTITY_VAL_LOCAL();
END


CREATE PROCEDURE RBS_UpdatePermission(i_PermissionID int, i_Description varchar(50), i_CategoryID int)
BEGIN
   UPDATE Permissions
   SET Description = i_Description, CategoryID = i_CategoryID
   WHERE PermissionID = i_PermissionID;
END


CREATE PROCEDURE RBS_DeletePermission(i_PermissionID int)
BEGIN
   DELETE FROM Permissions
   WHERE PermissionID = i_PermissionID;
END


CREATE PROCEDURE RBS_LoadPermission(i_PermissionID int, OUT o_Description varchar(50), OUT o_CategoryName varchar(50), OUT o_CategoryID int)
BEGIN
   SELECT p.Description, p.CategoryID, pc.Description
   INTO o_Description, o_CategoryID, o_CategoryName
   FROM Permissions p
   INNER JOIN PermissionCategories pc
   ON p.CategoryID = pc.CategoryID;
END


CREATE PROCEDURE RBS_SelectPermissions(i_CategoryID int)
RESULT SETS 1
BEGIN
DECLARE cursor1 CURSOR WITH RETURN FOR
   SELECT p.PermissionID, p.CategoryID, p.Description, pc.Description AS CategoryName
      FROM Permissions p
      INNER JOIN PermissionCategories pc
      ON p.CategoryID = pc.CategoryID
      ORDER BY pc.Description, p.Description;
DECLARE cursor2 CURSOR WITH RETURN FOR
   SELECT p.PermissionID, p.CategoryID, p.Description, pc.Description AS CategoryName
      FROM Permissions p
      INNER JOIN PermissionCategories pc
      ON p.CategoryID = pc.CategoryID
      WHERE p.CategoryID = i_CategoryID
      ORDER BY p.Description;
IF i_CategoryID = -1 THEN
   OPEN cursor1;
ELSE
   OPEN cursor2;
END IF;
END



--------------------------------
--- Putting it All Together ----
--------------------------------


CREATE TABLE UserRoles (
   UserID int NOT NULL,
   RoleID int NOT NULL,
   CanGrant smallint NOT NULL DEFAULT 0
);


CREATE TABLE RolePermission (
   RoleID int NOT NULL,
   PermissionID int NOT NULL,
   Mode int NOT NULL
);


-- Name changed because DB2 doesn't allow names with more than 18 characters
ALTER TABLE PermissionCategories
   ADD CONSTRAINT PK_PermCategories PRIMARY KEY (CategoryID);

ALTER TABLE Roles
   ADD CONSTRAINT PK_Roles PRIMARY KEY (RoleID);

ALTER TABLE Users
   ADD CONSTRAINT PK_Users PRIMARY KEY (UserID);

ALTER TABLE Permissions
   ADD CONSTRAINT PK_Permissions PRIMARY KEY (PermissionID);

ALTER TABLE UserRoles
   ADD CONSTRAINT PK_UserRoles PRIMARY KEY (UserID, RoleID);

ALTER TABLE RolePermission
   ADD CONSTRAINT PK_RolePermission PRIMARY KEY (RoleID, PermissionID);

------------------------------------------------------------------------------------------------------
-- Doesn't seem to be possible to add a default value for a column after the table has been created --
------------------------------------------------------------------------------------------------------

ALTER TABLE Permissions
   ADD CONSTRAINT FK_Perms_PermCats FOREIGN KEY (CategoryID)
   REFERENCES PermissionCategories (CategoryID);

ALTER TABLE UserRoles
   ADD CONSTRAINT FK_UserRoles_Roles FOREIGN KEY (RoleID)
   REFERENCES Roles (RoleID)
   ADD CONSTRAINT FK_UserRoles_Users FOREIGN KEY (UserID)
   REFERENCES Users (UserID);

ALTER TABLE RolePermission
   ADD CONSTRAINT FK_RolePerm_Perms FOREIGN KEY (PermissionID)
   REFERENCES Permissions (PermissionID)
   ADD CONSTRAINT FK_RolePerm_Roles FOREIGN KEY (RoleID)
   REFERENCES Roles (RoleID);


CREATE PROCEDURE RBS_SetRolePermissionMode(i_PermissionID int, i_RoleID int, i_Mode int)
BEGIN
   DECLARE l_Count int;
   SELECT COUNT(PermissionID)
   INTO l_Count
   FROM RolePermission
   WHERE RoleID = i_RoleID AND PermissionID = i_PermissionID;

   IF l_Count = 0 THEN
      INSERT INTO RolePermission(RoleID, PermissionID, Mode)
      VALUES (i_RoleID, i_PermissionID, i_Mode);
   ELSE
      UPDATE RolePermission
      SET Mode = i_Mode
      WHERE PermissionID = i_PermissionID AND RoleID = i_RoleID;
   END IF;
END


CREATE PROCEDURE RBS_SelectRolePermissions(i_RoleID int)
RESULT SETS 1
BEGIN
   DECLARE cursor1 CURSOR WITH RETURN FOR
      SELECT p.PermissionID, p.Description, pc.Description AS CategoryName, rp.Mode
      FROM Permissions p
      INNER JOIN PermissionCategories pc
      ON p.CategoryID = pc.CategoryID
         INNER JOIN RolePermission rp
         ON p.PermissionID = rp.PermissionID
      WHERE rp.RoleID = i_RoleID
      ORDER BY pc.Description, p.Description;
   OPEN cursor1;
END


CREATE PROCEDURE RBS_SelectEffectivePermissions (i_UserID int)
RESULT SETS 1
BEGIN
   DECLARE cursor1 CURSOR WITH RETURN FOR
   SELECT RolePermission.PermissionID, MAX(Mode) AS Mode, Description
   FROM RolePermission
   INNER JOIN UserRoles
   ON RolePermission.RoleID = UserRoles.RoleID
      INNER JOIN Permissions
      ON RolePermission.PermissionID = Permissions.PermissionID
   WHERE UserRoles.UserID = i_UserID
   GROUP BY RolePermission.PermissionID, Permissions.Description;
   OPEN cursor1;
END


CREATE PROCEDURE RBS_SelectUserRoles (i_UserID int)
RESULT SETS 1
BEGIN
   DECLARE cursor1 CURSOR WITH RETURN FOR
   SELECT UserRoles.RoleID, Description, CanGrant
   FROM UserRoles
   INNER JOIN Roles
   ON UserRoles.RoleID = Roles.RoleID
   WHERE UserID = i_UserID
   ORDER BY Description;
   OPEN cursor1;
END