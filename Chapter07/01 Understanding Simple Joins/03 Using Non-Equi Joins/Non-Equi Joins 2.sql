SELECT Room.RoomID, Class.Time
FROM Room JOIN Class ON Room.RoomID <> Class.RoomID;
