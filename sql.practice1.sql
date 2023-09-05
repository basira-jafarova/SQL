--1
Select  job_title,max_salary- min_salary as "Salary differences" from hr.jobs where max_salary BETWEEN 12000 and 18000;
--2
Select * from hr.employees where commission_pct is null and salary BETWEEN 7000 and 12000 and department_id not in(50,30,80);
--3
Select first_name||' '||last_name as "full_name", hire_date, commission_pct,email ||'-'|| phone_number,salary from hr.employees
 where salary>11000 order by "full_name" desc;
--4
Select first_name, last_name, salary from hr.employees where first_name like '%m' and hire_date< '05-JUN-10';
--5
Select first_name||' '||last_name as "full_name",email ||'-'|| phone_number as "Contact_detail",salary as "Remunaration" from hr.employees 
where salary not BETWEEN 9000 and 17000 and commission_pct is not null;
--6
Select * from hr.departments where department_id=20;
--7
Select * from hr.job_history order by employee_id desc, start_date asc;
--8
Select job_id, salary from hr.employees where phone_number like '515%' or phone_number like '590%' and hire_date>'31-DEC-03' order by hire_date,salary ;
--9
Select * from hr.employees where hire_date BETWEEN '01-Jan-01'and '31-Dec-01';
--10
Select first_name,last_name from hr.employees where hire_date not between '01-JAN-06' and '31-DEC-07';'31-dec-2005' and '01-jan-2008'

--11
Select email,job_id,first_name from hr.employees where hire_date like '%2007' or hire_date like '%JAN%';
--12
Select * from hr.employees where hire_date>'31-Dec-07' or salary<10000;