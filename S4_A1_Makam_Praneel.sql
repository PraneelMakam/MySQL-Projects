-- Task 2 Create database by PRANEEL MAKAM
-- If there is a database with the provided name, delete that database.
DROP DATABASE IF EXISTS SOCCER_LEAGUE_PM;

-- Add a database with that name.
CREATE DATABASE SOCCER_LEAGUE_PM;

-- Mark the created database as the default database for the following operations.
USE SOCCER_LEAGUE_PM;

-- Show all the databases, find the created one in the list
SHOW DATABASES;


-- Task 3 - Create tables by PRANEEL MAKAM

-- List all the tables in the database (no table expected).
SHOW TABLES;

-- Create the tables from both S3 and S4 with the required specification.
-- Add to the tables in S3 any new table required by S4.

-- Create Coach table
CREATE TABLE IF NOT EXISTS COACH_PM (
    COACH_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    COACH_FIRST_NAME_PM VARCHAR(15) NOT NULL,
    COACH_LAST_NAME_PM VARCHAR(15) NOT NULL,
    COACH_DATE_OF_BIRTH_PM DATE NOT NULL,
    COACH_START_YEAR_PM INT NOT NULL,
    COACH_MOBILE_NUMBER_PM VARCHAR(12) NOT NULL
);

-- Create Team table
CREATE TABLE IF NOT EXISTS TEAM_PM (
    TEAM_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    TEAM_NAME_PM VARCHAR(30) NOT NULL,
    COACH_ID_PM INT NOT NULL,
    SEASON_PM ENUM('SPRING', 'FALL'),
    YEAR_PM YEAR NOT NULL,
    CONSTRAINT fk_coach_id FOREIGN KEY (COACH_ID_PM) REFERENCES COACH_PM(COACH_ID_PM)
);

-- Create Player table
CREATE TABLE IF NOT EXISTS PLAYER_PM (
    PLAYER_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    PLAYER_FIRST_NAME_PM VARCHAR(15) NOT NULL,
    PLAYER_LAST_NAME_PM VARCHAR(15) NOT NULL,
    PLAYER_DATE_OF_BIRTH_PM DATE NOT NULL,
    PLAYER_JERSEY_NUMBER_PM INT NOT NULL,
    PLAYER_PARENT_CONTACT_EMAIL_PM VARCHAR(20) NOT NULL
);

-- Create Team_player table
CREATE TABLE IF NOT EXISTS TEAM_PLAYER_PM (
    TEAM_PLAYER_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    TEAM_ID_PM INT NOT NULL,
    PLAYER_ID_PM INT NOT NULL,
    SEASON_PM ENUM('FALL', 'SPRING') NOT NULL,
    YEAR_PM YEAR NOT NULL,
	PLAYER_JERSEY_NUMBER_PM INT NOT NULL, 
    CONSTRAINT fk_team_id FOREIGN KEY (TEAM_ID_PM) REFERENCES TEAM_PM(TEAM_ID_PM),
    CONSTRAINT fk_player_id FOREIGN KEY (PLAYER_ID_PM) REFERENCES PLAYER_PM(PLAYER_ID_PM),
    CONSTRAINT unique_jersey_number_per_team_season UNIQUE (TEAM_ID_PM, SEASON_PM, YEAR_PM, PLAYER_JERSEY_NUMBER_PM)
);

-- Create Coach_Team table 
CREATE TABLE IF NOT EXISTS COACH_TEAM_PM (
    COACH_TEAM_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    COACH_ID_PM INT NOT NULL,
    TEAM_ID_PM INT NOT NULL,
    SEASON_PM ENUM('SPRING', 'FALL') NOT NULL,
    YEAR_PM YEAR NOT NULL,
    CONSTRAINT fk_team_id2 FOREIGN KEY (TEAM_ID_PM) REFERENCES TEAM_PM(TEAM_ID_PM),
    CONSTRAINT fk_coach_id2 FOREIGN KEY (COACH_ID_PM) REFERENCES COACH_PM(COACH_ID_PM),
    CONSTRAINT unique_coach_per_team_season UNIQUE (TEAM_ID_PM, SEASON_PM, YEAR_PM)
);



-- List all the tables in the database (the new tables must appear).
SHOW TABLES;

-- Show the structure of the created tables (both S3 and S4).
DESCRIBE PLAYER_PM;
DESCRIBE TEAM_PM;
DESCRIBE COACH_PM;
DESCRIBE TEAM_PLAYER_PM;
DESCRIBE COACH_TEAM_PM;



-- Task 4: Add data by PRANEEL MAKAM

-- Show all data in the tables (no data expected)
SELECT * FROM PLAYER_PM;
SELECT * FROM COACH_PM;
SELECT * FROM TEAM_PM;
SELECT * FROM TEAM_PLAYER_PM;
SELECT * FROM COACH_TEAM_PM;

