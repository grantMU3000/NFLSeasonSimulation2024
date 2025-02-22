-- Creating the NFC Table
Create Table NFC (
	teamID int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int,
    Losses int,
    ConferenceWins int,
    ConferenceLosses int,
    Division varchar(25)
);

-- Adding a foreign key for the Team ID so Teams & NFC are linked
Alter Table NFC
Add constraint fk_NFCteam_id
Foreign Key(teamID) References Teams(id);

-- Adding The NFC teams into the NFC table from my Teams table
Insert into NFC(teamId, City, Mascot, Division) Select id, City, Mascot, Division from Teams
Where Conference = 'NFC';

-- Setting default values for the wins/losses to be 0
Alter Table NFC
Alter Wins
Set Default 0;

Update NFC Set Wins = 0;
Update NFC Set Losses = 0;
Update NFC Set ConferenceWins = 0;
Update NFC Set ConferenceLosses = 0;

-- Creating the AFC table
Create Table AFC (
	teamID int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int,
    Losses int,
    ConferenceWins int,
    ConferenceLosses int,
    Division varchar(25),
    Foreign Key(TeamID) References Teams(id)
);

-- Setting default values for the wins/losses to be 0
Alter Table AFC Alter Wins Set Default 0;
Alter Table AFC Alter Losses Set Default 0;
Alter Table AFC Alter ConferenceWins Set Default 0;
Alter Table AFC Alter ConferenceLosses Set Default 0;

-- Adding The AFC teams into the AFC table from my Teams table
Insert Into AFC(teamId, City, Mascot, Division) 
Select id, City, Mascot, Division from Teams
Where Conference = 'AFC';

-- Creating tables for each Division -- 

-- AFC North Creation
Create Table afcNorth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50),
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

Alter Table afcNorth
Add Constraint Unique(Mascot);

-- Adding AFC North Teams from the Teams table
Insert into afcNorth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC North';

-- AFC South Creation
Create Table afcSouth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding AFC South Teams from the Teams table
Insert into afcSouth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC South';

-- AFC East Creation
Create Table afcEast (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding AFC East Teams from the Teams table
Insert into afcEast(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC East';

-- AFC West Creation
Create Table afcWest (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding AFC West Teams from the Teams table
Insert into afcWest(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC West';


Select * from afcWest;
