SELECT StudentID, COUNT(*) AS HighPasses
FROM StudentExam
WHERE Mark > 70
GROUP BY ALL StudentID;
