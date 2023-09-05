-- 1. According to the given diagram create STUDENTS, ACTIVITIES and SCHEDULE tables. 


-- 2. Insert data into students table from employees table.

insert into hr.students (s_id, first_name, last_name, phone_number, email)
select employee_id, first_name, last_name, phone_number, email
from hr.employees;


-- 3. Change phone number to ‘***’ for students with s_id > 200.

update students
set phone_number = '***'
where s_id > 200;


-- 4. Update first name and last names of students in Upper cases.

update students
set first_name = upper(first_name),
    last_name = upper(last_name);


-- 5. Based on the students table populated with the following data, update the email to 'DSA' for all records whose s_id 
--    is greater than 150.

update students
set email = 'DSA'
where s_id > 150;


-- 6. Create PROGRAMMERS table using records from EMPLOYEES where job_id contains ‘PROG’ substring

create table PROGRAMMERS as
select *
from hr.employees
where job_id like '%PROG%';


-- 7. Delete records from students table where s_id is between 150 and 160.

delete from students
where s_id between 150 and 160;


-- 8. 
--    a) Insert some date into SCHEDULE, then truncate and see results.

insert into schedule (s_id, a_id, s_date)
values (123, 321, to_date('2023-05-25', 'YYYY-MM-DD'));
insert into schedule (s_id, a_id, s_date)
values (234, 432, to_date('2023-05-26', 'YYYY-MM-DD'));

select * from schedule;

truncate table SCHEDULE;

select * from schedule;


--    b) Drop schedule table

drop table schedule;

select * from schedule;


-- 9. For any date given, write a script to find:

--    a) The first and the last days of the next year;

select '01-01-'|| to_char(extract(year from sysdate)+1) as "First Day of Next Year",  
       '31-12-'|| to_char(extract(year from sysdate)+1) as "Last Day of Next Year"
       from dual;

--    b) The first and the last days of the next month;

select last_day(trunc(sysdate, 'mm')) + 1 as "First_Day_Next_Month",
       last_day(add_months(trunc(sysdate, 'mm'), 1)) as "Last_Day_Next_Month"     
       from dual;

--    c) The first and the last days of the previous month.

select last_day(add_months(trunc(sysdate, 'mm'), -2)) + 1 as "First_Day_Previous_Month", 
       last_day(add_months(trunc(sysdate, 'mm'), -1)) as "Last_Day_Previous_Month" 
       from dual;


-- 10. Create a table named “Participants” which consists of first_name, last_name and salary (have to more than 10000).

create table PARTICIPANTS as
select first_name, last_name, salary
from hr.employees
where salary > 10000;

select * from participants;


