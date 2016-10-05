Enter user-name: system/manager

Connected to:
Personal Oracle8i Release 8.1.7.0.0 - Production
With the Partitioning option
JServer Release 8.1.7.0.0 - Production

system@ORATEST> create user ch14 identified by ch14

User created.

system@ORATEST> grant resource,connect to ch14;

Grant succeeded.

system@ORATEST> revoke unlimited tablespace from ch14;

Revoke succeeded.

system@ORATEST> alter user ch14
  2  default tablespace users
  3  temporary tablespace temp
  4  quota 10M on users
  5  quota 5M on temp;

User altered.


system@ORATEST> @connect ch14/ch14
ch14@ORATEST>


CREATE  TABLE Users
(
   UserId int NOT NULL ,
   FirstName varchar (20)  NOT NULL ,
   LastName varchar (40) NOT NULL ,
   LoginId varchar (10) NOT NULL ,
   Password raw(20),
   Address1 varchar (80) NOT NULL ,
   Address2 varchar (80) NULL ,
   City varchar (30) NOT NULL ,
   State varchar (20) NOT NULL ,
   ZipCode varchar (10) NOT NULL ,
   EmailAddress varchar (255) NOT NULL 
);

create sequence userid_seq;

CREATE OR REPLACE TRIGGER AutoNumUsers
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
SELECT userid_seq.NEXTVAL
INTO :NEW.UserID FROM DUAL;
END;
/

CREATE OR REPLACE PROCEDURE RBS_CreateUser
(
i_loginid IN varchar,
i_FirstName IN varchar,
i_LastName IN varchar,
i_Password IN raw,
i_Address1 IN varchar,
i_Address2 IN varchar,
i_City IN varchar,
i_State IN varchar,
i_ZipCode IN varchar,
i_EmailAddress IN varchar,
o_NewUserId OUT int
)
AS
BEGIN
INSERT INTO Users(loginid, firstname, lastname, password, address1, address2, city, state, zipcode, emailaddress)
VALUES(i_loginid, i_FirstName, i_LastName, i_Password, i_Address1, i_Address2, i_City, i_State, i_ZipCode, i_EmailAddress)
;

select userid_seq.currval into o_NewUserId from dual;

END;
/


CREATE OR REPLACE PROCEDURE RBS_DeleteUser
(
i_UserID int
)
AS
BEGIN
DELETE FROM Users WHERE UserId = i_UserId;
END;
/

CREATE OR REPLACE PROCEDURE RBS_UpdateUser
(
i_UserId int,
i_loginid varchar,
i_Password raw,
i_FirstName varchar,
i_LastName varchar,
i_Address1 varchar,
i_Address2 varchar,
i_City varchar,
i_State varchar,
i_ZipCode varchar,
i_EmailAddress varchar
)
AS
BEGIN
UPDATE Users SET
loginid = i_loginid,
Password = i_Password,
FirstName = i_FirstName,
LastName = i_LastName,
Address1 = i_Address1,
Address2 = i_Address2,
City = i_City,
State = i_State,
ZipCode = i_ZipCode,
EmailAddress = i_EmailAddress
WHERE UserId = i_UserID;
END;
/

CREATE OR REPLACE PACKAGE RBS_SelectUsers_pkg
AS
TYPE
UserCur IS REF CURSOR;
PROCEDURE GetUsers(o_userCur OUT userCur);
END RBS_SelectUsers_pkg
;
/

CREATE OR REPLACE PACKAGE BODY RBS_SelectUsers_pkg
AS
PROCEDURE GetUsers(o_userCur OUT userCur)
IS
BEGIN
OPEN o_userCur FOR
SELECT FirstName, LastName, LoginId, UserId FROM Users;
END Getusers;
END RBS_SelectUsers_pkg;
/

