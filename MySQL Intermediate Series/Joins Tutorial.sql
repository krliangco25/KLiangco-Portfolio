-- Joins
#Allow combination of two tables or more if they have a common column
#The data within are similar

SELECT * 
FROM employee_demographics; 

SELECT * 
FROM employee_salary; 

#Inner join, going to return rows that are the same in both columns from both tables
#Default "JOIN" 
#Missing number 2, Since Number 2 is not part of the employee_demographics table
SELECT * 
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id 
;

#Using aliasing
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
;

#Selecting actual columns, selecting from dem.employee_id, not just employee id, it will be ambiguous
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
;

#Outer Joings
#There is a left outer and right outer join, will take everything on the specific side, and will return only the matches on the other side

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
;

#No matches = Nulls, from sal to dem
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
;

#Self Join
#Join where you want to tie a table to itself 
#Needs to specify which table we are pulling from
#employee table 1 and 2, emp1-2
#Assigning to the next 

SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id 
; 

#Specifying using self join
SELECT emp1.employee_id AS emp1_santa,
emp1.first_name AS first_name_santa, 
emp1.last_name AS last_name_santa, 
emp2.employee_id AS emp_name, 
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id 
; 

#Joining multiple tables together
#Not just two

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

#Reference Table
#Usually don't have duplicate
SELECT * 
FROM parks_departments;

#Joining dept id from main to parks_departments; 
#dept_id != department_id
#three table tying 
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

