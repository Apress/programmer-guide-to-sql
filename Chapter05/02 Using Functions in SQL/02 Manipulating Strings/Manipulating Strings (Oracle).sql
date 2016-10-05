SELECT
   SUBSTR(Name, INSTR(Name, ' ') + 1) || ', ' ||
   SUBSTR(Name, 1, INSTR(Name, ' ') - 1) AS StudentName
FROM Student
ORDER BY StudentName;
