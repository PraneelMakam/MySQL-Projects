#Task 2
# Delete database if exists
DROP DATABASE IF EXISTS FITNESS_COMPANY;

# Create database
CREATE DATABASE FITNESS_COMPANY;

# Use database
USE FITNESS_COMPANY;

# Show all databases
SHOW DATABASES;

#Task 3
# List all the tables in the database
SHOW TABLES;

# Create the tables with the required specification
CREATE TABLE TRAINER_PM (
  TRAINER_ID_PM INT AUTO_INCREMENT PRIMARY KEY,
  FIRST_NAME_PM VARCHAR(23) NOT NULL,
  LAST_NAME_PM VARCHAR(23) NOT NULL,
  PHONE_PM VARCHAR(12) NOT NULL,
  HIRING_YEAR_PM INT,
  UNIQUE (PHONE_PM)
);

CREATE TABLE CUSTOMER_PM (
  CUSTOMER_ID_PM INT AUTO_INCREMENT PRIMARY KEY,
  FIRST_NAME_PM VARCHAR(23) NOT NULL,
  LAST_NAME_PM VARCHAR(23) NOT NULL,
  PHONE_PM VARCHAR(12) NOT NULL,
  BIRTH_YEAR_PM INT,
  GOAL_PM VARCHAR(50) NOT NULL,
  TRAINER_ID_PM INT,
  UNIQUE (PHONE_PM),
  FOREIGN KEY (TRAINER_ID_PM) REFERENCES TRAINER_PM(TRAINER_ID_PM) ON DELETE SET NULL
);

CREATE TABLE ASSIGNMENT_PM (
  TRAINER_ID_PM INT,
  CUSTOMER_ID_PM INT,
  PRIMARY KEY (TRAINER_ID_PM, CUSTOMER_ID_PM),
  FOREIGN KEY (TRAINER_ID_PM) REFERENCES TRAINER_PM(TRAINER_ID_PM) ON DELETE CASCADE,
  FOREIGN KEY (CUSTOMER_ID_PM) REFERENCES CUSTOMER_PM(CUSTOMER_ID_PM) ON DELETE CASCADE
);

#Task 4
# List all the tables in the database (again - the new table must appear)
SHOW TABLES;

# Show the structure of the created tables
DESC TRAINER_PM;
DESC CUSTOMER_PM;
DESC ASSIGNMENT_PM;

# Show all the data in the tables (no data expected)
SELECT * FROM TRAINER_PM;
SELECT * FROM CUSTOMER_PM;
SELECT * FROM ASSIGNMENT_PM;

# Add data to Trainers table
INSERT INTO TRAINER_PM (FIRST_NAME_PM, LAST_NAME_PM, PHONE_PM, HIRING_YEAR_PM)
VALUES ('William', 'Jones', '175 2219988', 2019),
('Anna', 'Smith', '175 9876543', 2020),
('David', 'Lee', '175 5551212', 2016),
('Eva', 'Wilson', '175 3333333', 2015),
('Paul', 'Wright', '175 7777777', 2018);

# Add data to Customers table
INSERT INTO CUSTOMER_PM (FIRST_NAME_PM, LAST_NAME_PM, PHONE_PM, BIRTH_YEAR_PM, GOAL_PM)
VALUES ('Robert', 'Garcia', '175 7518822', 1988, 'building endurance'),
('John', 'Doe', '175 8881234', 1995, 'weight loss'),
('John', 'Smith', '175 9995678', 1983, 'muscle gain'),
('Emma', 'Brown', '175 3333333', 1990, 'building endurance'),
('Sophie', 'Taylor', '175 4444444', 1985, 'weight loss');

# Add data to Assignments table
INSERT INTO ASSIGNMENT_PM (TRAINER_ID_PM, CUSTOMER_ID_PM)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

#Task 5:
# For each assignment, list the first and last names for both the trainer and the customer. Use suggestive names for the columns in the result.
SELECT t.FIRST_NAME_PM AS TRAINER_FIRST_NAME, t.LAST_NAME_PM AS TRAINER_LAST_NAME, c.FIRST_NAME_PM AS CUSTOMER_FIRST_NAME, c.LAST_NAME_PM AS CUSTOMER_LAST_NAME
FROM TRAINER_PM t
INNER JOIN ASSIGNMENT_PM a ON t.TRAINER_ID_PM = a.TRAINER_ID_PM
INNER JOIN CUSTOMER_PM c ON a.CUSTOMER_ID_PM = c.CUSTOMER_ID_PM;

# Pick the ID for the first trainer you defined in the database. List the full names (FIRST SPACE LAST) for all the customers of the selected trainer (in one column named "Customer Name").
SELECT CONCAT(c.FIRST_NAME_PM, ' ', c.LAST_NAME_PM) AS CUSTOMER_NAME
FROM CUSTOMER_PM c
INNER JOIN ASSIGNMENT_PM a ON c.CUSTOMER_ID_PM = a.CUSTOMER_ID_PM
WHERE a.TRAINER_ID_PM = 1;

# List the full names (FIRST SPACE LAST)for the trainer and customers (in two columns named "Trainer Name" and "Customer Name"), for which the customer first name is "John"
SELECT CONCAT(t.FIRST_NAME_PM, ' ', t.LAST_NAME_PM) AS TRAINER_NAME, CONCAT(c.FIRST_NAME_PM, ' ', c.LAST_NAME_PM) AS CUSTOMER_NAME
FROM TRAINER_PM t
INNER JOIN ASSIGNMENT_PM a ON t.TRAINER_ID_PM = a.TRAINER_ID_PM
INNER JOIN CUSTOMER_PM c ON a.CUSTOMER_ID_PM = c.CUSTOMER_ID_PM
WHERE c.FIRST_NAME_PM = 'John';

# List the names for the trainers in the format (LAST COMMA SPACE FIRST) hired after 2017 and the full names of their customers. Show the result in two columns named "Trainer_Name" and "Customer_Name".
SELECT CONCAT(t.LAST_NAME_PM, ', ', t.FIRST_NAME_PM) AS TRAINER_NAME, CONCAT(c.FIRST_NAME_PM, ' ', c.LAST_NAME_PM) AS CUSTOMER_NAME
FROM TRAINER_PM t
INNER JOIN ASSIGNMENT_PM a ON t.TRAINER_ID_PM = a.TRAINER_ID_PM
INNER JOIN CUSTOMER_PM c ON a.CUSTOMER_ID_PM = c.CUSTOMER_ID_PM
WHERE t.HIRING_YEAR_PM > 2017;

# List the names for the trainers in the format (LAST COMMA SPACE FIRST) hired before or in 2017 and the full names of their customers. Show the result in two columns named "Trainer_Name2" and "Customer_Name2".
SELECT CONCAT(t.LAST_NAME_PM, ', ', t.FIRST_NAME_PM) AS TRAINER_NAME2, CONCAT(c.FIRST_NAME_PM, ' ', c.LAST_NAME_PM) AS CUSTOMER_NAME2
FROM TRAINER_PM t
LEFT JOIN ASSIGNMENT_PM a ON t.TRAINER_ID_PM = a.TRAINER_ID_PM
LEFT JOIN CUSTOMER_PM c ON a.CUSTOMER_ID_PM = c.CUSTOMER_ID_PM
WHERE t.HIRING_YEAR_PM <= 2017 OR a.TRAINER_ID_PM IS NULL;