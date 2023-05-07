/* Task 2 - Create database by PRANEEL MAKAM */
/* If there is a database with the provided name, delete that database */
DROP DATABASE IF EXISTS SOCCER_LEAGUE_PM;
/* Add a database with that name */
CREATE DATABASE SOCCER_LEAGUE_PM;
/* Mark the created database as the default database for the following operations */
USE SOCCER_LEAGUE_PM;
/* Show all the databases, find the created one in the list */
SHOW DATABASES;

-- Task 3 - Create tables by PRANEEL MAKAM
-- List all the tables in the database (no table expected).

-- Create the Seasons table
CREATE TABLE SEASON_PM (
    SEASON_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    SEASON_NAME_PM VARCHAR(20) NOT NULL,
    REGISTRATION_START_DATE_PM DATE,
    REGISTRATION_END_DATE_PM DATE,
    SEASON_START_DATE_PM DATE,
    SEASON_END_DATE_PM DATE
);

-- Create the Divisions table
CREATE TABLE DIVISION_PM (
    DIVISION_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    DIVISION_NAME_PM VARCHAR(20) NOT NULL,
    CONTACT_EMAIL_PM VARCHAR(30),
    CONTACT_PHONE_PM VARCHAR(15)
);

-- Create the Clubs table
CREATE TABLE CLUB_PM (
    CLUB_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    CLUB_NAME_PM VARCHAR(22) NOT NULL,
    CLUB_EMAIL_PM VARCHAR(30),
    CLUB_PHONE_PM VARCHAR(15),
    CLUB_ABBREVIATION_PM VARCHAR(5)
);

-- Create the Teams table
CREATE TABLE TEAM_PM (
    TEAM_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    TEAM_NAME_PM VARCHAR(20) NOT NULL,
    TEAM_EMAIL_PM VARCHAR(30),
    TEAM_PHONE_PM VARCHAR(15),
    BIRTH_YEAR_PM INT,
    SEX_PM ENUM('Boys', 'Girls'),
    CLUB_ID_PM INT,
    FOREIGN KEY (CLUB_ID_PM) REFERENCES CLUB_PM(CLUB_ID_PM)
);

-- Create the Registration table
CREATE TABLE REGISTRATION_PM (
    REGISTRATION_ID_PM INT PRIMARY KEY AUTO_INCREMENT,
    SEASON_ID_PM INT,
    DIVISION_ID_PM INT,
    TEAM_ID_PM INT,
    FOREIGN KEY (SEASON_ID_PM) REFERENCES SEASON_PM(SEASON_ID_PM),
    FOREIGN KEY (DIVISION_ID_PM) REFERENCES DIVISION_PM(DIVISION_ID_PM),
    FOREIGN KEY (TEAM_ID_PM) REFERENCES TEAM_PM(TEAM_ID_PM)
);

-- Task 4 - Add data by PRANEEL MAKAM

-- Show all data in tables
SELECT * FROM SEASON_PM;
SELECT * FROM DIVISION_PM;
SELECT * FROM CLUB_PM;
SELECT * FROM TEAM_PM;
SELECT * FROM REGISTRATION_PM;

-- Insert data into the Seasons table
INSERT INTO SEASON_PM (SEASON_NAME_PM, REGISTRATION_START_DATE_PM, REGISTRATION_END_DATE_PM, SEASON_START_DATE_PM, SEASON_END_DATE_PM)
VALUES ('FALL 2020', '2020-07-01', '2020-08-31', '2020-09-01', '2020-12-31'),
       ('SPRING 2019', '2019-01-01', '2019-02-28', '2019-03-01', '2019-06-30'),
       ('WINTER 2022', '2022-10-01', '2022-11-30', '2022-12-01', '2023-02-28');

-- Insert data into the Divisions table
INSERT INTO DIVISION_PM (DIVISION_NAME_PM, CONTACT_EMAIL_PM, CONTACT_PHONE_PM)
VALUES ('U14 Boys 1', 'u14boys1@example.com', '(123) 456-7890'),
       ('U14 Boys 2', 'u14boys2@example.com', '(123) 456-7891'),
       ('U12 Girls 1', 'u12girls1@example.com', '(123) 456-7892'),
       ('U12 Girls 2', 'u12girls2@example.com', '(123) 456-7893');

-- Insert data into the Clubs table
INSERT INTO CLUB_PM (CLUB_NAME_PM, CLUB_EMAIL_PM, CLUB_PHONE_PM, CLUB_ABBREVIATION_PM)
VALUES ('Patriots', 'patriots@example.com', '(123) 456-7894', 'PAT'),
       ('Eagles', 'eagles@example.com', '(123) 456-7895', 'EAG'),
       ('Rangers', 'rangers@example.com', '(123) 456-7896', 'RAN'),
       ('Tigers', 'tigers@example.com', '(123) 456-7897', 'TIG');

