SELECT
   RIGHT(Name, LEN(Name) - INSTR(Name, ' ') + 1) & ', ' &
   LEFT(Name, INSTR(Name, ' ') - 1) AS StudentName
FROM Student
ORDER BY
   RIGHT(Name, LEN(Name) - INSTR(Name, ' ') + 1);
