CREATE TABLE LibraryLoans (
   BookID       INT      NOT NULL,
   CustomerID   INT      NOT NULL,
   DateBorrowed DATETIME DEFAULT GETDATE() NOT NULL);
