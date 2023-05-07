-- Task 2 Create database by Praneel Makam

-- Delete the database if exists
DROP DATABASE IF EXISTS SOCCER_PM;

-- Create the database
CREATE DATABASE IF NOT EXISTS SOCCER_PM;

-- Use the database for following operations
USE SOCCER_PM;

-- Show all the databases
SHOW DATABASES;

-- Task 3 - Create tables by Praneel Makam

-- List all the tables in the database
SHOW TABLES;

-- Create the Seasons table
CREATE TABLE SEASON_PM (
SEASON_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
SEASON_NAME_PM VARCHAR(20) NOT NULL,
REGISTRATION_START_DATE_PM DATE NOT NULL,
REGISTRATION_END_DATE_PM DATE NOT NULL,
SEASON_START_DATE_PM DATE NOT NULL,
SEASON_END_DATE_PM DATE NOT NULL,
SEMESTER_PM VARCHAR(10) NOT NULL,
CURRENT_SEASON_PM BOOLEAN DEFAULT FALSE
);


-- Create the Divisions table
CREATE TABLE DIVISION_PM (
DIVISION_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
DIVISION_NAME_PM VARCHAR(20) NOT NULL,
CONTACT_EMAIL_PM VARCHAR(30) NOT NULL,
CONTACT_PHONE_PM VARCHAR(15) NOT NULL
);

-- Create the Clubs table
CREATE TABLE CLUB_PM (
CLUB_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
CLUB_NAME_PM VARCHAR(22) NOT NULL,
CLUB_EMAIL_PM VARCHAR(30) NOT NULL,
CLUB_PHONE_PM VARCHAR(15) NOT NULL,
CLUB_ABBREVIATION_PM VARCHAR(5) NOT NULL
);

-- Create the Teams table
CREATE TABLE TEAM_PM (
TEAM_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
TEAM_NAME_PM VARCHAR(20) NOT NULL,
TEAM_EMAIL_PM VARCHAR(30) NOT NULL,
TEAM_PHONE_PM VARCHAR(15) NOT NULL,
BIRTH_YEAR_PM INT NOT NULL,
SEX_PM ENUM('Boys', 'Girls') NOT NULL,
CLUB_ID_PM INT NOT NULL,
FOREIGN KEY (CLUB_ID_PM) REFERENCES CLUB_PM(CLUB_ID_PM)
);

-- Create the Games table
CREATE TABLE GAME_PM(
GAME_ID_PM DECIMAL(8,0) NOT NULL UNIQUE PRIMARY KEY,
HOME_TEAM_ID_PM INT NOT NULL,
FOREIGN KEY (HOME_TEAM_ID_PM) REFERENCES TEAM_PM(TEAM_ID_PM),
AWAY_TEAM_ID_PM INT NOT NULL,
FOREIGN KEY (AWAY_TEAM_ID_PM) REFERENCES TEAM_PM(TEAM_ID_PM),
GAME_DATE_PM DATE NOT NULL,
GAME_TIME_PM CHAR(5) NOT NULL,
GAME_ZIP_PM DECIMAL(5,0) NOT NULL
);

-- Create Coaches table
CREATE TABLE COACH_PM (
    COACH_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    COACH_FIRST_NAME_PM VARCHAR(15) NOT NULL,
    COACH_LAST_NAME_PM VARCHAR(15) NOT NULL,
    COACH_DATE_OF_BIRTH_PM DATE NOT NULL,
    COACH_START_YEAR_PM INT NOT NULL,
    COACH_MOBILE_NUMBER_PM VARCHAR(12) NOT NULL
);


-- Create the Players table
CREATE TABLE PLAYER_PM(
PLAYER_ID INT PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME_PM VARCHAR(15) NOT NULL,
LAST_NAME_PM VARCHAR(15) NOT NULL,
BIRTHDATE_PM DATE NOT NULL,
HEIGHT_PM DECIMAL(5, 2) NOT NULL,
WEIGHT_PM DECIMAL(5, 2) NOT NULL,
TEAM_PM INT NOT NULL,
FOREIGN KEY (TEAM_PM) REFERENCES TEAM_PM(TEAM_ID_PM)
);

-- List all the tables in the database
SHOW TABLES;

-- Show the structure of the created tables
DESCRIBE TEAM_PM;
DESCRIBE DIVISION_PM;
DESCRIBE SEASON_PM;
DESCRIBE CLUB_PM;
DESCRIBE GAME_PM;
DESCRIBE COACH_PM;
DESCRIBE PLAYER_PM;

-- Task 4 - Add data by PRANEEL MAKAM

-- Show all data in tables
SELECT * FROM TEAM_PM;
SELECT * FROM DIVISION_PM;
SELECT * FROM SEASON_PM;
SELECT * FROM CLUB_PM;
SELECT * FROM GAME_PM;
SELECT * FROM COACH_PM;
SELECT * FROM PLAYER_PM;

