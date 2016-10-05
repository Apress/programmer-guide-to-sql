SELECT Class.ClassID,
       Class.CourseID,
       Class.Time,
       Room.Comments AS RoomName
FROM Class RIGHT OUTER JOIN Room
ON Class.RoomID = Room.RoomID
ORDER BY ClassID;
