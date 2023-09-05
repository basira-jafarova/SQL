-- 1. Return the name of the employee with the lowest salary in department 90.

select min(salary)
from hr.employees
where department_id=90;

select* from hr.employees emp 
where salary = (select min(salary) from hr.employees where department_id=90)
and department_id = 90 ;


--2. Select the department name, employee name, and salary of all employees who work in the human resources or purchasing 
--   departments. Compute a rank for each unique salary in both departments.

SELECT 
department_id, last_name, salary, 
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary) DENSE_RANK, 
RANK() OVER (PARTITION BY department_id ORDER BY salary) RANK 
FROM employees 
WHERE department_id in (40, 60) 
ORDER BY DENSE_RANK, last_name;


--3. Select the 3 employees with minimum salary for department id 50.

SELECT * from (select
department_id, last_name, salary, 
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary) DRANK
FROM employees 
WHERE department_id = 50) 
WHERE drank in (1, 2, 3);


--4. Show first name, last name, salary and previously listed employee’s salary who works in “IT_PROG” over hire date.

select 
first_name, last_name, hire_date, salary, job_id, 
lag(salary, 1, 0) over (partition by job_id order by hire_date) previous
from employees 
where job_id = 'IT_PROG';


--5. Display details of current job for employees who worked as IT Programmers in the past.

select * from hr.jobs
where job_id in
(select job_id from employees where employee_id in
(select employee_id from job_history where job_id='IT_PROG'));

-- Diger usul
select * from JOBS J
inner join hr.employees emp on j.job_id=emp.job_id
inner join hr.job_history jh on jh.employee_id=emp.employee_id
and jh.job_id='IT_PROG';


--6. Make a copy of the employees table and update the salaries of the employees in the new table with the maximum salary 
--   in their departments.

update employees_copy ec set salary=(select max(salary) from hr.employees emp
where emp.department_id=ec.department_id);


--7. Make a copy of the employees table and update the salaries of the employees in the new table with a 30 percent increase.

update employees_copy ec set salary=1.3*salary;

