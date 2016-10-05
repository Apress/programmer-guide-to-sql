SELECT ClassID,
       Time CONCAT ', Room ' CONCAT CHAR(RoomID)
          AS ClassDetails
FROM Class;
