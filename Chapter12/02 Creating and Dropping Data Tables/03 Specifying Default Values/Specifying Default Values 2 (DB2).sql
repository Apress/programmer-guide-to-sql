CREATE TABLE LibraryLoans (
   BookID       INT  NOT NULL,
   CustomerID   INT  NOT NULL,
   DateBorrowed DATE DEFAULT CURRENT_DATE NOT NULL);
