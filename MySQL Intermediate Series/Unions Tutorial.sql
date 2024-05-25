-- Unions
#allowing to combine rows together
#unlike columns from joins

#example of bad data 
SELECT age, gender 
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary 
; 

#clean data 
#default is UNION DISTINCT, which takes only unique values
#removes duplicates 

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary 
; 

#all without removing the duplicates 
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary 
; 

#Labelling and categorization
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male' 
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female' 
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
; 