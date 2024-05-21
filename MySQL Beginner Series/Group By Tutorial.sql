-- Group By
#Group rows that has the same values in the specified column/s that you're grouping on
#Once grouped, aggregate function can be done (mathematical functions)

SELECT *
FROM employee_demographics
;

#Group by gender
SELECT first_name
FROM employee_demographics
GROUP BY gender
;

#It has to much if not performing aggregate function
#This doesn't work
SELECT first_name
FROM employee_demographics
GROUP BY gender
;

#Multiples, getting the average of age of females and males
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

#Grouping by occupation
#Shows only one office manager 
SELECT occupation
FROM employee_salary
GROUP BY occupation
;

#Grouping by salary and occupation
#Shows two office manager because they're distinct by salary
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

-- Aggregate functions
#Showing Minimum and Maximum value
SELECT gender, AVG(age), MAX(age), MIN(age)
FROM employee_demographics
GROUP BY gender
;

#Counting by gender
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY
#sorting result set in either ascending or descending

#By default, it is in ascending (a-z)
SELECT *
FROM employee_demographics
ORDER BY first_name
;

#Ascending
SELECT *
FROM employee_demographics
ORDER BY first_name ASC; 
;

#Descending
SELECT *
FROM employee_demographics
ORDER BY first_name DESC; 
;

#Combination
SELECT *
FROM employee_demographics
ORDER BY gender 
;

SELECT *
FROM employee_demographics
ORDER BY gender, age
;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age DESC
;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age DESC
;

#The order of variables should be in correct order for its uniqueness
SELECT *
FROM employee_demographics
ORDER BY age, gender 
;

#Can be ordered by the Number of Column field, instead of the name
#Column 5 and 4, not recommended as it could cause a lot of issues
SELECT *
FROM employee_demographics
ORDER BY 5, 4
;