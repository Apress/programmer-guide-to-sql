SELECT Room.Comments, Class.Time
FROM Class
   JOIN Room
   USING (RoomID);
