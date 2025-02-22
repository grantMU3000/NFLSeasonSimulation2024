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

Alter Table NFC
Add constraint fk_NFCteam_id
Foreign Key(teamID) References Teams(id);

Insert into NFC(teamId, City, Mascot, Division) Select id, City, Mascot, Division from Teams
Where Conference = 'NFC';

Alter Table NFC
Alter Wins
Set Default 0;

Update NFC Set Wins = 0;
Update NFC Set Losses = 0;
Update NFC Set ConferenceWins = 0;
Update NFC Set ConferenceLosses = 0;

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

Alter Table AFC Alter Wins Set Default 0;
Alter Table AFC Alter Losses Set Default 0;
Alter Table AFC Alter ConferenceWins Set Default 0;
Alter Table AFC Alter ConferenceLosses Set Default 0;

Insert Into AFC(teamId, City, Mascot, Division) 
Select id, City, Mascot, Division from Teams
Where Conference = 'AFC';

Select * from AFC;
