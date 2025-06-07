SELECT * FROM hrdata.countries;
SELECT * FROM hrdata.departments;
SELECT * FROM hrdata.employees;
SELECT * FROM hrdata.job_history;
SELECT * FROM hrdata.jobs;
SELECT * FROM hrdata.locations;
SELECT * FROM hrdata.regions;

-- N0.1	Total number of employees in each department

SELECT dp.DEPARTMENT_NAME, COUNT(em.EMPLOYEE_ID) AS Total_Employees
FROM hrdata.departments AS dp
INNER JOIN hrdata.employees AS em
ON dp.DEPARTMENT_ID = em.DEPARTMENT_ID
GROUP BY dp.DEPARTMENT_NAME
ORDER BY Total_Employees DESC;

-- N0.2 Average salary of employees for each job role,  displaying the job title along with the average salary.

SELECT j.JOB_TITLE, ROUND(AVG(em.SALARY),0) AS Average_Salary
FROM hrdata.jobs AS j
JOIN hrdata.employees AS em
ON j.JOB_ID = em.JOB_ID
GROUP BY j.JOB_TITLE;

-- N0.3 List of all employees along with their department names and location details.

SELECT em.FIRST_NAME, em.LAST_NAME, dp.DEPARTMENT_NAME, lo.CITY, lo.STATE_PROVINCE, lo.COUNTRY_ID
FROM hrdata.employees AS em
JOIN hrdata.departments AS dp ON em.DEPARTMENT_ID = dp.DEPARTMENT_ID
JOIN Locations As lo ON dp.LOCATION_ID = lo.LOCATION_ID;

-- N0.4 Employees who earn more than the average salary of their department.

SELECT LAST_NAME, FIRST_NAME, SALARY
FROM hrdata.employees
WHERE SALARY >
(SELECT AVG(SALARY) FROM employees);

 -- N0.5 Department that has the highest total salary expense.
    
SELECT dp.DEPARTMENT_NAME, SUM(em.SALARY) AS Total_Salary_Expense
FROM hrdata.departments AS dp
JOIN hrdata.employees AS em
ON dp.DEPARTMENT_ID = em.DEPARTMENT_ID
GROUP BY dp.DEPARTMENT_NAME
ORDER BY Total_Salary_Expense DESC
LIMIT 1;

-- N0.6 Employees with the highest salary in the company.
    
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM hrdata.employees WHERE SALARY =
(SELECT MAX(SALARY) FROM employees)

-- N0.7 Names of employees who report directly to a specific manager (e.g., manager ID = 100)

SELECT LAST_NAME, FIRST_NAME, MANAGER_ID
FROM hrdata.employees
WHERE MANAGER_ID = '100';

SELECT LAST_NAME, FIRST_NAME, MANAGER_ID
FROM hrdata.employees
WHERE MANAGER_ID = '103';

SELECT LAST_NAME, FIRST_NAME, MANAGER_ID
FROM hrdata.employees
WHERE MANAGER_ID = '114';

SELECT LAST_NAME, FIRST_NAME, MANAGER_ID
FROM hrdata.employees
WHERE MANAGER_ID = '121';

SELECT LAST_NAME, FIRST_NAME, MANAGER_ID
FROM hrdata.employees
WHERE MANAGER_ID = '145';

SELECT LAST_NAME, FIRST_NAME, MANAGER_ID
FROM hrdata.employees
WHERE MANAGER_ID = '201';

-- N0.8 Employees who have been working for the company for more than 5 years.
    
SELECT LAST_NAME, FIRST_NAME, HIRE_DATE
FROM hrdata.employees
WHERE HIRE_DATE > 5;

-- N0.9 Top 5 highest-paid employees along with their job titles.
    
SELECT em.LAST_NAME, em.FIRST_NAME, em.SALARY, j.JOB_TITLE
FROM hrdata.employees AS em
INNER JOIN hrdata.jobs AS j
ON em.JOB_ID = j.JOB_ID
ORDER BY em.SALARY DESC
LIMIT 5;

-- 10. Number of employees hired each year in descending order.
    
SELECT YEAR(HIRE_DATE) AS Hire_Year, COUNT(*) Total_Hired
FROM hrdata.employees
GROUP BY Hire_Year
ORDER BY Total_Hired DESC;









