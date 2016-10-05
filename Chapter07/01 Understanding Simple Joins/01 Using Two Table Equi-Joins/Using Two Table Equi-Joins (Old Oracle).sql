SELECT Room.RoomID, Class.Time, Class.ClassID
FROM Room, Class
WHERE Room.RoomID = Class.RoomID;
