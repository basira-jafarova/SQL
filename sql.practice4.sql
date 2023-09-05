--1. Show minimum, average and maximum salary in last 15 years according to job id.
Select MIN(salary),round(AVG(salary)),MAX(salary),job_id
from hr.employees where EXTRACT(year from sysdate)-EXTRACT(year from hire_date)>15 group by job_id;

--2. How many employees hired after 2005 for each department?
Select count(*), department_id from hr.employees where hire_date> to_date('31-12-2005','dd.mm.yyyy') group by department_id;

/*3. Write a query to show departments in which the difference between maximum and minimum 
salary is greater than 5000.*/
Select department_id from hr.employees group by department_id having max(salary)-min(salary)>5000;

/*4. Display salaries of employees who has not commission pact according to departments 
(without using where).*/
Select sum(
case 
when commission_pct is null then salary
else 0
end)
from hr.employees group by department_id;
