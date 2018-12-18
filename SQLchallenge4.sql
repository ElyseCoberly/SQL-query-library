--SQL Challenge #4
--https://www.sqlprep.com/sc_dailychallenge/daily-challenge-4/
--Show the employee first name, last name, and job title for all employees with the job title of “Sales Rep”.

--use single quotes
SELECT
firstName,
lastName,
jobTitle
FROM employees
WHERE jobTitle='Sales Rep'