SELECT Room.RoomID, Class.Time
FROM Room 
   RIGHT OUTER JOIN Class 
   ON Room.RoomID = Class.RoomID
ORDER BY Room.RoomID;
