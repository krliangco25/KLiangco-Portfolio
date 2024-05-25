-- Subqueries

#Query inside another query

SELECT *
FROM employee_demographics;

#Operand should contain one colomun
SELECT * 
FROM employee_demographics
WHERE employee_id 
	IN #operator
	(SELECT employee_id, dept_id
		FROM employee_salary
        WHERE dept_id = 1) #operand 
;

#Should only have one 
SELECT * 
FROM employee_demographics
WHERE employee_id 
	IN #operator
	(SELECT employee_id #no dept_id
		FROM employee_salary
        WHERE dept_id = 1) #operand 
;

#Subquery in Select statement

#looking at all the salary but we compare it to the average salary with everyone
#need to group by
SELECT first_name, salary, AVG(salary)
FROM employee_salary; 

#Group by but not correct
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary; 

#Correct
SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

#Subquery from the FROM statement

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender; 

#ave in max and ave in min, needs to be labelled at the end
#Needs to be back-ticked
#Aggregations on the table
SELECT AVG(`MAX(age)`)
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;

#Without backticks
SELECT AVG(max_age)
FROM 
(SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;