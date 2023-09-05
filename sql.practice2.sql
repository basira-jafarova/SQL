--1
Select first_name||' '||last_name as "full name", salary, commission_pct*salary, hire_date from hr.employees where salary<10000;
--2
select DISTINCT city, location_id from hr.locations order by location_id asc;
-- distinct ferqlendirir, location id e gore asc
--3
select first_name, hire_date, job_id from hr.employees where (job_id = 'IT_PROG' or job_id='SA_REP') and 
(hire_date  between '01-JAN-2002' and '31-DEC-2005');
--4
Select job_title from jobs order by job_title desc;
--5
Select * from hr.employees where commission_pct is null and salary between 5000 and 10000 and department_id=30;
--6
Select first_name, last_name,hire_date from hr.employees where hire_date > '01-JAN-08';
--7
Select * from hr.employees where department_id in (150,160,170) ;
--8
Select * from hr.employees where first_name like 'S%' or last_name like 'S%';
--9
SELECT first_name, last_name FROM hr.employees WHERE INSTR(last_name,'b') > 3;
--kecilmiyib 1 ci weekde
