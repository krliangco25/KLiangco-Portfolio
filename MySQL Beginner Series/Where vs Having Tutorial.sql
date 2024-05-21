-- Having vs Where


#Invalid use of group by function, aggregate fxnnn only occurs after grouping
#Hence the avg haven't been created yet since it is not yet grouped
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;

#Valid use of having
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

#Average of Office Manager, which are two people having different salary
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
;

#Filtering with occupation having "manager" in them
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation like '%manager%'
GROUP BY occupation
;

#Filtering manager where they have avg salary of 75000 
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation like '%manager%'
GROUP BY occupation
HAVING AVG(salary) >75000
;
