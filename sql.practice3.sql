--1. Display employees who joined in the month of May.
Select first_name,hire_date  from hr.employees where (extract(month from hire_date))=5 ;

-----------2. Display employees who joined in the current year.
Select first_name as Name, hire_date from hr.employees
 where extract(year from hire_date)=extract(year from SYSDATE) ;

-----------3. Display the number of days between system date and 1st January 2011.
Select round( sysdate -to_date('01-JAN-11','DD-MM-YYYY')) "number of days" from hr.employees;

--4. Display maximum salary of employees.
Select max(salary) from hr.employees;

--5. Display number of employees in each department.
Select count(*), department_id from hr.employees group by department_id;

---------6. Display number of employees who joined after 15th of month.
Select count(*) from hr.employees
 where extract( day from hire_date)>15;

-----------7. Display average salary of employees in each department who have commission percentage.
Select AVG(salary) "Average",department_id from hr.employees 
WHERE commission_pct is not null group by department_id ;

--8. Display job ID for jobs with average salary more than 10000.
Select job_id from hr. employees group by job_id having avg(salary)>1000;

/*9. Display job ID, number of employees, sum of salary, and difference between the highest 
salary and the lowest salary of the employees for all jobs.*/
Select job_id, count(*) NOE, sum(salary),max(salary)-min(salary)difference from hr.employees group by job_id;
--10.Display manager ID and number of employees managed by the manager.
Select manager_id, count(*) NOEm from hr.employees group by manager_id having manager_id is not null;

--11.Search for the key differences between CHAR and VARCHAR�data�types.
