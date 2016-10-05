SELECT
   CONCAT(RIGHT(Name, LENGTH(Name) - INSTR(Name, ' ') + 1),
          ', ', LEFT(Name, INSTR(Name, ' ') - 1))
   AS StudentName
FROM Student
ORDER BY StudentName;
