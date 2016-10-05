SELECT Room.RoomID, Class.Time
FROM Class 
   RIGHT OUTER JOIN Room 
   ON Class.RoomID = Room.RoomID
ORDER BY Room.RoomID;
