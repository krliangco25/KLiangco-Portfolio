-- CTEs
#Common Table Expressions
#Allow define a subquery block than can be referenced in the main query
#better formatted than subquery
#WITH is the word for CTE
#Can only be used immediately after creating it
#Can do more advanced calculations

#the overiding of names is optional but header comes first 
WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
( 
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_EXAMPLE
;

#Different aliasing type



#same output
SELECT AVG(avg_sal)
FROM 
(SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;

#Doesn't work, because the CTE should be made first, cannot be reused too
SELECT AVG(avg_sal)
FROM CTE_EXAMPLE
;

#Joining more complex queries within one CTE

WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary 
FROM employee_salary
WHERE salary > 50000
)
SELECT * 
FROM CTE_Example
JOIN CTE_Example2 
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;