-- Add data to the tables
-- Example data for player table
INSERT INTO PLAYER_PM (PLAYER_FIRST_NAME_PM, PLAYER_LAST_NAME_PM, PLAYER_DATE_OF_BIRTH_PM, PLAYER_JERSEY_NUMBER_PM, PLAYER_PARENT_CONTACT_EMAIL_PM)
VALUES ('John', 'Doe', '1995-05-15', 35, LEFT('john.doe@example.com', 20)), 
('Jane', 'Smith', '1998-09-22', 10, LEFT('jane.smith@example.com', 20)), 
('Michael', 'Johnson', '1996-03-10', 7, LEFT('michael.johnson@example.com', 20)), 
('Sarah', 'Williams', '2000-11-28', 21, LEFT('sarah.williams@example.com', 20)), 
('David', 'Brown', '1994-07-18', 14, LEFT('david.brown@example.com', 20)), 
('Chris', 'Taylor', '1999-06-05', 35, LEFT('chris.taylor@example.com', 20)); 

-- Example data for coach table
INSERT INTO COACH_PM (COACH_FIRST_NAME_PM, COACH_LAST_NAME_PM, COACH_DATE_OF_BIRTH_PM, COACH_START_YEAR_PM, COACH_MOBILE_NUMBER_PM)
VALUES ('Mark', 'Johnson', '1985-01-10', 2018, '555-555-5555'),
('Anna', 'Smith', '1990-02-20', 2015, '444-444-4444'),
('Peter', 'Brown', '1982-09-05', 2008, '333-333-3333'),	
('Jennifer', 'Lee', '1995-06-12', 2020, '222-222-2222'),
('Michael', 'Davis', '1988-12-25', 2020, '111-111-1111');

-- Example data for team table
INSERT INTO TEAM_PM (TEAM_NAME_PM, COACH_ID_PM, SEASON_PM, YEAR_PM)
VALUES ('Team A', 1, 'SPRING', 2023),
('Team B', 2, 'FALL', 2023),
('Team C', 3, 'SPRING', 2023),
('Team D', 1, 'FALL', 2023),
('Team E', 2, 'SPRING', 2023),
('Team F', 3, 'FALL', 2023);

-- Example data for team_player table
INSERT INTO TEAM_PLAYER_PM (TEAM_ID_PM, PLAYER_ID_PM, SEASON_PM, YEAR_PM, PLAYER_JERSEY_NUMBER_PM)
VALUES (1, 1, 'FALL', 2023, 35),
(2, 2, 'SPRING', 2023, 10),
(1, 3, 'SPRING', 2023, 7),
(3, 4, 'FALL', 2023, 21),
(2, 5, 'SPRING', 2023, 14),
(2, 6, 'SPRING', 2023, 35); -- Two players with jersey number 35

-- Example data for coach_team table
INSERT INTO COACH_TEAM_PM (COACH_ID_PM, TEAM_ID_PM, SEASON_PM, YEAR_PM)
VALUES (1, 1, 'FALL', 2023),
(2, 2, 'SPRING', 2023),
(3, 3, 'SPRING', 2023),
(4, 4, 'FALL', 2023),
(5, 5, 'SPRING', 2023),
(1, 6, 'FALL', 2023);

-- Show all data in the tables (updated data)
SELECT * FROM PLAYER_PM;
SELECT * FROM COACH_PM;
SELECT * FROM TEAM_PM;
SELECT * FROM TEAM_PLAYER_PM;
SELECT * FROM COACH_TEAM_PM;


-- Task 5 - Query the data by PRANEEL MAKAM

-- Count all the players registered for a team in FALL 2020.
SELECT COUNT(*) AS Num_of_Players_In_Fall_2020
FROM TEAM_PLAYER_PM
WHERE SEASON_PM = 'FALL' AND YEAR_PM = 2020;

-- Count all the coaches hired by a club in SPRING 2020.
SELECT COUNT(*) AS Num_of_Coaches_In_Spring_2020
FROM COACH_TEAM_PM
WHERE SEASON_PM = 'SPRING' AND YEAR_PM = 2020;

-- List the player(s) that have the biggest jersey number (the full name in a column named player).
SELECT CONCAT(PLAYER_FIRST_NAME_PM,' ',PLAYER_LAST_NAME_PM) AS player, PLAYER_JERSEY_NUMBER_PM
FROM PLAYER_PM
WHERE PLAYER_JERSEY_NUMBER_PM = (
SELECT MAX(PLAYER_JERSEY_NUMBER_PM) FROM PLAYER_PM
);

-- List the least experienced coaches (the full name in a column named coach).
SELECT CONCAT(COACH_FIRST_NAME_PM,' ',COACH_LAST_NAME_PM) AS coach, COACH_START_YEAR_PM
FROM COACH_PM
WHERE COACH_START_YEAR_PM = (
SELECT MIN(COACH_START_YEAR_PM) FROM COACH_PM
);