-- Insert data into the Seasons table
INSERT INTO SEASON_PM (SEASON_NAME_PM, REGISTRATION_START_DATE_PM, REGISTRATION_END_DATE_PM, SEASON_START_DATE_PM, SEASON_END_DATE_PM, SEMESTER_PM) 
VALUES ('SPRING 2023', '2023-01-01', '2023-02-28', '2023-03-01', '2023-06-30', 'Spring');

-- Insert data into the Divisions table
INSERT INTO DIVISION_PM (DIVISION_NAME_PM, CONTACT_EMAIL_PM, CONTACT_PHONE_PM)
VALUES ('U14 Boys A', 'u14boysA@example.com', '(123) 456-7890'),
('U14 Boys B', 'u14boysB@example.com', '(123) 456-7891');

-- Insert data into the Clubs table
INSERT INTO CLUB_PM (CLUB_NAME_PM, CLUB_EMAIL_PM, CLUB_PHONE_PM, CLUB_ABBREVIATION_PM)
VALUES ('Club 1', 'club1@example.com', '(123) 456-7890', 'C1'),
('Club 2', 'club2@example.com', '(123) 456-7891', 'C2'),
('Club 3', 'club3@example.com', '(123) 456-7892', 'C3');

-- Insert data into the Teams table for Division A
INSERT INTO TEAM_PM (TEAM_NAME_PM, TEAM_EMAIL_PM, TEAM_PHONE_PM, BIRTH_YEAR_PM, SEX_PM, CLUB_ID_PM) 
VALUES ('Team 1', 'team1A@example.com', '(123) 456-7890', 2009, 'Boys', 1),  
('Team 2', 'team2A@example.com', '(123) 456-7891', 2009, 'Boys', 2),  
('Team 3', 'team3A@example.com', '(123) 456-7892', 2009, 'Boys', 3);

-- Insert data into the Teams table for Division B
INSERT INTO TEAM_PM (TEAM_NAME_PM, TEAM_EMAIL_PM, TEAM_PHONE_PM, BIRTH_YEAR_PM, SEX_PM, CLUB_ID_PM) 
VALUES ('Team 1', 'team1A@example.com', '(123) 456-7890', 2009, 'Boys', 1),  
('Team 2', 'team2A@example.com', '(123) 456-7891', 2009, 'Boys', 2),  
('Team 3', 'team3A@example.com', '(123) 456-7892', 2009, 'Boys', 3);

-- Insert data into the Games table for Division A
INSERT INTO GAME_PM (GAME_ID_PM, HOME_TEAM_ID_PM, AWAY_TEAM_ID_PM, GAME_DATE_PM, GAME_TIME_PM, GAME_ZIP_PM)
VALUES (1, 1, 2, '2023-03-01', '10:00', 12345),
(2, 1, 3, '2023-03-02', '11:00', 12345),
(3, 2, 3, '2023-03-03', '12:00', 12345);

-- Insert data into the Games table for Division B
INSERT INTO GAME_PM (GAME_ID_PM, HOME_TEAM_ID_PM, AWAY_TEAM_ID_PM, GAME_DATE_PM, GAME_TIME_PM, GAME_ZIP_PM)
VALUES (4, 1, 2, '2023-03-01', '10:00', 12345),
(5, 1, 3, '2023-03-02', '11:00', 12345),
(6, 2, 3, '2023-03-03', '12:00', 12345);

-- Insert data into the Coaches table
INSERT INTO COACH_PM (COACH_FIRST_NAME_PM, COACH_LAST_NAME_PM, COACH_DATE_OF_BIRTH_PM, COACH_START_YEAR_PM, COACH_MOBILE_NUMBER_PM)
VALUES ('Mark', 'Johnson', '1985-01-10', 2018, '555-555-5555'),
('Anna', 'Smith', '1990-02-20', 2015, '444-444-4444'),
('Peter', 'Brown', '1982-09-05', 2008, '333-333-3333'),	
('Jennifer', 'Lee', '1995-06-12', 2020, '222-222-2222'),
('Michael', 'Davis', '1988-12-25', 2020, '111-111-1111');

-- Insert data into the Players table for Team 1 of Division A
INSERT INTO PLAYER_PM (FIRST_NAME_PM, LAST_NAME_PM, BIRTHDATE_PM, HEIGHT_PM, WEIGHT_PM, TEAM_PM)
VALUES ('John', 'Doe', '2009-01-01', 5.5, 110, 1),
('Jack', 'Doe', '2009-02-02', 5.0, 100, 1);

