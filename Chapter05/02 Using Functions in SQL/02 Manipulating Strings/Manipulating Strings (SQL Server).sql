SELECT
   RIGHT(Name, LEN(Name) - CHARINDEX(' ', Name) + 1) + ', ' +
   LEFT(Name, CHARINDEX(' ', Name) - 1) AS StudentName
FROM Student
ORDER BY StudentName;