CREATE OR REPLACE PROCEDURE RBS_LoadUser
(
o_UserId int,
o_Loginid out varchar,
o_FirstName out varchar,
o_LastName out varchar,
o_Address1 out varchar,
o_Address2 out varchar,
o_City out varchar,
o_State out varchar,
o_ZipCode out varchar,
o_EmailAddress out varchar
)
AS
BEGIN
SELECT loginid,FirstName,LastName,Address1,Address2,City,State,ZipCode,EmailAddress
INTO o_LoginId,o_FirstName,o_LastName,o_Address1,o_Address2,o_City,o_State,o_ZipCode,o_EmailAddress
FROM Users
WHERE UserId = o_UserId;
END;
/


CREATE OR REPLACE PROCEDURE RBS_ValidateLogin
(
i_loginid varchar,
i_password raw,
o_FirstName OUT varchar,
o_LastName OUT varchar,
o_UserID OUT int
)
AS
BEGIN


SELECT UserID, firstname, lastname
INTO o_UserID, o_FirstName, o_LastName
FROM Users
WHERE loginid = i_loginid
AND password = i_password;

IF o_UserId IS NULL
THEN
      o_userid := -1;
END IF;
END;
/
   

------------------------------------------------
-- To get a return value, create it as a function
-------------------------------------------------

CREATE OR REPLACE FUNCTION RBS_ValidateLogin_FUNC
(
i_loginid varchar,
i_password raw,
o_FirstName OUT varchar,
o_LastName OUT varchar
)
RETURN int
AS
o_UserID int;
BEGIN

SELECT UserID, firstname, lastname
INTO o_UserID, o_FirstName, o_LastName
FROM Users
WHERE loginid = i_loginid
AND password = i_password;

IF o_UserId IS NOT NULL
THEN
RETURN o_userID;
ELSE
Return -1;
END IF;
END;
/

CREATE TABLE Roles
(
   RoleID int NOT NULL ,
   Description varchar (50) NOT NULL 
)
;

create sequence roleid_seq;

CREATE OR REPLACE TRIGGER Roles_AUTONUMBER
BEFORE INSERT ON Roles
FOR EACH ROW
BEGIN
SELECT RoleID_seq.NEXTVAL
INTO :NEW.RoleID FROM DUAL;
END;
/


CREATE OR REPLACE PROCEDURE RBS_CreateRole
(i_Description varchar,
o_NewRoleId OUT int
)
AS
BEGIN
INSERT INTO Roles(Description) VALUES(i_Description);
select roleid_seq.currval into o_NewRoleId from dual;
END;
/

CREATE OR REPLACE PROCEDURE RBS_DeleteRole
(
i_RoleId int
)
AS
BEGIN
   DELETE FROM Roles WHERE RoleId = i_RoleId;
END;
/

CREATE OR REPLACE PROCEDURE RBS_UpdateRole
(
i_RoleId int,
i_Description varchar
)
AS
BEGIN
UPDATE Roles SET Description = i_Description WHERE RoleId = i_RoleId;
END;
/

CREATE OR REPLACE PROCEDURE RBS_LoadRole
(
i_RoleId int,
o_Description out varchar
)
AS
BEGIN
   SELECT Description
   into o_Description
   FROM Roles
   WHERE RoleId = i_RoleId;
END;
/


CREATE OR REPLACE PACKAGE RBS_SelectRoles_pkg
AS
TYPE
RoleCur IS REF CURSOR;
PROCEDURE GetRoles(o_roleCur OUT roleCur);
END RBS_SelectRoles_pkg
;
/

CREATE OR REPLACE PACKAGE BODY RBS_SelectRoles_pkg
AS
PROCEDURE GetRoles(o_roleCur OUT roleCur)
IS
BEGIN
OPEN o_roleCur FOR
SELECT RoleId, Description FROM Roles ORDER BY Description;
END GetRoles;
END RBS_SelectRoles_pkg;
/

CREATE TABLE PermissionCategories
(
CategoryId int NOT NULL,
Description varchar(50) NOT NULL 
)
;

