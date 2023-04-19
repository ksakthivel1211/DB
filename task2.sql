-- task 1

    select * from Employee where first_name ilike '%even';
    
    delete from employees where first_name like '%even';



-- task 2

    select distinct salary from employee order by salary limit 3;



-- task 3

    drop table employees;



-- task 4

    create table employee clone employees;
    truncate employees;


    
-- task 5

    alter table employee
    drop column EMAIL;



-- task 6

    select concat_ws(' ',FIRST_NAME,LAST_NAME) as full_name,HIRE_DATE,email from employee where year(HIRE_DATE)<2000;


    
-- task 7

    select EMPLOYEE_ID,JOB_ID,hire_date FROM employee where year(HIRE_DATE) between 1990 and 1999;


    
-- task 8

    select employee_id, CHARINDEX('A',email) as index,email from employee ;


    
-- task 9

    select employee_id , concat_ws(' ',FIRST_NAME,LAST_NAME) as full_name from employee where length(full_name)<12;



-- task 10

    select employee_id, concat_ws('-',FIRST_NAME ,last_name, email) as UNQ_ID from EMPLOYEE;


    
-- task 11

    alter table employee modify column email varchar(30);


    
-- task 12

        select first_name,phone_number,split_part(phone_number, '.' , -1) as extension 
        ,reverse(substr(reverse(phone_number),charindex('.',reverse(phone_number))+1,length(phone_number))) as phone from employee;

 replace(phone_number ,concat ('.', extension) , '')
        

-- task 13

        select * from employee order by salary desc limit 2 offset 1;


        
-- task 14

        select top 3 * from employee where department_id in(select department_id from departments where department_name like 'Shipping' or department_name like 'IT')order by salary desc;  


        
-- task 15

    select employee_id, job_id from employee
    union
    select employee_id, job_id from job_history
    order by employee_id


    
-- task 16

    select employee_id,concat_ws(',',dayname(hire_date),monthname(hire_date),day(hire_date),year(hire_date)) as joined_date from employee;


    
-- task 17

alter session set autocommit = false;
insert into jobs values('DT_ENGG','Data Engineer',14000,30000);
commit;
update jobs set max_salary = 40000 where job_id = 'DT_ENGG';
rollback;
select * from jobs;
alter session set autocommit = true;
delete from jobs where job_id like 'DT_ENGG';


-- task 18

        select round(avg(salary),3) as avr from employee where hire_date>'1999-01-08' and hire_date<'2000-01-01';


        
-- task 19

    select * from regions;
    select region_name from regions
    union all select 'Australia' union all select 'Asia' union all select 'Antartica' union all select 'Europe';

        select region_name from regions
    union select 'Australia' union select 'Asia' union select 'Antartica' union select 'Europe';