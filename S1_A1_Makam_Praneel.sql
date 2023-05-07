# Task 2
# Created database by PRANEEL MAKAM
# If there is a database with the provided name, delete that database.
DROP DATABASE IF EXISTS HR;

# Add a database with that name.
CREATE DATABASE HR;

# Mark the created database as the default database for the following operations.
USE HR;

# Show all the databases, find the created one in the list
SHOW DATABASES;


#Task 3
# List all the tables in the database (no table expected).
SHOW TABLES;

# Create EMPLOYEE_PM table
CREATE TABLE EMPLOYEE_PM (
CODE_PM CHAR(3) NOT NULL PRIMARY KEY, # Employee code
FIRST_NAME_PM VARCHAR(20) NOT NULL, # Employee first name
LAST_NAME_PM VARCHAR(20) NOT NULL, # Employee last name
MIDDLE_NAME_PM VARCHAR(20) NULL, # Employee middle name (optional)
PHONE_NUMBER_PM VARCHAR(12) NOT NULL # Employee phone number
);

# List all the tables in the database (again - the new table must appear).
SHOW TABLES;

# Show the structure of the created table.
DESCRIBE EMPLOYEE_PM;


#Task 4
# Show all the data in your table (no data expected).
SELECT * FROM EMPLOYEE_PM;

# Add 5 rows of data, start with the provided data items in the order they are provided, and imagine new data for the other ones
INSERT INTO EMPLOYEE_PM (CODE_PM, FIRST_NAME_PM, MIDDLE_NAME_PM, LAST_NAME_PM, PHONE_NUMBER_PM) VALUES
('235', 'Joe', 'Peter', 'Doe', '981 8856815'),
('239', 'Mary', NULL, 'Doe', '981 0838913'),
('123', 'John', 'William', 'Smith', '987 6543210'),
('456', 'Jane', NULL, 'Williams', '123 4567890'),
('789', 'Bob', 'Michael', 'Johnson', '456 7891230');

# Show all the data in your table (five rows expected).
SELECT * FROM EMPLOYEE_PM;


# Task 5
# Perform the 2 queries from your specification.
# The list of employees first name, middle name, last name and phone number.
SELECT FIRST_NAME_PM, MIDDLE_NAME_PM, LAST_NAME_PM, PHONE_NUMBER_PM FROM EMPLOYEE_PM;

# The list of employees with the middle name "Peter".
SELECT * FROM EMPLOYEE_PM WHERE MIDDLE_NAME_PM = 'Peter';
