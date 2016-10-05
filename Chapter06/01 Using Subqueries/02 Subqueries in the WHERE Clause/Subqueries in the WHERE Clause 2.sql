SELECT Name FROM Course
WHERE CourseID =
(
SELECT CourseID from EXAM
WHERE SustainedOn='10-MAR-03'
);
