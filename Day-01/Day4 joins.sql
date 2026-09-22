-- ==========================================================JOINS =================================================================

select employee.ename,dept.dname 
from employee 
inner join dept
on employee.deptno = dept.deptno; 
select employee.ename,employee.job, dept
from employee
inner join dept 
on  employee.deptno = dept.deptno; 
select employee.ename,dept.dname 
from employee 

inner join dept 
on employee.deptno = dept.deptno
where sal > 3000 ; 

select employee.ename, dept.dname 
from employee
left join dept
on dept.deptno = employee.deptno ; 

select employee.ename, dept.loc 
from employee 
left join dept 
on dept.deptno = employee.deptno ; 

select employee.ename,dept.dname
from employee 
left join dept 
on dept.deptno = employee.deptno 
where sal >3000; 

select employee.ename, dept.dname 
from employee 
right join dept  
on dept.deptno = employee.deptno;  
; 
select e.ename,m.ename 
from employee e 
join employee m 
on e.mgr = m.empno ; 

select e.ename,m.ename ,e.sal
from employee e
join employee m 
on e.mgr = e.empno ; 

create index employee_salary_index on 
employee(sal); 

create index employee_job_index on 
employee(job); 

delimiter //
create procedure  show_employee_names() 
begin
select ename,job from employee ; 
end //
delimiter ; 

delimiter // 
create procedure show_high_salary()
begin 
select sal from employee 
where sal > 3000; 
end // 
delimiter ; 

call show_employee_names();

delimiter // 
create procedure show_salesmen()
begin 
select job from employee 
where job = 'salesman' ; 
end // 
delimiter ; 


use practice; 
show tables ;

-- -------------------------------------------------------------Classwork------------------Joins 

-- left outer join 
select * from employee 
left join dept 
on employee.deptno = dept.deptno ; 


-- full Outer Join 
select * from employee 
left outer join dept 
on employee.deptno = dept.deptno 
union 
select * from employee 
right outer join dept 
on employee.deptno = dept.deptno ; 

select * from employee; 
-- -------------------------------------------Self Join --------------------------------------------
-- Q1. Display Employee name and their manager name 
select e1.ename as employee_name, e2.ename as mgr_name 
from employee e1 join employee e2 
on e1.mgr = e2.empno ; 

-- Q.2 Display employees who do not have a manager -- Wrong 
select e1.ename as employee_name, e2.ename as manager_name 
from employee e1 join employee e2
where e1.mgr is null  ; 

-- Q.3 Display employee name, employee salary, and their manager salary. 

select * from employee; 
SELECT e1.ename as employee_name,e1.sal as employee_sal, e2.ename as mgr_name,e2.sal as mgr_sal
from employee e1 join employee e2 
where e1.mgr = e2.empno ; 

-- Q.4 Display employee who can earn more than their manager 
select e1.ename as employee_name, e1.sal as employee_sal, e2.sal as mgr_sal
from employee e1 join employee e2 
where e1.sal> e2.sal ; 

-- Q.5 Display employees who earn less than there manager 
select e1.ename as employee_name, e1.sal as employee_sal, e2.sal as manager_sal 
from employee e1 join employee e2 
where e1.sal < e2.sal ; 

-- Q.6 Display employee name and manager name working in the same depart 

select e1.ename as employee_name, e1.deptno as employee_dept_no , e2.ename as Manager_name,e2.deptno as Manager_dept_no
from employee e1 join employee e2
where e1.deptno = e2.deptno; 

select * from employee; 
-- Q.7 Display mangers and  the number of employees working under them


-- Q.8 Dsplay employees whose manager is working in department 10 ; 
select e1.ename as employee_name, e2.ename as mgr_name 
from employee e1 join employee e2 
where e1.empno = e2.mgr and e2.deptno = 10 ;
select * from employee;




-- Q.10 Display employee hired before there manager  ; 
select e1.ename as employee_name,e2.ename as mgr_name 
from employee e1 join employee e2
where e1.empno = e2.mgr and e1.hiredate> e2.hiredate; 

-- Q.1 List all the employees in dept 30 
select * from employee 
where deptno = 30; 

-- Q.2List all the salesmen in dept number 30 and having salary greater than 1500
select * from employee 
where deptno = 30 and sal > 1500; 

-- Q.3 List all the employee whose name starts with s or A 
select * from employee 
where ename like 's%' or
ename like  'a%'; 

-- Q.4 List all employees except those who are working in dept 10 and 20
select * from employee 
where deptno not in (10,20); 

-- Q.5 List all employees whose name starts does not starts with s 
select * from employee 
where ename not like 's%'; 

-- Q.6 List all employees who are having reporting manager in dept no 10 
select * from employee 
where mgr in(
select empno from employee 
where deptno = 10
);

