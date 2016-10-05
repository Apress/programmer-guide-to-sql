CREATE TABLE Category (
CategoryID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
DepartmentID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Description VARCHAR (200) NULL,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
INDEX idxDepartmentID (DepartmentID)
) Type=InnoDB;