create sequence CategoryId_seq;

CREATE OR REPLACE TRIGGER PermCat_AUTONUMBER
BEFORE INSERT ON PermissionCategories
FOR EACH ROW
BEGIN
SELECT CategoryId_seq.NEXTVAL
INTO :NEW.CategoryId FROM DUAL;
END;
/


CREATE TABLE Permissions
(
PermissionId int NOT NULL,
Description varchar (50) NOT NULL,
CategoryId int NOT NULL 
);

create sequence PermissionId_seq;

CREATE OR REPLACE TRIGGER Permissions_AUTONUMBER
BEFORE INSERT ON Permissions
FOR EACH ROW
BEGIN
SELECT PermissionId_seq.NEXTVAL
INTO :NEW.PermissionId FROM DUAL;
END;
/

CREATE OR REPLACE PROCEDURE RBS_CreatePermission
(
i_Description varchar,
o_NewPermissionId OUT int
)
AS
BEGIN

INSERT INTO Permissions(Description) VALUES(i_Description);
select PermissionId_seq.currval into o_NewPermissionId from dual;
END;
/

CREATE or REPLACE PROCEDURE RBS_UpdatePermission
(
i_PermissionId int,
i_Description varchar,
i_CategoryId int
)
AS
BEGIN
UPDATE Permissions
SET
Description = i_Description,
CategoryId = i_CategoryId
WHERE
PermissionId = i_PermissionId;
END;
/

CREATE OR REPLACE PROCEDURE RBS_DeletePermission
(
i_PermissionId int
)
AS
BEGIN
   DELETE FROM Permissions
   WHERE
      PermissionId = i_PermissionId;
END;
/

CREATE OR REPLACE PROCEDURE RBS_LoadPermission
(
i_PermissionId int,
o_Description out varchar,
o_CategoryName out varchar,
o_CategoryId out int
)
AS
BEGIN

SELECT p.Description, p.CategoryId, pc.Description
INTO o_Description, o_CategoryId, o_CategoryName
FROM Permissions p, PermissionCategories pc
WHERE p.CategoryId = pc.CategoryId
AND p.PermissionId = i_PermissionId;
END;
/


CREATE OR REPLACE PACKAGE RBS_SelectPerms_pkg
AS
TYPE permCur IS REF CURSOR;
PROCEDURE Getperms(i_CategoryID IN int, o_permCur OUT permCur);
END RBS_SelectPerms_pkg
;
/

CREATE OR REPLACE PACKAGE BODY RBS_SelectPerms_pkg
AS
PROCEDURE Getperms
(
i_CategoryID IN int, o_permCur OUT permCur
)
IS
BEGIN
IF i_CategoryId = -1
THEN
OPEN o_permCur FOR
SELECT p.PermissionId, p.CategoryId,  p.Description, pc.Description as CategoryName
FROM Permissions p, PermissionCategories pc
WHERE p.CategoryId = pc.CategoryId
ORDER BY pc.Description, p.Description;
   
ELSE
OPEN o_permCur FOR
SELECT p.PermissionId, p.CategoryId, p.Description, pc.Description as CategoryName
FROM Permissions p, PermissionCategories pc
WHERE p.CategoryId = pc.CategoryId
AND p.CategoryId = i_CategoryId
ORDER BY p.Description;
END IF;
END Getperms;
END RBS_SelectPerms_pkg;
/


--------------------------------
--- Putting it All Together ----
--------------------------------

CREATE TABLE UserRoles
(
   UserId int NOT NULL,
   RoleId int NOT NULL ,
   CanGrant smallint NOT NULL 
);


-- Mode is a reserved word in Oracle

CREATE TABLE RolePermission (
   RoleID int NOT NULL,
   PermissionID int NOT NULL,
   PermMode int NOT NULL
);

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

ALTER TABLE UserRoles
  MODIFY (CanGrant smallint DEFAULT 0);

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


