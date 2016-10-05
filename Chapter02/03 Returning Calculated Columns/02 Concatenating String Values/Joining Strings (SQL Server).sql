SELECT ClassID,
       Time + ', Room ' + STR(RoomID) AS ClassDetails
FROM Class;
