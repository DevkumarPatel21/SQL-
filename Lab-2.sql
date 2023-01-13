/**1.Write a query to display the first name, last name, salary, and job title, for each employee. Order them by their last name.**/
SELECT E.first_name, E.last_name, E.salary, J.job_title 
FROM employees E
LEFT JOIN jobs J
ON J.job_id = E.job_id
ORDER BY E.last_name 

/**  2.	Write a query to display the first name, last name, department, city, and state province for each employee.**/
SELECT E.first_name, E.last_name,
       D.department_name, L.city, L.state_province
       FROM employees E 
	    LEFT JOIN departments D
	    ON D.department_id = E.department_id
	    JOIN locations L
	    ON  L.location_id = D.location_id
		ORDER BY E.first_name

/** 3.Write a query to display the first name, last name, department id and department name for all employees 
      who work in the department having  department id 5 or 7. **/

SELECT E.first_name, E.last_name, D.department_id,D.department_name
       FROM employees E
	   LEFT JOIN departments D
	   ON D.department_id = E.department_id
	   WHERE D.department_id IN (5, 7)
	   ORDER BY E.first_name

/** 4.	Write a query to display the first name, last name and salary for those employees 
        whose salary is less than that of the employee with id 116.**/

SELECT E.first_name, E.last_name, E.salary 
       FROM employees E
        WHERE E.salary < 2900

/** 5. Write a query to display the employee id, name (first name and last name with a space between), 
      hire date and a column called ‘experience’ with the values ‘Senior’ and ‘Junior’ 
	  when the hire date is  1994 or before, and after 1994 respectively . [You can use CONCAT function] **/

SELECT E.employee_id, E.first_name, E.last_name, E.hire_date, Year(E.hire_date) AS hire_year,
      (CASE WHEN Year(E.hire_date) <= 1994 THEN 'Senior' ELSE 'Junior' END) AS 'experience'
       FROM employees E


/** 6.	Write a query to display the first name, last name, employee id, manager id and hire date of all employees who report to ‘Neena’. **/

SELECT E.first_name, E.last_name, E.employee_id, E.manager_id, e.hire_date
       FROM employees E
        WHERE E.manager_id =
        (SELECT E.employee_id  
          FROM employees E 
           WHERE E.first_name = 'Neena')

/** 7.	Display the employee first name, last name, employee id, and job title for all employees whose department location is ‘London’. **/
SELECT  E.first_name, E.last_name, E.employee_id, J.job_title
        FROM employees E
         LEFT JOIN jobs J 
          ON J.job_id = E.job_id
          WHERE E.department_id = 
          (SELECT D.department_id
            FROM departments D 
             WHERE D.location_id = 
           (SELECT L.location_id 
             FROM locations L  
             WHERE L.city ='London'));


/** 8.	Write a query to display region name and the number of countries in each region. **/
SELECT R.region_name,count(C.country_id) as NumberofCountries 
       FROM regions R
        LEFT JOIN countries C 
        ON C.region_id = R.region_id
        GROUP BY R.region_name 

/**9.	Write a query to display the department id, sum of salary as ‘total_amt’, number of employees in the department as ‘number_of_employees’, 
    and  a column called ‘size’ with the values  ‘Big’ and ‘Small’ when the number of employees 
	in the department is equal or more than 4, and less than 4 respectively. **/

SELECT E.department_id, SUM(E.salary) AS total_amt ,Count(E.employee_id) 
       AS number_of_employees,
      (CASE WHEN  E.department_id >= 4 THEN 'Big' ELSE 'Small' END) AS 'size'
       FROM employees E 
       GROUP BY E.department_id


 select * from employees