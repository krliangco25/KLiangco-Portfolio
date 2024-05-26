-- Stored Procedures

#Reusing the code over and over again
#helpful in repetitive queries 

SELECT * 
FROM employee_salary
WHERE salary >= 50000; 

#it will be stored in stored procedures in parks and recreation
#you can specify what database by using USE "name of database" before everything but optional
#you can also press the lightning bolt in the stored procedures at the left

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000; 

CALL large_salaries();

#Semicolon is a delimiter, which separates one query to another 
#it can also be "DELIMITER" "//" "$$"
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;

#semicolons are no longer the delimiter 
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
#CHANGE IT BACK (IMPORTANT)
DELIMITER ;

#alter store procedure can be clicked at the left side

#it will give two results 
CALL large_salaries3();

#Parameter
#variable that are passed as an input into a stored procedure that allow the store procedure 
#to accept an input value and place it in the code
#inside the parameter to specify, needs to be the data type 
#you can call the parameter whatever you want

DELIMITER $$
CREATE PROCEDURE large_salaries5(employee_id_param INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = employee_id_param
    ;
END $$
#CHANGE IT BACK (IMPORTANT)
DELIMITER ;

CALL large_salaries4(1)