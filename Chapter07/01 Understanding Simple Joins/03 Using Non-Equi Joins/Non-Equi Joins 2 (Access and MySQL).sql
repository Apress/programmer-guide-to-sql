SELECT Room.RoomID, Class.Time
FROM Room INNER JOIN Class ON Room.RoomID <> Class.RoomID;

