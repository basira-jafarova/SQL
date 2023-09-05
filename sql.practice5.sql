--1. Display last name, job title of employees who have commission percentage and belongs to department 30.
Select last_name,job_title from hr.employees emp left join hr.jobs jh on jh.job_id=emp.job_id
where emp.commission_pct is not null and emp.department_id=30;
--2. Display department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.
select dep.department_name, man.first_name || ' ' || man.last_name manager_name, man.salary
from hr.departments dep
left join hr.employees man on man.manager_id = dep.manager_id 
where extract(year from sysdate) - extract(year from man.hire_date) >= 5;

--3. Display employee name if the employee joined before his manager. 
SELECT emp.first_name "Employee name",
       emp.hire_date,
       man.first_name "Mananger name",
       man.hire_date
FROM hr.employees emp
LEFT JOIN hr.employees man ON emp.manager_id=man.employee_id
where emp.hire_date < man.hire_date
order by emp.employee_id;
--4. Display employee name, job title for the jobs, employee did in the past where the job was done less than six months.
select emp.first_name||' '|| emp.last_name "Employee name", jobs.job_title
from hr.employees emp
left join hr.job_history jh on emp.employee_id = jh.employee_id
left join hr.jobs jobs on jh.job_id = jobs.job_id
where months_between(sysdate, jh.start_date) < 6 ;
--5. Display department name, average salary and number of employees with commission within the department.
select dep.department_name, 
       round(avg(emp.salary), 2) avg_salary, 
       count(*)
from hr.departments dep
left join hr.employees emp on dep.department_id = emp.department_id
where emp.commission_pct is not null
group by dep.department_name;
--6. Display employee name and country in which he is working.
select emp.first_name||' '|| emp.last_name "Employee name",
       cnt.country_name "Country name"
from hr.employees emp
left join hr.departments dep on emp.department_id = dep.department_id
left join hr.locations loc on dep.location_id = loc.location_id
left join hr.countries cnt on loc.country_id = cnt.country_id ;