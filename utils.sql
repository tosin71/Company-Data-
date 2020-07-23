--1. Display the minimum salary
SELECT MIN (salary) FROM employees

--2. Display the highest salary
SELECT MAX (salary) FROM employees

--3. Display the total salary of all employees
SELECT SUM (salary) FROM employees

--4. Display the average salary of all employees
SELECT AVG (salary)FROM employees

--5. Issue a query to count the number of row in the employee table. The result should be just one row
SELECT COUNT (*) FROM employees

--6.) Issue a query to count the number of employees that make commission. The result should be just one row.
SELECT COUNT (commission_pct) FROM employees
WHERE commission_pct is not NULL

--7.) Issue a query to count the number of employees’ first name column. The result should be just one row.
SELECT COUNT (first_name) FROM employees

--8.) Display all employees that make less than Peter Hall.
SELECT first_name, last_name, salary FROM employees
WHERE salary <(SELECT salary FROM employees
WHERE first_name='Peter' and last_name='Hall')

--9.) Display all the employees in the same department as Lisa Ozer
SELECT first_name, last_name, department_id FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE first_name='Lisa' and last_name='ozer')

--10.) Display all the employees in the same department as Martha Sullivan and that make more than TJ Olson.
SELECT first_name, last_name, department_id, salary FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE first_name='Martha' AND last_name='Sullivan') 
AND salary>(SELECT salary FROM employees WHERE first_name='TJ' AND last_name='Olson')

--11.) Display all the departments that exist in the departments table that are not in the employees table. Do not use a where clause
SELECT department_id FROM departments
EXCEPT 
SELECT DISTINCT department_id FROM employees 

-- 12.)Display all the departments that exist in department tables that are also in the employees table. Do not use a where clause.
SELECT department_id FROM departments
INTERSECT
SELECT DISTINCT department_id FROM employees

--13.) Display all the departments name, street address, postal code, city and state of each department. Use the departments and locations table for this query.
SELECT d.department_name, l.street_address, l.postal_code, l.city, l.state_province, d.location_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id 

--14.) Display the first name and salary of all the employees in the Accounting departments. 
SELECT e.first_name, e.salary, d.department_name, d.department_id
FROM departments d JOIN employees e
ON d.department_id = e.department_id
WHERE d.department_name = 'Accounting'

--15.) Display all the last name of all the employees whose department location id are 1700 and 1800.
SELECT e.last_name, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700 OR d.location_id = 1800

--16.) Display the phone number of all the employees in the Marketing department.
SELECT e.phone_number, d.department_name, d.department_id
FROM departments d JOIN employees e
ON d.department_id = e.department_id
WHERE d.department_name = 'Marketing'

--17.) Display all the employees in the Shipping and Marketing departments who make more than 3100.
SELECT e.first_name, e.last_name, d.department_name, e.salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE (d.department_name = 'Shipping' OR d.department_name = 'Marketing') AND e.salary > 3100
 
--18.) Display the last name and salary of the employees that makes the least in each department. 
SELECT last_name, salary, department_id
FROM employees 
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id)
 
--19.) Display all the employees who were hired before Tayler Fox
SELECT e.first_name, e.last_name, e.hire_date, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.hire_date < (SELECT hire_date FROM employees WHERE first_name = 'Tayler' AND last_name = 'Fox')

--20.) Display names and salary of the employees in executive department. 
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM departments d JOIN employees e
ON d.department_id = e.department_id
WHERE d.department_name = 'Executive'

--21.) Display the employees whose job ID is the same as that of employee 141
SELECT first_name, last_name, job_id FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 141)

--22.) For each employee, display the employee number, last name, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary.
SELECT phone_number, last_name, salary, ROUND (salary*1.15,0) AS 'New salary'
FROM employees

--23.) Find the employees who earn the same salary as the minimum salary for each department 
SELECT first_name, last_name, salary FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees)

--24.) Display all the employees and their salaries that make more than Abel.
SELECT first_name, last_name, salary FROM employees
WHERE salary >(SELECT salary FROM employees
WHERE last_name= 'Abel')

--25.) Create a query that displays the employees’ last names and commission amounts. If an
employee does not earn commission, put “no commission”. Label the column COMM. 
SELECT last_name, commission_pct AS COMM FROM employees WHERE commission_pct is NOT null 

-- 26.) Create a unique listing of all jobs that are in department 80. Include the location of department in the output.
SELECT DISTINCT e.job_id, d.department_id, d.location_id 
FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.department_id = 80

--27.) Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission
SELECT e.last_name, d.department_name, d.location_id, e.commission_pct, l.city
FROM employees e JOIN departments d 
ON d.department_id = e.department_id 
JOIN locations l ON d.location_id = l.location_id
WHERE commission_pct is not null

--28.) Create a query to display the name and hire date of any employee hired after employee Davies.
SELECT e.first_name, e.last_name, e.hire_date, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Davies')


