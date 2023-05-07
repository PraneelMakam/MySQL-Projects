-- Task 2 Create database by Praneel Makam

-- Delete the database if exists
DROP DATABASE IF EXISTS HAPPY_LEARNING_PM;

-- Create the database
CREATE DATABASE IF NOT EXISTS HAPPY_LEARNING_PM;

-- Use the database for following operations
USE HAPPY_LEARNING_PM;

-- Show all the databases
SHOW DATABASES;


-- Task 3 - Create tables by Praneel Makam

-- List all the tables in the database
SHOW TABLES;

-- Create the Parents Table
CREATE TABLE IF NOT EXISTS PARENT_PM (
  PARENT_ID_PM INT PRIMARY KEY,
  PARENT_FIRST_NAME_PM VARCHAR(30) NOT NULL,
  PARENT_LAST_NAME_PM VARCHAR(30) NOT NULL,
  PARENT_MIDDLE_NAME_PM VARCHAR(30),
  PARENT_HOME_PHONE_PM CHAR(12) NOT NULL UNIQUE,
  PARENT_MOBILE_PHONE_PM CHAR(12) NOT NULL UNIQUE,
  PARENT_WORK_PHONE_PM CHAR(12) NOT NULL UNIQUE,
  PARENT_EMAIL_PM VARCHAR(30) NOT NULL,
  PARENT_RELATIONSHIP_PM VARCHAR(15) NOT NULL
);

-- Create the Teachers Table
CREATE TABLE IF NOT EXISTS TEACHER_PM (
  TEACHER_ID_PM INT PRIMARY KEY,
  TEACHER_FIRST_NAME_PM VARCHAR(30) NOT NULL,
  TEACHER_LAST_NAME_PM VARCHAR(30) NOT NULL,
  TEACHER_MIDDLE_NAME_PM VARCHAR(30),
  TEACHER_WORK_EMAIL_PM VARCHAR(30) NOT NULL,
  TEACHER_PERS_EMAIL_PM VARCHAR(30) NOT NULL,
  TEACHER_HOME_PHONE_PM CHAR(12) NOT NULL,
  TEACHER_COLLEGE_PM CHAR(5) NOT NULL,
  TEACHER_DEGREE_PM VARCHAR(25) NOT NULL
  );

-- Create the Class Table
CREATE TABLE IF NOT EXISTS CLASS_PM (
  CLASS_ID_PM INT PRIMARY KEY,
  CLASS_LEVEL_PM VARCHAR(10) NOT NULL,
  CLASS_COLOR_PM VARCHAR(10) NOT NULL,
  CLASS_ROOM_NUMBER_PM INT NOT NULL UNIQUE,
  CLASS_PHONE_PM CHAR(12) NOT NULL UNIQUE,
  CLASS_CAPACITY_PM INT NOT NULL,
  CLASS_LOC_DIRECTIONS_PM VARCHAR(100),
  TEACHER_ID_PM INT NOT NULL,
  FOREIGN KEY (TEACHER_ID_PM) REFERENCES TEACHER_PM(TEACHER_ID_PM)
);

-- Create the Students Table
CREATE TABLE IF NOT EXISTS STUDENT_PM (
STUDENT_ID_PM INT PRIMARY KEY,
STUDENT_FIRST_NAME_PM VARCHAR(30) NOT NULL,
STUDENT_LAST_NAME_PM VARCHAR(30) NOT NULL,
STUDENT_MIDDLE_NAME_PM VARCHAR(30),
STUDENT_NICK_NAME_PM VARCHAR(15) NOT NULL,
STUDENT_DOB_PM DATE NOT NULL,
STUDENT_ADDRESS_PM VARCHAR(50) NOT NULL,
STUDENT_CITY_PM VARCHAR(25) NOT NULL,
STUDENT_ZIP_CODE_PM VARCHAR(10) NOT NULL,
STUDENT_STATE_PM CHAR(2) NOT NULL,
STUDENT_AGE_PM CHAR(2) NOT NULL,
STUDENT_AGE_LEVEL_PM VARCHAR(25) NOT NULL,
PARENT_ID_PM INT NOT NULL REFERENCES PARENT_PM(CLASS_ID_PM),
CLASS_ID_PM INT NOT NULL REFERENCES CLASS_PM(CLASS_ID_PM)
);
  
  -- List all the tables in the database
SHOW TABLES;

-- Show the structure of the created tables
DESCRIBE PARENT_PM;
DESCRIBE STUDENT_PM;
DESCRIBE CLASS_PM;
DESCRIBE TEACHER_PM;