-- Insert data into the Players table for Team 2 of Division A
INSERT INTO PLAYER_PM (FIRST_NAME_PM, LAST_NAME_PM, BIRTHDATE_PM, HEIGHT_PM, WEIGHT_PM, TEAM_PM)
VALUES ('Jim', 'Doe', '2009-03-03', 5.2, 120, 2),
('Jared', 'Doe', '2009-04-04', 5.1, 105, 2);

-- Insert data into the Players table for Team 3 of Division A
INSERT INTO PLAYER_PM (FIRST_NAME_PM, LAST_NAME_PM, BIRTHDATE_PM, HEIGHT_PM, WEIGHT_PM, TEAM_PM)
VALUES ('James', 'Doe', '2009-05-05', 5.3, 130, 3),
('June', 'Doe', '2009-06-06', 5.4, 115, 3);

-- Insert data into the Players table for Team 1 of Division B
INSERT INTO PLAYER_PM (FIRST_NAME_PM, LAST_NAME_PM, BIRTHDATE_PM, HEIGHT_PM, WEIGHT_PM, TEAM_PM)
VALUES ('Jake', 'Doe', '2009-07-07', 5.6, 140, 4),
('Joel', 'Doe', '2009-08-08', 5.5, 125, 4);

-- Insert data into the Players table for Team 2 of Division B
INSERT INTO PLAYER_PM (FIRST_NAME_PM, LAST_NAME_PM, BIRTHDATE_PM, HEIGHT_PM, WEIGHT_PM, TEAM_PM)
VALUES ('Jesse', 'Doe', '2009-09-09', 5.7, 150, 5),
('Joy', 'Doe', '2009-10-10', 5.8, 135, 5);

-- Insert data into the Players table for Team 3 of Division B
INSERT INTO PLAYER_PM (FIRST_NAME_PM, LAST_NAME_PM, BIRTHDATE_PM, HEIGHT_PM, WEIGHT_PM, TEAM_PM)
VALUES ('Jason', 'Doe', '2009-11-11', 5.8, 160, 6),
('Joey', 'Doe', '2009-12-12', 5.2, 110, 6);


-- Showing all data in tables
SELECT * FROM SEASON_PM;
SELECT * FROM DIVISION_PM;
SELECT * FROM CLUB_PM;
SELECT * FROM TEAM_PM;
SELECT * FROM PLAYER_PM;
SELECT * FROM COACH_PM;
SELECT * FROM GAME_PM;

-- Task 5 - Query the data by Praneel Makam

-- For each club (in alphabetic order) compute the total number of teams enrolled.
SELECT CLUB_PM.CLUB_NAME_PM, COUNT(*) AS 'NUMBER_OF_TEAMS_ENROLLED'
FROM TEAM_PM
JOIN CLUB_PM ON TEAM_PM.CLUB_ID_PM = CLUB_PM.CLUB_ID_PM
GROUP BY CLUB_PM.CLUB_NAME_PM
ORDER BY CLUB_PM.CLUB_NAME_PM ASC;

-- For each division in the current season compute the total number of teams playing.
SELECT DIVISION_PM.DIVISION_NAME_PM, COUNT(*) AS 'NUMBER_OF_TEAMS_PLAYING'
FROM TEAM_PM
JOIN CLUB_PM ON TEAM_PM.CLUB_ID_PM = CLUB_PM.CLUB_ID_PM
JOIN DIVISION_PM ON CLUB_PM.CLUB_NAME_PM = DIVISION_PM.DIVISION_NAME_PM
JOIN SEASON_PM ON SEASON_PM.CURRENT_SEASON_PM = TRUE
GROUP BY DIVISION_PM.DIVISION_NAME_PM
ORDER BY DIVISION_PM.DIVISION_NAME_PM ASC;

-- For each coach (in alphabetic order) compute the total numbers of games.
SELECT CONCAT(COACH_PM.COACH_FIRST_NAME_PM, ' ', COACH_PM.COACH_LAST_NAME_PM) AS 'COACH_NAME', COUNT(*) AS 'NUMBER_OF_GAMES'
FROM GAME_PM
JOIN TEAM_PM ON GAME_PM.HOME_TEAM_ID_PM = TEAM_PM.TEAM_ID_PM OR GAME_PM.AWAY_TEAM_ID_PM = TEAM_PM.TEAM_ID_PM
JOIN COACH_PM ON TEAM_PM.TEAM_ID_PM = COACH_PM.COACH_ID_PM
GROUP BY COACH_NAME
ORDER BY COACH_NAME ASC;

-- For each location (in alphabetic order) compute the number of games.
SELECT GAME_PM.GAME_ZIP_PM, COUNT(*) AS 'NUMBER_OF_GAMES'
FROM GAME_PM
GROUP BY GAME_PM.GAME_ZIP_PM
ORDER BY GAME_PM.GAME_ZIP_PM ASC;