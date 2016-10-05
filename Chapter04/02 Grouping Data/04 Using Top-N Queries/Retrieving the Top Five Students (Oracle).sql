SELECT StudentID, AverageMark FROM (
   SELECT StudentID, AVG(Mark) AS AverageMark
   FROM StudentExam
   GROUP BY StudentID
   ORDER BY AverageMark DESC
)
WHERE ROWNUM <= 5;
