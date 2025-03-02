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

-- Adding in schedule information for the Carolina Panthers
Update regSeasonSchedule Set
week1 = 23, week2 = 18, week3 = 17, week4 = 7, week5 = 6, week6 = 2, week7 = 32, week8 = 10,
week9 = 23, week10 = 24, week12 = 16, week13 = 30, week14 = 26, week15 = 9, week16 = 1,
week17 = 30, week18 = 2
Where teamId = 5;

-- Adding in schedule information for the Chicago Bears
Update regSeasonSchedule Set
week1 = 31, week2 = 13, week3 = 14, week4 = 19, week5 = 5, week6 = 15, week8 = 32, week9 = 1,
week10 = 22, week11 = 12, week12 = 21, week13 = 11, week14 = 28, week15 = 21, week16 = 11,
week17 = 29, week18 = 12
Where teamId = 6;

-- Adding in schedule information for the Cincinnati Bengals
Update regSeasonSchedule Set
week1 = 22, week2 = 16, week3 = 32, week4 = 5, week5 = 3, week6 = 24, week7 = 8, week8 = 26, 
week9 = 17, week10 = 3, week11 = 18, week12 = null, week13 = 27, week14 = 9, week15 = 31, 
week16 = 8, week17 = 10, week18 = 27
Where teamId = 7;

-- Adding in schedule information for the Cleveland Browns
Update regSeasonSchedule Set
week1 = 9, week2 = 15, week3 = 24, week4 = 17, week5 = 32, week6 = 26, week7 = 7, week8 = 3, 
week9 = 18, week10 = null, week11 = 23, week12 = 27, week13 = 10, week14 = 27, week15 = 16, 
week16 = 7, week17 = 20, week18 = 3
Where teamId = 8;

-- Adding in schedule information for the Dallas Cowboys
Update regSeasonSchedule Set
week1 = 8, week2 = 23, week3 = 3, week4 = 24, week5 = 27, week6 = 11, week7 = null, week8 = 28, 
week9 = 2, week10 = 26, week11 = 13, week12 = 32, week13 = 24, week14 = 7, week15 = 5, 
week16 = 30, week17 = 26, week18 = 32
Where teamId = 9;

-- Adding in schedule information for the Denver Broncos
Update regSeasonSchedule Set
week1 = 29, week2 = 27, week3 = 30, week4 = 25, week5 = 17, week6 = 18, week7 = 23, week8 = 5, 
week9 = 3, week10 = 16, week11 = 2, week12 = 17, week13 = 8, week14 = null, week15 = 14, 
week16 = 18, week17 = 7, week18 = 16
Where teamId = 10;

-- Adding in schedule information for the Detroit  Lions
Update regSeasonSchedule Set 
week1 = 19, week2 = 30, week3 = 1, week4 = 29, week5 = null, week6 = 9, week7 = 21, week8 = 31, 
week9 = 12, week10 = 13, week11 = 15, week12 = 14, week13 = 6, week14 = 12, week15 = 4, 
week16 = 6, week17 = 28, week18 = 21
Where teamId = 11;

Select * from regSeasonSchedule;

