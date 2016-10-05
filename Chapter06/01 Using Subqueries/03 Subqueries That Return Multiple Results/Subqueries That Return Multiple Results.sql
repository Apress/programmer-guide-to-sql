SELECT Name FROM Course
WHERE CourseID IN
(
SELECT CourseID from EXAM
WHERE SustainedOn='26-MAR-03'
);
