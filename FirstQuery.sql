-- Creating the Teams Table
Create Table Teams (
	id int Primary Key Auto_Increment,
    City varchar(50),
    Mascot varchar(50) Unique,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    ConferenceWins int DEFAULT 0,
    ConferenceLosses int DEFAULT 0,
    ConferenceDraws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
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
    Draws int DEFAULT 0,
    ConferenceWins int,
    ConferenceLosses int,
    ConferenceDraws int DEFAULT 0,
    Division varchar(25),
    Foreign Key(teamID) References Teams(id)
);

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
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    ConferenceWins int DEFAULT 0,
    ConferenceLosses int DEFAULT 0,
    ConferenceDraws int DEFAULT 0,
    Division varchar(25),
    Foreign Key(TeamID) References Teams(id)
);

-- Adding The AFC teams into the AFC table from my Teams table
Insert Into AFC(teamId, City, Mascot, Division) 
Select id, City, Mascot, Division from Teams
Where Conference = 'AFC';

-- Creating tables for each Division -- 

-- AFC North Creation
Create Table afcNorth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding AFC North Teams from the Teams table
Insert into afcNorth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC North';

-- AFC South Creation
Create Table afcSouth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding AFC South Teams from the Teams table
Insert into afcSouth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC South';

-- AFC East Creation
Create Table afcEast (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding AFC East Teams from the Teams table
Insert into afcEast(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC East';

-- AFC West Creation
Create Table afcWest (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

Alter Table afcWest
Add column Draws int DEFAULT 0 After Losses,
Add column DivisionDraws int DEFAULT 0 After DivisionLosses;


-- Adding AFC West Teams from the Teams table
Insert into afcWest(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'AFC West';

-- NFC North Creation
Create Table nfcNorth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);


-- Adding NFC North Teams from the Teams table
Insert into nfcNorth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC North';

-- NFC South Creation
Create Table nfcSouth (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding NFC South Teams from the Teams table
Insert into nfcSouth(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC South';

-- NFC East Creation
Create Table nfcEast (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
    Foreign Key(teamID) References Teams(id)
);

-- Adding NFC East Teams from the Teams table
Insert into nfcEast(teamId, City, Mascot) Select id, City, Mascot from Teams 
Where Division = 'NFC East';

-- NFC West Creation
Create Table nfcWest (
	teamId int Primary Key,
    City varchar(50),
    Mascot varchar(50) UNIQUE,
    Wins int DEFAULT 0,
    Losses int DEFAULT 0,
    Draws int DEFAULT 0,
    DivisionWins int DEFAULT 0,
    DivisionLosses int DEFAULT 0,
    DivisionDraws int DEFAULT 0,
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

-- Adding in schedule information for the Green Bay Packers
Update regSeasonSchedule Set 
week1 = 26, week2 = 14, week3 = 31, week4 = 21, week5 = 19, week6 = 1, week7 = 13, week8 = 15, 
week9 = 11, week10 = null, week11 = 6, week12 = 28, week13 = 20, week14 = 11, week15 = 29, 
week16 = 23, week17 = 21, week18 = 6
Where teamId = 12;

-- Adding in schedule information for the Houston Texans
Update regSeasonSchedule Set 
week1 = 14, week2 = 6, week3 = 21, week4 = 15, week5 = 4, week6 = 22, week7 = 12, week8 = 14, 
week9 = 25, week10 = 11, week11 = 9, week12 = 31, week13 = 15, week14 = null, week15 = 20, 
week16 = 16, week17 = 3, week18 = 31
Where teamId = 13;

-- Adding in schedule information for the Indianapolis  Colts
Update regSeasonSchedule Set 
week1 = 13, week2 = 12, week3 = 6, week4 = 27, week5 = 15, week6 = 31, week7 = 20, week8 = 13, 
week9 = 21, week10 = 4, week11 = 25, week12 = 11, week13 = 22, week14 = null, week15 = 10, 
week16 = 31, week17 = 24, week18 = 15
Where teamId = 14;

-- Adding in schedule information for the Jacksonville Jaguars
Update regSeasonSchedule Set 
week1 = 20, week2 = 8, week3 = 4, week4 = 13, week5 = 14, week6 = 6, week7 = 22, week8 = 12, 
week9 = 26, week10 = 21, week11 = 11, week12 = null, week13 = 13, week14 = 31, week15 = 25, 
week16 = 17, week17 = 31, week18 = 14
Where teamId = 15;

-- Adding in schedule information for the Kansas City Chiefs
Update regSeasonSchedule Set 
week1 = 3, week2 = 7, week3 = 2, week4 = 18, week5 = 23, week6 = null, week7 = 28, week8 = 17, 
week9 = 30, week10 = 10, week11 = 4, week12 = 5, week13 = 17, week14 = 18, week15 = 8, 
week16 = 13, week17 = 27, week18 = 10
Where teamId = 16;

-- Adding in schedule information for the Las Vegas Raiders
Update regSeasonSchedule Set 
week1 = 18, week2 = 3, week3 = 5, week4 = 8, week5 = 10, week6 = 27, week7 = 19, week8 = 16, 
week9 = 7, week10 = null, week11 = 20, week12 = 10, week13 = 16, week14 = 30, week15 = 2, 
week16 = 15, week17 = 23, week18 = 18
Where teamId = 17;

-- Adding in schedule information for the Los Angeles Chargers
Update regSeasonSchedule Set 
week1 = 17, week2 = 5, week3 = 27, week4 = 16, week5 = null, week6 = 10, week7 = 1, week8 = 23, 
week9 = 8, week10 = 31, week11 = 7, week12 = 3, week13 = 2, week14 = 16, week15 = 30, 
week16 = 10, week17 = 22, week18 = 17
Where teamId = 18;

-- Adding in schedule information for the Los Angeles Rams
Update regSeasonSchedule Set 
week1 = 11, week2 = 1, week3 = 28, week4 = 6, week5 = 12, week6 = null, week7 = 17, week8 = 21, 
week9 = 29, week10 = 20, week11 = 22, week12 = 26, week13 = 23, week14 = 4, week15 = 28, 
week16 = 25, week17 = 1, week18 = 29
Where teamId = 19;

-- Adding in schedule information for the Miami Dolphins
Update regSeasonSchedule Set 
week1 = 15, week2 = 4, week3 = 29, week4 = 31, week5 = 22, week6 = null, week7 = 14, week8 = 1, 
week9 = 4, week10 = 19, week11 = 17, week12 = 22, week13 = 12, week14 = 25, week15 = 13, 
week16 = 28, week17 = 8, week18 = 25
Where teamId = 20;

-- Adding in schedule information for the Minnesota Vikings
Update regSeasonSchedule Set 
week1 = 24, week2 = 28, week3 = 13, week4 = 12, week5 = 25, week6 = null, week7 = 11, week8 = 19, 
week9 = 14, week10 = 15, week11 = 31, week12 = 6, week13 = 1, week14 = 2, week15 = 6, 
week16 = 29, week17 = 12, week18 = 11
Where teamId = 21;

-- Adding in schedule information for the New England Patriots
Update regSeasonSchedule Set 
week1 = 7, week2 = 29, week3 = 25, week4 = 28, week5 = 20, week6 = 13, week7 = 15, week8 = 25, 
week9 = 31, week10 = 6, week11 = 19, week12 = 20, week13 = 14, week14 = null, week15 = 1, 
week16 = 4, week17 = 18, week18 = 4
Where teamId = 22;

-- Adding in schedule information for the New Orleans Saints
Update regSeasonSchedule Set 
week1 = 5, week2 = 9, week3 = 26, week4 = 2, week5 = 16, week6 = 30, week7 = 10, week8 = 18, 
week9 = 5, week10 = 2, week11 = 8, week12 = null, week13 = 19, week14 = 24, week15 = 32, 
week16 = 12, week17 = 17, week18 = 30
Where teamId = 23;

-- Adding in schedule information for the New York Giants
Update regSeasonSchedule Set 
week1 = 21, week2 = 32, week3 = 8, week4 = 9, week5 = 29, week6 = 7, week7 = 26, week8 = 27, 
week9 = 32, week10 = 5, week11 = null, week12 = 30, week13 = 9, week14 = 23, week15 = 3, 
week16 = 2, week17 = 14, week18 = 26
Where teamId = 24;

-- Adding in schedule information for the New York Jets
Update regSeasonSchedule Set 
week1 = 28, week2 = 31, week3 = 22, week4 = 10, week5 = 21, week6 = 4, week7 = 27, week8 = 22, 
week9 = 13, week10 = 1, week11 = 14, week12 = null, week13 = 29, week14 = 20, week15 = 15, 
week16 = 19, week17 = 4, week18 = 20
Where teamId = 25;

-- Adding in schedule information for the Philadelphia Eagles
Update regSeasonSchedule Set 
week1 = 12, week2 = 2, week3 = 23, week4 = 30, week5 = null, week6 = 8, week7 = 24, week8 = 7, 
week9 = 15, week10 = 9, week11 = 32, week12 = 19, week13 = 3, week14 = 5, week15 = 27, 
week16 = 32, week17 = 9, week18 = 24
Where teamId = 26;

-- Adding in schedule information for the Pittsburgh Steelers
Update regSeasonSchedule Set 
week1 = 2, week2 = 10, week3 = 18, week4 = 14, week5 = 9, week6 = 17, week7 = 25, week8 = 24, 
week9 = null, week10 = 32, week11 = 3, week12 = 8, week13 = 7, week14 = 8, week15 = 26, 
week16 = 3, week17 = 16, week18 = 7
Where teamId = 27;

-- Adding in schedule information for the San Francisco 49ers
Update regSeasonSchedule Set 
week1 = 25, week2 = 21, week3 = 19, week4 = 22, week5 = 1, week6 = 29, week7 = 16, week8 = 9, 
week9 = null, week10 = 30, week11 = 29, week12 = 12, week13 = 4, week14 = 6, week15 = 19, 
week16 = 20, week17 = 11, week18 = 1
Where teamId = 28;

-- Adding in schedule information for the Seattle Seahawks
Update regSeasonSchedule Set 
week1 = 10, week2 = 22, week3 = 20, week4 = 11, week5 = 24, week6 = 28, week7 = 2, week8 = 4, 
week9 = 19, week10 = null, week11 = 28, week12 = 1, week13 = 25, week14 = 1, week15 = 12, 
week16 = 21, week17 = 6, week18 = 19
Where teamId = 29;

-- Adding in schedule information for the Tampa Bay Buccaneers
Update regSeasonSchedule Set 
week1 = 32, week2 = 11, week3 = 10, week4 = 26, week5 = 2, week6 = 23, week7 = 3, week8 = 2, 
week9 = 16, week10 = 28, week11 = null, week12 = 24, week13 = 5, week14 = 17, week15 = 18, 
week16 = 9, week17 = 5, week18 = 23
Where teamId = 30;

-- Adding in schedule information for the Tennessee Titans
Update regSeasonSchedule Set 
week1 = 6, week2 = 25, week3 = 12, week4 = 20, week5 = null, week6 = 14, week7 = 4, week8 = 11, 
week9 = 22, week10 = 18, week11 = 21, week12 = 13, week13 = 32, week14 = 15, week15 = 7, 
week16 = 14, week17 = 15, week18 = 13
Where teamId = 31;

-- Adding in schedule information for the Washington Commanders
Update regSeasonSchedule Set 
week1 = 30, week2 = 24, week3 = 7, week4 = 1, week5 = 8, week6 = 3, week7 = 5, week8 = 6, 
week9 = 24, week10 = 27, week11 = 26, week12 = 9, week13 = 31, week14 = null, week15 = 23, 
week16 = 26, week17 = 2, week18 = 9
Where teamId = 32;

-- Adding in the regular season results table
Create Table regSeasonResults (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    week1 char, week2 char, week3 char, week4 char, week5 char, week6 char, week7 char,
    week8 char, week9 char, week10 char, week11 char, week12 char, week13 char, week14 char,
    week15 char, week16 char, week17 char, week18 char,
    Foreign Key(teamId) references Teams(id)
);

-- Adding all of the teams into the results table
Insert Into regSeasonResults(teamId, City, Mascot) Select id, City, Mascot from Teams;

-- Creating playoff tables for the league

-- Creating the wild card rounds
Create Table nfcWildCard (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    conferenceSeed int Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

Create Table afcWildCard (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    conferenceSeed int Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

-- Creating the divisional Round
Create Table nfcDivisional (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    conferenceSeed int Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

Create Table afcDivisional (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    conferenceSeed int Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

-- Creating the Conference Championship rounds
Create Table nfcConfChamp (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    conferenceSeed int Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

Create Table afcConfChamp (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    conferenceSeed int Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

-- Creating a Super Bowl
Create Table superBowl (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    Result char,
    Foreign Key(teamId) references Teams(id)
);

-- Creating a table to track team ratings
Create Table teamRatings (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    Rating int,
    Foreign Key(teamId) references Teams(id)
);

-- Putting the teams into the team ratings table
Insert into teamRatings(teamId, City, Mascot) Select id, City, Mascot from Teams;

-- Giving all the teams their proper ratings
Update teamRatings Set Rating = 51 Where teamId = 1;
Update teamRatings Set Rating = 71 Where teamId = 2;
Update teamRatings Set Rating = 95 Where teamId = 3;
Update teamRatings Set Rating = 87 Where teamId = 4;
Update teamRatings Set Rating = 41 Where teamId = 5;
Update teamRatings Set Rating = 55 Where teamId = 6;
Update teamRatings Set Rating = 89 Where teamId = 7;
Update teamRatings Set Rating = 81 Where teamId = 8;
Update teamRatings Set Rating = 85 Where teamId = 9;
Update teamRatings Set Rating = 45 Where teamId = 10;
Update teamRatings Set Rating = 93 Where teamId = 11;
Update teamRatings Set Rating = 79 Where teamId = 12;
Update teamRatings Set Rating = 77 Where teamId = 13;
Update teamRatings Set Rating = 61 Where teamId = 14;
Update teamRatings Set Rating = 69 Where teamId = 15;
Update teamRatings Set Rating = 98 Where teamId = 16;
Update teamRatings Set Rating = 47 Where teamId = 17;
Update teamRatings Set Rating = 75 Where teamId = 19;
Update teamRatings Set Rating = 83 Where teamId = 20;
Update teamRatings Set Rating = 57 Where teamId = 21;
Update teamRatings Set Rating = 39 Where teamId = 22;
Update teamRatings Set Rating = 53 Where teamId = 23;
Update teamRatings Set Rating = 43 Where teamId = 24;
Update teamRatings Set Rating = 73 Where teamId = 25;
Update teamRatings Set Rating = 91 Where teamId = 26;
Update teamRatings Set Rating = 67 Where teamId = 27;
Update teamRatings Set Rating = 99 Where teamId = 28;
Update teamRatings Set Rating = 63 Where teamId = 29;
Update teamRatings Set Rating = 65 Where teamId = 30;
Update teamRatings Set Rating = 49 Where teamId = 31;
Update teamRatings Set Rating = 37 Where teamId = 32;

-- Making a table for tracking home & away games
Create Table gameSite (
	teamId int Primary Key,
    City varchar(25),
    Mascot varchar(25) Unique,
    week1 char, week2 char, week3 char, week4 char, week5 char, week6 char,
    week7 char, week8 char, week9 char, week10 char, week11 char, week12 char,
    week13 char, week14 char, week15 char, week16 char, week17 char, week18 char,
    Foreign Key(teamID) References Teams(id)
);

-- Put all the teams into the gameSite table
Insert into gameSite(teamId, City, Mascot) Select id, City, Mascot from Teams;

-- Adding in home/away for all of the teams

-- Updating game sites for the Arizona Cardinals
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'H', week4 = 'H', week5 = 'A', week6 = 'A',
				week7 = 'H', week8 = 'A', week9 = 'H', week10 = 'H', week11 = null, week12 = 'A',
                week13 = 'A', week14 = 'H', week15 = 'H', week16 = 'A', week17 = 'A', week18 = 'H'
Where teamId = 1;

-- Updating game sites for the Atlanta Falcons
Update gameSite Set week1 = 'H', week2 = 'A', week3 = 'H', week4 = 'H', week5 = 'H', week6 = 'A',
				week7 = 'H', week8 = 'A', week9 = 'H', week10 = 'A', week11 = 'A', week12 = null,
                week13 = 'H', week14 = 'A', week15 = 'A', week16 = 'H', week17 = 'A', week18 = 'H'
Where teamId = 2;

-- Updating game sites for the Baltimore Ravens
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'A', week4 = 'H', week5 = 'A', week6 = 'H',
				week7 = 'A', week8 = 'A', week9 = 'H', week10 = 'H', week11 = 'A', week12 = 'A',
                week13 = 'H', week14 = null, week15 = 'A', week16 = 'H', week17 = 'A', week18 = 'H'
Where teamId = 3;

-- Updating game sites for the Buffalo Bills
Update gameSite Set week1 = 'H', week2 = 'A', week3 = 'H', week4 = 'A', week5 = 'A', week6 = 'A',
				week7 = 'H', week8 = 'A', week9 = 'H', week10 = 'A', week11 = 'H', week12 = null,
                week13 = 'H', week14 = 'A', week15 = 'A', week16 = 'H', week17 = 'H', week18 = 'A'
Where teamId = 4;

-- Updating game sites for the Carolina Panthers
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'A', week4 = 'H', week5 = 'A', week6 = 'H',
				week7 = 'A', week8 = 'A', week9 = 'H', week10 = 'H', week11 = null, week12 = 'H',
                week13 = 'H', week14 = 'A', week15 = 'H', week16 = 'H', week17 = 'A', week18 = 'A'
Where teamId = 5;

-- Updating game sites for the Chicago Bears
Update gameSite Set week1 = 'H', week2 = 'A', week3 = 'A', week4 = 'H', week5 = 'H', week6 = 'H',
				week7 = null, week8 = 'A', week9 = 'A', week10 = 'H', week11 = 'H', week12 = 'H',
                week13 = 'A', week14 = 'A', week15 = 'A', week16 = 'H', week17 = 'H', week18 = 'A'
Where teamId = 6;

-- Updating game sites for the Cincinnati Bengals
Update gameSite Set week1 = 'H', week2 = 'A', week3 = 'H', week4 = 'A', week5 = 'H', week6 = 'A',
				week7 = 'A', week8 = 'H', week9 = 'H', week10 = 'A', week11 = 'A', week12 = null,
                week13 = 'H', week14 = 'A', week15 = 'A', week16 = 'H', week17 = 'H', week18 = 'A'
Where teamId = 7;

-- Updating game sites for the Cleveland Browns
Update gameSite Set week1 = 'H', week2 = 'A', week3 = 'H', week4 = 'A', week5 = 'A', week6 = 'A',
				week7 = 'H', week8 = 'H', week9 = 'H', week10 = null, week11 = 'A', week12 = 'H',
                week13 = 'A', week14 = 'A', week15 = 'H', week16 = 'A', week17 = 'H', week18 = 'A'
Where teamId = 8;

-- Updating game sites for the Dallas Cowboys
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'H', week4 = 'A', week5 = 'A', week6 = 'H',
				week7 = null, week8 = 'A', week9 = 'A', week10 = 'H', week11 = 'H', week12 = 'A',
                week13 = 'H', week14 = 'H', week15 = 'A', week16 = 'H', week17 = 'A', week18 = 'H'
Where teamId = 9;

-- Updating game sites for the Denver Broncos
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'A', week4 = 'A', week5 = 'H', week6 = 'H',
				week7 = 'A', week8 = 'H', week9 = 'A', week10 = 'A', week11 = 'H', week12 = 'A',
                week13 = 'H', week14 = null, week15 = 'H', week16 = 'A', week17 = 'A', week18 = 'H'
Where teamId = 10;

-- Updating game sites for the Detroit Lions
Update gameSite Set week1 = 'H', week2 = 'H', week3 = 'A', week4 = 'H', week5 = null, week6 = 'A',
				week7 = 'A', week8 = 'H', week9 = 'A', week10 = 'A', week11 = 'H', week12 = 'A',
                week13 = 'H', week14 = 'H', week15 = 'H', week16 = 'A', week17 = 'A', week18 = 'H'
Where teamId = 11;

-- Updating game sites for the Green Bay Packers
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'A', week4 = 'H', week5 = 'A', week6 = 'H',
				week7 = 'H', week8 = 'A', week9 = 'H', week10 = null, week11 = 'A', week12 = 'H',
                week13 = 'H', week14 = 'A', week15 = 'A', week16 = 'H', week17 = 'A', week18 = 'H'
Where teamId = 12;

-- Updating game sites for the Houston Texans
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'A', week4 = 'H', week5 = 'H', week6 = 'A',
				week7 = 'A', week8 = 'H', week9 = 'A', week10 = 'H', week11 = 'A', week12 = 'H',
                week13 = 'A', week14 = null, week15 = 'H', week16 = 'A', week17 = 'H', week18 = 'A'
Where teamId = 13;

-- Updating game sites for the Indianapolis Colts
Update gameSite Set week1 = 'H', week2 = 'A', week3 = 'H', week4 = 'H', week5 = 'A', week6 = 'A',
				week7 = 'H', week8 = 'A', week9 = 'A', week10 = 'H', week11 = 'A', week12 = 'H',
                week13 = 'A', week14 = null, week15 = 'A', week16 = 'H', week17 = 'A', week18 = 'H'
Where teamId = 14;

-- Updating game sites for the Jacksonville Jaguars
Update gameSite Set week1 = 'A', week2 = 'H', week3 = 'A', week4 = 'A', week5 = 'H', week6 = 'A',
				week7 = 'H', week8 = 'H', week9 = 'A', week10 = 'H', week11 = 'A', week12 = null,
                week13 = 'H', week14 = 'A', week15 = 'H', week16 = 'A', week17 = 'H', week18 = 'A'
Where teamId = 15;

-- Updating game sites for the Kansas City Chiefs
Update gameSite Set week1 = 'H', week2 = 'H', week3 = 'A', week4 = 'A', week5 = 'H', week6 = null,
				week7 = 'A', week8 = 'A', week9 = 'H', week10 = 'H', week11 = 'A', week12 = 'A',
                week13 = 'H', week14 = 'H', week15 = 'A', week16 = 'H', week17 = 'A', week18 = 'A'
Where teamId = 16;

Select * from gameSite;

