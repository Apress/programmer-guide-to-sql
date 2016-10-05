/* Create a temporary table named #Product, having an IDENTITY column */
CREATE TABLE #Product
(RowNumber SMALLINT NOT NULL IDENTITY(1,1),
 ProductID INT,
 Name VARCHAR(50))

/* Populate the temporary table with records from the table we browse through.
   The RowNumber column will generate consecutive numbers for each product.
   We're free to order the list of products by any criteria. */
INSERT INTO #Product (ProductID, Name)
SELECT ProductID, Name
FROM Product
ORDER BY Price DESC

/* Retrieve the requested group or records from the temporary table */
SELECT ProductID, Name
FROM #Product
WHERE RowNumber BETWEEN 6 and 10

/* Drop the temporary table */
DROP TABLE #Product