-- Task 4 - Add data by PRANEEL MAKAM

-- Show all data in tables
SELECT * FROM PARENT_PM;
SELECT * FROM STUDENT_PM;
SELECT * FROM CLASS_PM;
SELECT * FROM TEACHER_PM;

-- Add data to PARENT_PM table
INSERT INTO PARENT_PM (PARENT_ID_PM, PARENT_FIRST_NAME_PM, PARENT_LAST_NAME_PM, PARENT_MIDDLE_NAME_PM, PARENT_HOME_PHONE_PM, PARENT_MOBILE_PHONE_PM, PARENT_WORK_PHONE_PM, PARENT_EMAIL_PM, PARENT_RELATIONSHIP_PM) VALUES
(1, 'John', 'Doe', 'J', '555-1234', '555-5678', '555-8910', 'johndoe@email.com', 'Father'),
(2, 'Jane', 'Doe', 'M', '555-4321', '555-8765', '555-1098', 'janedoe@email.com', 'Mother'),
(3, 'Jack', 'Smith', NULL, '555-6789', '555-0123', '555-3456', 'jacksmith@email.com', 'Uncle'),
(4, 'Jill', 'Johnson', 'L', '555-2468', '555-8024', '555-1357', 'jilljohnson@email.com', 'Aunt'),
(5, 'Jim', 'Wilson', 'K', '555-3690', '555-7531', '555-9753', 'jimwilson@email.com', 'Guardian');

-- Add data to STUDENT_PM table
INSERT INTO STUDENT_PM (STUDENT_ID_PM, STUDENT_FIRST_NAME_PM, STUDENT_LAST_NAME_PM, STUDENT_MIDDLE_NAME_PM, STUDENT_NICK_NAME_PM, STUDENT_DOB_PM, STUDENT_ADDRESS_PM, STUDENT_CITY_PM, STUDENT_ZIP_CODE_PM, STUDENT_STATE_PM, STUDENT_AGE_PM, STUDENT_AGE_LEVEL_PM, PARENT_ID_PM, CLASS_ID_PM) 
VALUES 
(1, 'Tom', 'Hanks', 'M', 'Tommy', '1988-05-23', '1234 1st Street', 'Los Angeles', '90001', 'CA', '25', 'Graduate', 1, 1), 
(2, 'Jennifer', 'Aniston', 'L', 'Jen', '1992-09-23', '5678 2nd Street', 'New York', '10001', 'NY', '21', 'Undergraduate', 2, 2), 
(3, 'Leonardo', 'DiCaprio', 'W', 'Leo', '1995-11-11', '91011 3rd Street', 'Hollywood', '90069', 'CA', '26', 'Graduate', 1, 3), 
(4, 'Scarlett', 'Johansson', 'K', 'Scar', '1993-04-22', '1212 4th Street', 'Los Angeles', '90001', 'CA', '24', 'Undergraduate', 2, 1), 
(5, 'Robert', 'Downey', 'Jr', 'Rob', '1991-12-15', '1414 5th Street', 'New York', '10001', 'NY', '27', 'Graduate', 1, 2);



-- Add data to TEACHER_PM table
INSERT INTO TEACHER_PM (TEACHER_ID_PM, TEACHER_FIRST_NAME_PM, TEACHER_LAST_NAME_PM, TEACHER_MIDDLE_NAME_PM, TEACHER_WORK_EMAIL_PM, TEACHER_PERS_EMAIL_PM, TEACHER_HOME_PHONE_PM, TEACHER_COLLEGE_PM, TEACHER_DEGREE_PM)
VALUES
(1, 'John', 'Smith', 'A', 'john.smith@school.edu', 'john.smith@gmail.com', '555-1234', 'ABC', 'Bachelor'),
(2, 'Jane', 'Doe', 'B', 'jane.doe@school.edu', 'jane.doe@gmail.com', '555-5678', 'DEF', 'Master'),
(3, 'Bob', 'Johnson', 'C', 'bob.johnson@school.edu', 'bob.johnson@gmail.com', '555-9012', 'GHI', 'PhD'),
(4, 'Mary', 'Williams', 'D', 'mary.williams@school.edu', 'mary.williams@gmail.com', '555-3456', 'JKL', 'Bachelor'),
(5, 'Tom', 'Brown', 'E', 'tom.brown@school.edu', 'tom.brown@gmail.com', '555-7890', 'MNO', 'Master');

