SELECT * FROM employees
SELECT First_name,last_name,salary FROM employees

SELECT * FROM departments
SELECT department_name,location_id, FROM departments


SELECT * FROM locations
SELECT country_id,city,state_province,street_address FROM locations

SELECT MAX(salary) FROM employees
SELECT MIN(salary) FROM employees
SELECT AVG(salary) FROM employees
SELECT SUM(salary) FROM employees
SELECT COUNT(*) FROM employees

--DISPLAY THE FIRST_NAME,LAST_NAME OF ALL EMPLOYEES THAT MAKE COMMISSION
SELECT first_name,last_name,commission_pct FROM employees
WHERE commission_pct is not NULL

--DISPLAY FIRST_NAME, LAST NAME, HIRE DATE OF EMPLOYEES THAT MAKES LESS THAN 10,000
SELECT first_name, last_name, hire_date, salary FROM employees
WHERE salary < 10000

ONLY SALARY OF TJ OLSON
SELECT salary
FROM employees
WHERE first_name='TJ'and last_name='OLSON'

--Issue a query to display all the employees that make more than Peter Hall
SELECT first_name, last_name, salary FROM employees
WHERE salary >(SELECT salary FROM employees
WHERE first_name='Peter' and last_name='Hall')

--DISPLAY ALL THE EMPLOYEES IN THE SAME DEPARTMENT AS LISA OZER
SELECT first_name, last_name, department_id FROM employees
WHERE department_id =(SELECT department_id FROM employees WHERE first_name='Lisa' and last_name='Ozer')

--CREATE A QUERY TO DISPLAY THE EMPLOYEE NUMBER AND LAST NAME OF ALL EMPLOYEES WHO EARNS MORE THAN THE AVERAGE SALARY. SORT THE RESULTS IN ASCENDING ORDER OF SALARY
SELECT employee_id, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) ORDER by salary DESC

--DISPLAY ALL THE DEPARTMENT NAME, STREET ADDRESS, POSTAL CODE, CITY AND STATE OF EACH DEPARTMENT. USE THE DEPARTMENT AND LOCATIONS TABLE FOR THIS QUERY.
SELECT d.department_name, l.street_address, l.postal_code, l.city, l.state_province, d.location_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id 

SELECT department_name, street_address, postal_code, city, state_province
FROM departments INNER JOIN locations
ON departments.location_id = locations.location_id 

----DISPLAY THE HIGHEST, LOWEST, SUM AND AVERAGE SALARY OF ALL EMPLOYEES. 
SELECT MAX(salary) AS Maximum, MIN(salary) AS Minimum, AVG(salary) AS Average, SUM(salary) AS Total
FROM employees

--DISPLAY THE LAST NAME, DEPARTMENT NUMBER AND JOB ID OF ALL EMPLOYEES WHOSE DEPARTMENT LOCATION ID IS 1700
SELECT e.last_name, d.department_id, e.job_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700

--DISPLAY THE DEPARTMENT NUMBER, LAST NAME, JOB ID OF EVERY EMPLOYEE IN EXECUTIVE DEPARTMENT
SELECT d.department_id, e.last_name, e.job_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = 'executive'

--WRITE A QUERY TO DISPLAY THE NUMBER OF PEOPLE WITH THE SAME JOB
SELECT count(job_id) AS number_employee, job_id 
FROM employees
GROUP BY job_id 
ORDER BY number_employee DESC

--DISPLAY THE DEPARTMENT NAMES FOR THE DEPARTMENTS 10, 20 AND 30
SELECT department_name, department_id
FROM departments
WHERE department_id = 10 OR department_id = 20 OR department_id = 30

--DISPLAY THE FULL NAME, DEPARTMENT NAME AND HIRE DATE OF ALL EMPLOYEES THAT WERE HIRED AFTER SHELLI BAIDA
SELECT e.first_name, e.last_name, e.hire_date, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.hire_date > (SELECT hire_date FROM employees WHERE first_name = 'shelli' AND last_name = 'baida')