-- Insert data into the Teams table
INSERT INTO TEAM_PM (TEAM_NAME_PM, TEAM_EMAIL_PM, TEAM_PHONE_PM, BIRTH_YEAR_PM, SEX_PM, CLUB_ID_PM)
VALUES ('Blue', 'blue@example.com', '(123) 456-7898', 2007, 'Boys', 1),
       ('Red', 'red@example.com', '(123) 456-7899', 2007, 'Boys', 2),
       ('Yellow', 'yellow@example.com', '(123) 456-7900', 2008, 'Girls', 1),
       ('Green', 'green@example.com', '(123) 456-7901', 2008, 'Girls', 3),
       ('Orange', 'orange@example.com', '(123) 456-7902', 2009, 'Boys', 2),
       ('Purple', 'purple@example.com', '(123) 456-7903', 2009, 'Boys', 4);

-- Insert data into the Registration table
INSERT INTO REGISTRATION_PM (SEASON_ID_PM, DIVISION_ID_PM, TEAM_ID_PM)
VALUES (1, 1, 1),
       (1, 2, 2),
       (1, 3, 3),
       (1, 4, 4),
       (2, 1, 1),
       (2, 2, 2),
       (2, 3, 3),
       (2, 4, 4),
       (3, 1, 1),
       (3, 2, 2),
       (3, 3, 3),
       (3, 4, 4);

-- Task 5 - Query the data by PRANEEL MAKAM

-- List alphabetically all the names (with the header name) and emails (with the header email) for the teams that are enrolled in the "Spring 2019" season (you do not know the ID).
SELECT t.TEAM_NAME_PM AS name, t.TEAM_EMAIL_PM AS email
FROM TEAM_PM t
JOIN REGISTRATION_PM r ON t.TEAM_ID_PM = r.TEAM_ID_PM
JOIN SEASON_PM s ON r.SEASON_ID_PM = s.SEASON_ID_PM
WHERE s.SEASON_NAME_PM = 'Spring 2019'
ORDER BY t.TEAM_NAME_PM ASC;

-- List all the divisions with their phones and season (using headers without initials), ordered by season, in which the teams named "Red" played.
SELECT d.DIVISION_NAME_PM AS division, d.CONTACT_PHONE_PM AS phone, s.SEASON_NAME_PM AS season
FROM DIVISION_PM d
JOIN REGISTRATION_PM r ON d.DIVISION_ID_PM = r.DIVISION_ID_PM
JOIN TEAM_PM t ON r.TEAM_ID_PM = t.TEAM_ID_PM
JOIN SEASON_PM s ON r.SEASON_ID_PM = s.SEASON_ID_PM
WHERE t.TEAM_NAME_PM = 'Red'
ORDER BY s.SEASON_NAME_PM ASC;

-- For the club named Eagles, list all the teams (names) and their divisions (age, players, rank) in Spring 2019.
SELECT t.TEAM_NAME_PM AS team, d.DIVISION_NAME_PM AS division, t.BIRTH_YEAR_PM AS age, t.SEX_PM AS players
FROM CLUB_PM c
JOIN TEAM_PM t ON c.CLUB_ID_PM = t.CLUB_ID_PM
JOIN REGISTRATION_PM r ON t.TEAM_ID_PM = r.TEAM_ID_PM
JOIN DIVISION_PM d ON r.DIVISION_ID_PM = d.DIVISION_ID_PM
JOIN SEASON_PM s ON r.SEASON_ID_PM = s.SEASON_ID_PM
WHERE c.CLUB_NAME_PM = 'Eagles' AND s.SEASON_NAME_PM = 'Spring 2019';

-- For all the divisions in Spring 2019 that are under 12 or younger, list the teams names, clubs names and the year of birth for the players using nice headers.
SELECT d.DIVISION_NAME_PM AS division, t.TEAM_NAME_PM AS team, c.CLUB_NAME_PM AS club, t.BIRTH_YEAR_PM AS birth_year
FROM DIVISION_PM d
JOIN REGISTRATION_PM r ON d.DIVISION_ID_PM = r.DIVISION_ID_PM
JOIN TEAM_PM t ON r.TEAM_ID_PM = t.TEAM_ID_PM
JOIN SEASON_PM s ON r.SEASON_ID_PM = s.SEASON_ID_PM
JOIN CLUB_PM c ON t.CLUB_ID_PM = c.CLUB_ID_PM
WHERE s.SEASON_NAME_PM = 'Spring 2019' AND t.BIRTH_YEAR_PM <= 2011;

