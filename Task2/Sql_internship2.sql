--Drop the table if it already exists
IF OBJECT_ID('dbo.LibraryEvent', 'U') IS NOT NULL
    DROP TABLE dbo.LibraryEvent;

-- Create the table
CREATE TABLE LibraryEvent (
    EventID INT PRIMARY KEY,  -- Manual control of ID
    EventName VARCHAR(100) NOT NULL,
    EventDate DATE,
    Location VARCHAR(100) DEFAULT 'Main Hall',  -- Default value
    Description TEXT
);
Select * from LibraryEvent;
-- Insert with all fields
INSERT INTO LibraryEvent (EventID, EventName, EventDate, Location, Description)
VALUES (1, 'Book Launch', '2025-09-10', 'Auditorium', 'Launching a new novel');
Select *from LibraryEvent Where EventID=1;

-- Insert using NULL for Description
INSERT INTO LibraryEvent (EventID, EventName, EventDate, Location, Description)
VALUES (2, 'Children''s Story Hour', '2025-09-15', 'Kids Room', NULL);
Select *from LibraryEvent Where EventID=2;

-- Insert using DEFAULT for Location
INSERT INTO LibraryEvent (EventID, EventName, EventDate, Description)
VALUES (3, 'History Talk', '2025-09-20', 'Discussion on local history');
Select *from LibraryEvent Where EventID=3;

--. Use UPDATE with WHERE
-- Change the location for a specific event
UPDATE LibraryEvent
SET Location = 'Conference Room'
WHERE EventID = 1;
Select *from LibraryEvent Where EventID=1;

 --. Use DELETE with WHERE
 -- Delete the cancelled event
DELETE FROM LibraryEvent
WHERE EventName = 'Children''s Story Hour';

SELECT * FROM LibraryEvent;







