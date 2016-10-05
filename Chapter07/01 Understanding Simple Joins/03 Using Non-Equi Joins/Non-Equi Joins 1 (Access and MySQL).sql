SELECT Room.RoomID, Class.Time, Class.ClassID
FROM Room INNER JOIN Class ON Room.RoomID = Class.RoomID;
