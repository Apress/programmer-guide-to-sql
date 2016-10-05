SELECT COUNT(*) AS NumberOfExams,
       COUNT(DISTINCT SustainedOn) AS UniqueDates,
       COUNT(Comments) AS ExamsWithComments
FROM Exam;
