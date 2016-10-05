SELECT Class.ClassID, Class.Time, Room.RoomID 
FROM Room 
   JOIN Class ON Room.RoomID = Class.RoomID;
