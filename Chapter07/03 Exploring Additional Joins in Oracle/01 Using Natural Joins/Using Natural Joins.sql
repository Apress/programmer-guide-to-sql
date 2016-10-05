SELECT Class.ClassID,
       Class.CourseID,
       Class.Time,
       Room.Comments AS RoomName
FROM Class NATURAL JOIN Room
ORDER BY ClassID;