-- Q.7 List all employee whose comission is null and working as clerk 
select * from employee
where comm is null and job = 'clerk'; 

-- Q.8 List all the employees who don't have a reporting manager in deptno 10 or 20 
select * from employee 
where mgr in (
select empno from employee
where deptno not in(10,20)); 

-- Q.9 List all employees whose comission is null and working as clerk 
select * from employee where comm is null and job = 'clerk'; 

-- ------------------------------------------------------------8 sept Classwork---------------------------------



-- Display all employee nams in uppercase 
select upper(ename) from employee; 

-- Display job itles in lowercase 
select lower(job) from employee; 

-- Show the lenght of each employee's name 
select length(ename) from employee; 

-- Concatenate employee name and job titile with a hyphen 
select concat(ename,'-',job)from employee; 

-- Show the first char of each employee job title 
select ename,left(job,1) from employee; 

-- Show the last 2 char of each employee name 
select right(ename,2) from employee;

-- Remove leading and trailing spaces from the string 
select trim(ename) from employee; 

-- Display a column that joins employee name and deptno in format ENAME(DEPTNO)
select concat(ename,'(',deptno,')' ) from employee ; 

-- -------------------------------------------Numeric Function Questions --------------------------------------------------
-- Q.1 Show the ceiling value of each employee salary divided by 7 
select ceil(sal/7) from employee; 

-- Q.2 Show floor value of each employee salary divided by 7 
select floor(sal/7) from employee; 

-- Q.3 Show sqrt of each employee salary 
select sqrt(sal) from employee; 

-- Q.4 Show power of each employee salary 
select power(sal,2) from employee; 

-- Q.5 Display the value of pi for each row 
select *,pi() from employee; 

-- Q.6 Show employee names and calculate: salary*comission (use if comm is null ) 
 select ename,sal*coalesce(comm,0) from employee; 
 
 -- ------------------------------------------------Date Function Questions ----------------------------------------------
 -- Q.1 Display each employee and their hire date 
 call display(); 
 select ename,hiredate from employee; 
 
 -- Q.2 Display each employee's name and the year in which they were hired 
 select ename,year(hiredate) from employee; 
 
 -- Q.3 Display each employee's name and the month number in which they were hired 
 select ename,month(hiredate) from employee; 
 
 -- Q.4 Display each employee's name and day in which they were hired 
 select ename,day(hiredate) from employee; 
 
 -- Q.5 Display each employee's and date five day after they were hired 
SELECT ename, DATE_ADD(hiredate, INTERVAL 5 DAY)
FROM employee;
 
 -- Q.6 Display each employee's name and date 30 days after their hired date 
 select ename,date_add(hiredate,interval 30 day)
 from employee; 
 
 -- Q.7 Display each employees and the 
 -- Current Date with time 
 select now(); 
 
 -- Q.8 Display the date that will be 5 days from today using curdate 
 select date_add(curdate(),interval 5 day)
 from employee; 
 
 -- Q.9 Display the date that will be 3 months from today 
select date_add(curdate(),interval 3 month) from employee; 

-- Q.10 Diplay each employee's name and calculate the number of days they have worked for their hire date util today 
select datediff(curdate(),hiredate) from employee; 

-- Q.11 Display name of employees who has worked more than 15000 days 
select datediff(curdate(),hiredate) from employee
where datediff(curdate(),hiredate)  > 15000; 

-- Q.12 Display Date that will be three months from today 
select date_add(curdate(),interval 3 month); 

-- Q.13 Display employees who were hired in 1981
select ename,hiredate from employee 
where year(hiredate) = 1981; 

-- Q.14 Display employees who where hired in december 
select ename,hiredate from employee 
where month(hiredate) = 12 ; 

-- Q.15 Display all the employees who were hired in 3rd day of the month 
select ename,hiredate from employee 
where day(hiredate) = 3 ; 

-- Q.16 Display employees who were hired in september 1981 
select ename,hiredate from employee 
where month(hiredate) = 9 and year(hiredate) = 1981; 

-- Q.17 Display employees who were hired before 1981 
select ename,hiredate from employee 
where year(hiredate) < 1981; 

-- Q.18 Display employees who were hired after 1982 
select ename,hiredate from employee 
where year(hiredate) <1982; 

-- Q.19 Show employee name with their hiredate 
select ename,hiredate from employee;

 
call display(); 
 -- Current Date without time 
 select curdate();

-- Date_add Function 
SELECT DATE_ADD('2025-09-25', INTERVAL 1 YEAR)
FROM employee
WHERE empno = 1;

-- DateDiff Function 
select datediff(curdate(),hiredate)
from employee where empno = 7499; 






