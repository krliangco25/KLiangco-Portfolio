-- WHERE Clause

SELECT * 
From employee_salary
WHERE first_name = 'Leslie' 
;

SELECT * 
From employee_salary
WHERE salary >= 50000
;

SELECT * 
From employee_salary
WHERE salary <= 50000
;

SELECT * 
FROM employee_demographics
WHERE gender = 'Female'
;

SELECT * 
FROM employee_demographics
WHERE gender != 'Female'
;

#data type as date alter
#Format is year, month, and day
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- Logical operators = AND or NOT
#Also follows PEMDAS

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

#Integers don't have to have quotations
SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44)
OR age > 55
;

-- LIKE Statement
-- % (anything) and _ (specific value) 
#Having the ability to look for certain patterns where it is not necessarily looking for exact match
#Anything after it (Jer and anything after it)
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%'
;

#A somewhere in the value
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%a%' 
;

#A and double underscore means there should be a specific number of letter 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__' 
;

#Combination
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%' 
;

#Birthdates
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%' 
;