CREATE OR REPLACE PROCEDURE RBS_SetRolePermissionMode
(
i_PermissionID IN int,
i_RoleID IN int,
i_PermMode IN int
)
AS
l_Count int;
BEGIN
   SELECT COUNT(PermissionID)
   INTO l_Count
   FROM RolePermission
   WHERE RoleID = i_RoleID AND PermissionID = i_PermissionID;

   IF l_Count = 0 THEN
      INSERT INTO RolePermission(RoleID, PermissionID, PermMode)
      VALUES (i_RoleID, i_PermissionID, i_PermMode);
   ELSE
      UPDATE RolePermission
      SET PermMode = i_PermMode
      WHERE PermissionID = i_PermissionID AND RoleID = i_RoleID;
   END IF;
END;
/


CREATE OR REPLACE PACKAGE RBS_SelectRolePermissions_pkg
AS
TYPE
GetRolePermsCur IS REF CURSOR;
PROCEDURE GetRolePerms(i_RoleID IN int, o_GetRolePermsCur OUT GetRolePermsCur);
END RBS_SelectRolePermissions_pkg
;
/

CREATE OR REPLACE PACKAGE BODY RBS_SelectRolePermissions_pkg
AS
PROCEDURE GetRolePerms(i_RoleID IN int, o_GetRolePermsCur OUT GetRolePermsCur)
IS
BEGIN
OPEN o_GetRolePermsCur FOR
SELECT p.PermissionID, p.Description, pc.Description AS CategoryName, rp.PermMode
      FROM Permissions p, PermissionCategories pc, RolePermission rp
      WHERE p.CategoryID = pc.CategoryID
      AND p.PermissionID = rp.PermissionID
      AND rp.RoleID = i_RoleID
      ORDER BY pc.Description, p.Description;
  END GetRolePerms;
  END RBS_SelectRolePermissions_pkg;
/


CREATE OR REPLACE PACKAGE RBS_SelectEffectivePerms_pkg
AS
TYPE
EffPermsCur IS REF CURSOR;
PROCEDURE GetEffectivePerms(i_UserID IN int, o_EffPermsCur OUT EffPermsCur);
END RBS_SelectEffectivePerms_pkg
;
/

CREATE OR REPLACE PACKAGE BODY RBS_SelectEffectivePerms_pkg
AS
PROCEDURE GetEffectivePerms(i_UserID IN int, o_EffPermsCur OUT EffPermsCur)
IS
BEGIN
OPEN o_EffPermsCur FOR
SELECT RolePermission.PermissionID, MAX(PermMode) AS PermMode, Description
     FROM RolePermission, UserRoles, Permissions
     WHERE RolePermission.RoleID = UserRoles.RoleID
       AND RolePermission.PermissionID = Permissions.PermissionID
       AND UserRoles.UserID = i_UserID
     GROUP BY RolePermission.PermissionID, Permissions.Description;
  END GetEffectivePerms;
  END RBS_SelectEffectivePerms_pkg;
/


CREATE OR REPLACE PACKAGE RBS_SelectUserRoles_pkg
AS
TYPE
UserRolesCur IS REF CURSOR;
PROCEDURE GetUserRoles(i_UserID IN int, o_UserRolesCur OUT UserRolesCur);
END RBS_SelectUserRoles_pkg
;
/

CREATE OR REPLACE PACKAGE BODY RBS_SelectUserRoles_pkg
AS
PROCEDURE GetUserRoles(i_UserID IN int, o_UserRolesCur OUT UserRolesCur)
IS
BEGIN
OPEN o_UserRolesCur FOR
SELECT UserRoles.RoleID, Description, CanGrant
   FROM UserRoles, Roles
   WHERE UserRoles.RoleID = Roles.RoleID
   AND UserID = i_UserID
   ORDER BY Description;
  END GetUserRoles;
  END RBS_SelectUserRoles_pkg;
/
