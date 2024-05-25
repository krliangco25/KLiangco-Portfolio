-- String Functions

#Gives how long the string is
SELECT LENGTH('skyfall')
;

#useful in checking the phone numbers 
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
; 

#Giving an all uppercase or lowercase
SELECT UPPER('sky');
SELECT LOWER('SKY');

#Used for standardization
SELECT first_name, UPPER(first_name)
FROM employee_demographics;

#TRIM, could be left and right trim
#Gets the white space in front or after, and delete it

SELECT TRIM('         sky          ');
SELECT LTRIM('         sky          ');
SELECT RTRIM('         sky          ');

#Left and Right
#Incorrect example 
SELECT first_name, LEFT(first_name)
FROM employee_demographics; 

#Specifying characters in the left or right hand side by number
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4)
FROM employee_demographics; 

#Substring
#second number is position we want to start at
#third is the number of characters we want to go at
#we want to find the month where everyone is born
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics; 


#Replace
#Replaces character with a different character that we want

#replacing a to z (lower case)
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics; 

#Locate
#Locating the character and gives its position
SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics; 

#concatonation of different columns, combination into one column 
SELECT first_name, last_name,
CONCAT(first_name,' ', last_name) AS full_name 
FROM employee_demographics; 