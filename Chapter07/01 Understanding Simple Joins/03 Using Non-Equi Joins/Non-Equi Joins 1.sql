SELECT Room.RoomID, Class.Time, Class.ClassID
FROM Room JOIN Class ON Room.RoomID = Class.RoomID;
