--1. Display the first promotion year for each employee.
Select emp.first_name, emp.employee_id,to_char (min(end_date),'YYYY') FPY
from hr.employees emp left join hr.job_history jb on emp.employee_id=jb.employee_id group by emp.first_name, emp.employee_id;
--2. Display location, city and department name of employees who have been promoted more than 
--once.
Select dep.location_id, loc.city, dep.department_name from hr.employees emp inner join hr.departments dep on emp.department_id=dep.department_id
inner join hr.locations loc on dep.location_id=loc.location_id where emp.employee_id in(
Select employee_id from hr.job_history jh group by employee_id having count(*)>1);
--3. Display minimum and maximum “hire_date” of employees work in IT and HR departments.
Select  min(hire_date),max(hire_date) from hr.employees emp left join hr.departments dep on dep.department_id=emp.department_id
where department_name in ('Human Resources', 'IT') 
group by department_name;
--4. Find difference between current date and hire dates of employees after sorting them by hire 
--date, then show difference in days, months and years.
select first_name||' '||last_name name, hire_date, sysdate, 
extract(year from sysdate) - extract(year from hire_date) year_diff,
round(MONTHS_BETWEEN(SYSDATE, hire_date), 2) month_diff,
round(sysdate-hire_date, 2) day_diff
from hr.employees;

--5. Find which departments used to hire earliest/latest.
Select distinct department_name from hr.departments dep left join hr.employees emp on dep.department_id=emp.department_id where hire_date = (select min(hire_date) from hr.employees) or
      hire_date = (select max(hire_date) from hr.employees);

--6. Find the number of departments with no employee for each city. 
select loc.city, count(employee_id) no_employee
from hr.locations loc
left join hr.departments dep on loc.location_id = dep.location_id
left join hr.employees emp on dep.department_id = emp.department_id
group by loc.city
having count(employee_id)=0;
--7. Create a category called “seasons” and find in which season most employees were hired.
select case when extract(month from hire_date) in(12, 1, 2) then 'Winter'
            when extract(month from hire_date) in(3, 4, 5) then 'Spring'
            when extract(month from hire_date) in(6, 7, 8) then 'Summer'
            when extract(month from hire_date) in(9, 10, 11) then 'Autumn'
            else 'N/A' end as seasons,
            count(distinct employee_id) 
from hr.employees
group by case when extract(month from hire_date) in(12, 1, 2) then 'Winter'
            when extract(month from hire_date) in(3, 4, 5) then 'Spring'
            when extract(month from hire_date) in(6, 7, 8) then 'Summer'
            when extract(month from hire_date) in(9, 10, 11) then 'Autumn'
            else 'N/A' end ;

--8. Find the cities of employees with average salary more than 5000.
Select loc.city,emp.first_name from hr.employees emp inner join hr.departments dep on emp.department_id=dep.department_id
inner join hr.locations loc on dep.location_id=loc.location_id where avg(salary)>5000;

