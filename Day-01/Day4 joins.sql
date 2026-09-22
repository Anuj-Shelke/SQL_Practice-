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