-- Add data to CLASS_PM table
INSERT INTO CLASS_PM (CLASS_ID_PM, CLASS_LEVEL_PM, CLASS_COLOR_PM, CLASS_ROOM_NUMBER_PM, CLASS_PHONE_PM, CLASS_CAPACITY_PM, CLASS_LOC_DIRECTIONS_PM, TEACHER_ID_PM)
VALUES
(1, '3rd Grade', 'Blue', 123, '555-5555', 30, 'Building A, 2nd floor, room 123', 1),
(2, '4th Grade', 'Green', 234, '555-6666', 25, 'Building A, 2nd floor, room 234', 2),
(3, '5th Grade', 'Red', 345, '555-7777', 28, 'Building B, 1st floor, room 345', 3),
(4, '6th Grade', 'Yellow', 456, '555-8888', 20, 'Building B, 2nd floor, room 456', 4),
(5, '7th Grade', 'Orange', 567, '555-9999', 22, 'Building C, 3rd floor, room 567', 5);


-- Show all data in tables after adding data
SELECT * FROM PARENT_PM;
SELECT * FROM STUDENT_PM;
SELECT * FROM CLASS_PM;
SELECT * FROM TEACHER_PM;

-- Task 5 - Query the data by Praneel Makam

-- List all students' names (in a column named 'Student') in alphabetical order, with the age level (in a column named 'Level'), color, and capacity of the class and the name of the teacher (in a column named 'Teacher').
SELECT s.STUDENT_FIRST_NAME_PM AS Student, s.STUDENT_AGE_LEVEL_PM AS Level, c.CLASS_COLOR_PM AS Color, c.CLASS_CAPACITY_PM AS Capacity, CONCAT(t.TEACHER_FIRST_NAME_PM, ' ', t.TEACHER_LAST_NAME_PM) AS Teacher
FROM STUDENT_PM s
JOIN CLASS_PM c ON s.CLASS_ID_PM = c.CLASS_ID_PM
JOIN TEACHER_PM t ON c.TEACHER_ID_PM = t.TEACHER_ID_PM
ORDER BY s.STUDENT_FIRST_NAME_PM ASC LIMIT 0, 1000;

-- For each class level and color, show all the students enrolled in alphabetical order per each class (i.e., you start with blue foxes and show all the students enrolled alphabetically, then you go to green foxes, and so on) and their city. Use the following headers for the columns: Color, Level, Student Name, City.
SELECT c.CLASS_COLOR_PM AS Color, c.CLASS_LEVEL_PM AS Level, s.STUDENT_FIRST_NAME_PM AS 'Student Name', s.STUDENT_CITY_PM AS City 
FROM CLASS_PM c 
JOIN STUDENT_PM s ON c.CLASS_ID_PM = s.CLASS_ID_PM 
ORDER BY c.CLASS_COLOR_PM, c.CLASS_LEVEL_PM, 'Student Name' ASC LIMIT 0, 1000;

-- For each parent (caretaker) in alphabetical order (show name and mobile phone), list all the students enrolled (show name, class level, and color).
SELECT CONCAT(p.PARENT_FIRST_NAME_PM, ' ', p.PARENT_LAST_NAME_PM) AS Parent, p.PARENT_MOBILE_PHONE_PM AS 'Mobile Phone', s.STUDENT_FIRST_NAME_PM AS Student, s.STUDENT_AGE_LEVEL_PM AS 'Class Level', c.CLASS_COLOR_PM AS Color
FROM PARENT_PM p
JOIN STUDENT_PM s ON p.PARENT_ID_PM = s.PARENT_ID_PM
JOIN CLASS_PM c ON s.CLASS_ID_PM = c.CLASS_ID_PM
ORDER BY Parent, Student ASC;

-- For each parent (show name in alphabetical order), list all the students (show name in alphabetical order per parent) and their teachers (show names in alphabetical order per student). Use columns headers: parent, student, teacher.
SELECT CONCAT(p.PARENT_FIRST_NAME_PM, ' ', p.PARENT_LAST_NAME_PM) AS Parent, s.STUDENT_FIRST_NAME_PM AS Student, CONCAT(t.TEACHER_FIRST_NAME_PM, ' ', t.TEACHER_LAST_NAME_PM) AS Teacher
FROM PARENT_PM p
JOIN STUDENT_PM s ON p.PARENT_ID_PM = s.PARENT_ID_PM
JOIN CLASS_PM c ON s.CLASS_ID_PM = c.CLASS_ID_PM
JOIN TEACHER_PM t ON c.TEACHER_ID_PM = t.TEACHER_ID_PM
ORDER BY Parent, Student, Teacher ASC;