--29.) Determine the validity of the following three statements. Circle either True or False.
a.	Group functions work across many rows to produce one result per group.
True/False
b.	Group functions include nulls in calculations. True/False
c.	The WHERE clause restricts rows prior to inclusion in a group calculation . True/False

--30.) Display the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number
SELECT ROUND(MAX(salary),0) AS 'Maximum',
ROUND(MIN(salary),0) AS 'Minimum', 
ROUND(AVG(salary),0) AS 'Average',
ROUND(SUM(salary),0) AS 'Sum'
FROM employees

--31.) Display the highest, lowest,sum, and average salary of all employees. Label the columns MAXIMUM, MINIMUM, SUM and AVERAGE, respectively. Round up the result to the nearest whole number.
SELECT ROUND(MAX(salary),0) AS 'Maximum',
ROUND(MIN(salary),0) AS 'Minimum', 
ROUND(AVG(salary),0) AS 'Average',
ROUND(SUM(salary),0) AS 'Sum'
FROM employees

--32.) Display the MINIMUN, MAXIMUM, SUM AND AVERAGE salary of each job type. 
SELECT job_id, MIN(salary) AS 'Minimum', MAX(salary) AS 'Maximum', SUM(salary) AS 'Sum', AVG(salary)AS 'Average' FROM employees
GROUP BY job_id

--33.) Display all the employees and their managers from the employees table.
SELECT first_name, last_name, manager_id FROM employees

--34.) Determine the number of manager without listing them. Label the column NUMBER of manager. Hint: use manger_id column to determine the number of managers.
SELECT COUNT(DISTINCT manager_id) AS 'Number of Manager' FROM employees 

--35.) Write a query that displays the difference between the HIGHEST AND LOWEST salaries. Label the column DIFFERENCE.
SELECT (MAX(salary) - MIN(salary)) AS Difference
FROM employees

--36.) Display the sum salary of all employees in each department.
SELECT department_id, SUM (salary) AS 'Sum' FROM employees GROUP BY department_id

--37.) Write a query to display each department's name, location, number of employees, and the average salary of employees in the department. Label the column NAME, LOCATION, NUMBER OF PEOPLE, respectively.
SELECT d.department_name AS 'Name', d.location_id AS 'Location',COUNT(e.employee_id) AS 'Number of People',AVG(e.salary) AS 'Average Salary' FROM employees e JOIN departments d ON e.department_id=d.department_id
GROUP BY d.department_name,d.location_id

--38.) Write a query to display the last name and hire date of employee in the same department as Zlotkey. Exclude Zlotkey.
SELECT last_name, hire_date, department_id FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE last_name = 'Zlotkey') AND last_name <> 'Zlotkey'

--39.) Create a query to display the employee number and last name of all employees who earns more than the average salary. Sort the result in ascending order of salary.
SELECT employee_id, last_name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees) ORDER BY salary

--40.) Write a query that displays the employee number and last names of all employees who work in a department with any employees whose last name contains a letter U.
SELECT employee_id, last_name, department_id FROM  employees 
WHERE department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%U%')

--41.) Display the last name, department number and job id of all employees whose department location ID is 1700
SELECT e.last_name, d.department_id, e.job_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700

--42.) Display the last name and salary of every employee who reports to king.
SELECT last_name, salary, manager_id FROM employees
WHERE manager_id = (SELECT manager_id FROM employees WHERE last_name = 'King') AND last_name <> 'King'

--43.) Display the department number, last name, job ID of every employee in Executive department.
SELECT e.last_name, d.department_id, e.job_id, d.department_name
FROM departments d JOIN employees e
ON d.department_id = e.department_id
WHERE d.department_name = 'Executive'

--44.) Display all last name, their department name and id from employees and department tables.
SELECT e.last_name, d.department_name, e.employee_id
FROM employees e JOIN departments d 
ON d.department_id = e.department_id 

--45.) Display all the last name, department name, id and location from employees, department and locations tables.
SELECT e.last_name, d.department_name, l.country_id
FROM employees e JOIN departments d 
ON d.department_id = e.department_id 
JOIN locations l ON d.location_id = l.location_id

--46.) Display the names and hire dates for all employees who were hired before their managers,
--along with their manager’s names and hire dates. Label the columns Employee, EmpHired, Manager, and Mgr Hired, respectively.
SELECT e.first_name AS 'Employee', e.hire_date AS 'Employee_hired', m.first_name AS 'Manager', m.hire_date AS 'Manager_hired' 
FROM employees e JOIN employees m 
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date

--47.) Write a query to determine who earns more than Mr. Tobias
SELECT first_name, last_name, salary FROM employees
WHERE salary >(SELECT salary FROM employees WHERE last_name ='Tobias')

--48.) Write a query to determine who earns more than Mr. Taylor
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Winston' AND last_name = 'Taylor')

--49.) Find the job with the highest average salary
SELECT AVG (salary), job_id FROM employees GROUP BY job_id ORDER BY AVG(salary) DESC 

--50.) Find the employees that make more than Taylor and are in department 80. 
SELECT first_name, last_name, department_id, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Winston' AND last_name = 'Taylor')
AND department_id = 80 

