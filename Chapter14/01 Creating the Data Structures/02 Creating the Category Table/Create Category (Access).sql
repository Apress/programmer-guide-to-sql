AU: Pls rebreak code line at 83 char or less
CREATE TABLE Category (
CategoryID AUTOINCREMENT NOT NULL PRIMARY KEY,
DepartmentID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Description VARCHAR (200) NULL,
CONSTRAINT fk_DepartmentID FOREIGN KEY (DepartmentID) 
                           REFERENCES Department (DepartmentID));
