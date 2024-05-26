-- Triggers and Events
#block of code that automatically executes when an event happens on a specific table

SELECT *
FROM employee_demographics; 

SELECT *
FROM employee_salary; 

#when data is updated in the salary, employee demographics should also update

DELIMITER $$
CREATE TRIGGER employee_insert 						#naming
	AFTER INSERT ON employee_salary 				#event #can be "BEFORE" as well
    FOR EACH ROW 									#triggers activated in each row it is inserted 
BEGIN												 #what's gonna happen after the event takes place
	INSERT INTO employee_demographics (employee_id, first_name, last_name) 
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); 					#only taking the new rows, can also be "OLD"
END $$
DELIMITER ;

#Testing

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Karizza', 'Liangco', 'Data Engineer', 100000, NULL); 

SELECT * 
FROM employee_salary;

SELECT *
FROM employee_demographics; 

#EVENTS
#Takes place when it is schedule (automator) 
#Scenario-retire people over 60 and give them lifetime pay



DELIMITER $$
CREATE EVENT delete_ret
ON SCHEDULE EVERY 30 SECOND 
DO 
BEGIN
	DELETE 
	FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

#safe updates needs to be unchecked in the preferences
SELECT *
FROM employee_demographics; 
 
SHOW VARIABLES LIKE 'event%';
	