--51.) Display all department names and their full street address.
SELECT d.department_name, l.street_address FROM departments d JOIN locations l 
ON d.location_id = l.location_id

--52.) Write a query to display the number of people with the same job
SELECT COUNT(job_id) AS number_employee, job_id FROM employees
GROUP BY job_id  

--53.) Display the full name, department and salary of all employees who make the least in each department.
SELECT first_name, last_name, department_id, salary FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id)

--54.) Display the full name and salary of the employee that makes the most in departments 50 and 80.
SELECT first_name, last_name, salary FROM employees
WHERE salary IN (SELECT MAX(salary) FROM employees WHERE department_id = 50 OR department_id = 80)

--55.) Display the department names for the departments 10, 20 and 30.
SELECT department_name, department_id FROM departments
WHERE department_id = 10 OR department_id = 20 OR department_id = 30

--56.) Display all the manager id and department names of all the departments in United Kingdom (UK).
SELECT d.manager_id, d.department_name, l.country_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE l.country_id = 'UK'

--57.) Display the full name and phone numbers of all employees who are not in location id 1700. 
SELECT e.first_name, e.last_name, e.phone_number, d.location_id
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id <> 1700

--58.) Display the full name, department name and hire date of all employees that were hired after Shelli Baida.
SELECT e.first_name, e.last_name, e.hire_date, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.hire_date > (SELECT hire_date FROM employees WHERE first_name = 'shelli' AND last_name = 'baida')

--59.) Display the full name and salary of all employees who make the same salary as Janette King.
SELECT first_name, last_name, salary FROM employees
WHERE salary =(SELECT salary FROM employees WHERE first_name='Janette' and last_name='King')

--60.) Display the full name hire date and salary of all employees who were hired in 2007 and make more than Elizabeth Bates.
SELECT first_name, last_name, hire_date, salary FROM employees 
WHERE hire_date LIKE '2007%' AND salary > (SELECT salary FROM employees WHERE first_name = 'Elizabeth' and last_name = 'Bates')

--61.) Issue a query to display all departments whose average salary is greater than $8000
SELECT department_id, AVG(salary) AS 'Average' FROM employees WHERE salary > $ 8000 GROUP BY department_id

--62.) Issue a query to display all departments whose maximum salary is greater than 10000
SELECT department_id, MAX (salary) AS 'Maximum' FROM employees WHERE salary > $10000 GROUP BY department_id

--63) Issue a query to display the job title and total monthly salary for each job that has a total 
--salary exceeding $13,000. Exclude any job title that looks like rep and sort the result by total monthly salary.
SELECT job_id, SUM (salary) AS 'Sum salary' FROM employees GROUP BY job_id 
HAVING SUM (salary) > 13000 
AND job_id NOT LIKE '%rep%'

--64.) Issue a query to display the department id, department_name, location_id and city of departments 20 and 50
SELECT d.department_name, d.department_id, d.location_id, l.city 
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE d. department_id = 20 OR department_id = 50 

--65.) Issue a query to display the city and department_name that are having a location id of 1400 
SELECT l.city, d.department_name, l.location_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE d.location_id = 1400

--66.) Display the salary of last name, job id and salary of all employees whose salary is equal to the minimum salary.
SELECT last_name, salary, job_id FROM employees
WHERE salary = ( SELECT MIN (salary) FROM employees)

--67.) Display the departments who have a minimum salary greater that of department 50
SELECT department_id, MIN(salary) AS 'Salary' FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN (salary) FROM employees WHERE department_id = 50)

--68.) Issue a query to display all employees who make more than Timothy Gates and less than Harrison Bloom
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name ='Timothy' and last_name='Gates') 
 AND salary < (SELECT salary FROM employees WHERE first_name ='Harrison' and last_name='Bloom')

--69.) Issue a query to display all employees who are in Lindsey Smith or Joshua Patel department, 
--who make more than Ismael Sciarra and were hired in 2007 and 2008.
 SELECT first_name, last_name, hire_date, department_id, salary FROM employees
 WHERE (department_id = (SELECT department_id FROM employees WHERE first_name = 'Lindsey' and last_name = 'Smith') 
 OR department_id = (SELECT department_id FROM employees WHERE first_name = 'Joshua' and last_name = 'Patel') )
 AND salary > (SELECT salary FROM employees WHERE first_name ='Ismael' and last_name ='Sciarra')
  AND (YEAR(hire_date) BETWEEN '2007' AND '2008')


SELECT DISTINCT year (hire_date) FROM employees
SELECT DISTINCT month (hire_date) FROM employees
SELECT DISTINCT datename (month, hire_date) FROM employees

--70.) Issue a query to display the full name, 10 digit phone number, salary, department name, streat address, postal code, city 
--and state province of all employees
SELECT e.first_name, e.last_name, e.phone_number, e.salary, d.department_name, l.street_address, l.postal_code, l.city
FROM employees e JOIN departments d 
ON d.department_id = e.department_id 
JOIN locations l ON d.location_id = l.location_id

