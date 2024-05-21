-- Limit & ALias
#Specifies how many rows that you want for the output

#Limit to three rows
SELECT *
FROM employee_demographics
LIMIT 3
;

#Limitinng to three rows and by descending order of age
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

#Starting from Row 2, output is row after it
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- Aliasing 
#Changing the name of the columnn
#Can also be used in joints 

#The "AS" function can be taken out
SELECT gender, AVG(age) AS avg_age 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

