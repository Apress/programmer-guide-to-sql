SELECT
   SUBSTR(Name, POSSTR(Name, ' ') + 1) || ', ' ||
   SUBSTR(Name, 1, POSSTR(Name, ' ') - 1) AS StudentName
FROM Student
ORDER BY StudentName;
