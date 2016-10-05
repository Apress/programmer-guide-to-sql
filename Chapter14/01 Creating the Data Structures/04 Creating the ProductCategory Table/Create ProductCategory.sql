CREATE TABLE ProductCategory (
ProductID INT NOT NULL,
CategoryID INT NOT NULL,
PRIMARY KEY (ProductID, CategoryID),
FOREIGN KEY (ProductID) REFERENCES Product (ProductID),
FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
);
