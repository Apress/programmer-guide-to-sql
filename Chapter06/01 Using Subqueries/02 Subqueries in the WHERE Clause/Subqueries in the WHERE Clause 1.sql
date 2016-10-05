SELECT ExamID, SustainedOn FROM Exam
WHERE SustainedOn <= (
   SELECT SustainedOn FROM Exam WHERE ExamID = 5)
ORDER BY SustainedOn DESC;
