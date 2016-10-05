SELECT Room.RoomID, Class.Time
FROM Room 
   FULL OUTER JOIN Class 
   ON Room.RoomID = Class.RoomID
ORDER BY Room.RoomID;
