-- Temporary Tables 
#Temp tables are only visible to the session that they are created in
#used before inserting stuff in a permanent table

#"CREATE TABLE" will make it permanent
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50), 
favorite_move varchar(100)
);

#Showing temp table headers
SELECT *
FROM temp_table; 

#Inserting data
INSERT INTO temp_table
VALUES('Karizza', 'Liangco', 'Peter pan')
;

SELECT *
FROM temp_table;

SELECT * 
FROM employee_salary;

#Creating table based on a pre-existing table
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
; 

#it will work even in a new window, but exit out to MySQL, it will be deleted
SELECT *
FROM salary_over_50k
;

#CTEs and Temp Tables
