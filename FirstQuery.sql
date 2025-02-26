-- Creating the Teams Table
Create Table Teams (
	id int Primary Key Auto_Increment,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    ConferenceWins int DEFAULT 0,
    ConferenceLosses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Division varchar(25),
    Conference varchar(3)
);

-- Adding all of the teams to the table
Insert Into Teams (City, Mascot, Division, Conference)
Values(
	('Arizona', 'Cardinals', 'NFC West', 'NFC')
);

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

-- NFC North Creation
Create Table nfcNorth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding NFC North Teams from the Teams table
Insert into nfcNorth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC North';

-- NFC South Creation
Create Table nfcSouth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding NFC South Teams from the Teams table
Insert into nfcSouth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC South';

-- NFC East Creation
Create Table nfcEast (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding NFC East Teams from the Teams table
Insert into nfcEast(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC East';

-- NFC West Creation
Create Table nfcWest (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding NFC West teams from the Teams table
Insert into nfcWest(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC West';

-- Making the Schedule for each team
Create Table regSeasonSchedule (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) Unique,
    week1 int, week2 int, week3 int, week4 int, week5 int, week6 int,
    week7 int, week8 int, week9 int, week10 int, week11 int, week12 int,
    week13 int, week14 int, week15 int, week16 int, week17 int, week18 int,
    Foreign Key(teamID) References Teams(id)
);

-- adding all of the teams to the regular season schedule table
Insert into regSeasonSchedule(teamId, City, Mascot) 
Select id, City, Mascot from Teams;

-- Adding in the schedule information for the Arizona Cardinals
Update regSeasonSchedule Set week1 = 4 where teamId = 1;

Update regSeasonSchedule Set 
week2 = 19, week3 = 11, week4 = 32, week5 = 28, week6 = 12, week7 = 18, week8 = 20,
week9 = 6, week10 = 25, week12 = 29, week13 = 21, week14 = 29, week15 = 22, week16 = 5,
week17 = 19, week18 = 28
Where teamId = 1;

-- Adding in schedule information for the Atlanta Falcons
Update regSeasonSchedule Set
week1 = 27, week2 = 26, week3 = 16, week4 = 23, week5 = 30, week6 = 5, week7 = 29, 
week8 = 30, week9 = 9, week10 = 23, week11 = 10, week13 = 18, week14 = 21, week15 = 17,
week16 = 24, week17 = 32, week18 = 5
Where teamId = 2;

-- Adding in schedule information for the Baltimore Ravens
Update regSeasonSchedule Set
week1 = 16, week2 = 17, week3 = 9, week4 = 4, week5 = 7, week6 = 32, week7 = 30, week8 = 8,
week9 = 10, week10 = 7, week11 = 27, week12 = 18, week13 = 26, week15 = 24, week16 = 27,
week17 = 13, week18 = 8
Where teamId = 3;

-- Adding in schedule information for the Buffalo Bills
Update regSeasonSchedule Set
week1 = 1, week2 = 20, week3 = 15, week4 = 3, week5 = 13, week6 = 25, week7 = 31, week8 = 29,
week9 = 20, week10 = 14, week11 = 16, week13 = 28, week14 = 19, week15 = 11, week16 = 22,
week17 = 25, week18 = 22
Where teamId = 4;

Select * from regSeasonSchedule;

