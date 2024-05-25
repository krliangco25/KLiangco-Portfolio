-- Case Statements 
#Case statements allows you to have logic in your statements

SELECT first_name,
last_name,
age, 
CASE 
	WHEN age <= 30 THEN
		'Young'
	WHEN age BETWEEN 31 and 50 THEN
		'Old'
	WHEN age >= 50 THEN
		"On Death's Door"
END AS Age_Bracket
FROM employee_demographics; 

#Scenario
#The Pawnee Council sent out a memo of their bonus and pay increase for end of the year, 
#and we need to determine the pay and the bonus

#Needs
-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus

SELECT first_name, last_name, salary,
CASE 
	WHEN salary < 50000 
		THEN salary + (salary*0.05)
    WHEN salary > 50000
		THEN salary + (salary*0.07)
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary *.10
END AS BONUS
FROM employee_salary; 

#reference
SELECT *
FROM parks_departments;