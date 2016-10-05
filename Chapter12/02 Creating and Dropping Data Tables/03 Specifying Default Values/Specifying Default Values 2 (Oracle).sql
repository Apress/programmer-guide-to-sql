-- Oracle 
CREATE TABLE LibraryLoans (
   BookID       INT  NOT NULL,
   CustomerID   INT  NOT NULL,
   DateBorrowed DATE DEFAULT SYSDATE NOT NULL);
