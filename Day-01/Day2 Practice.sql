use employee_data_typed;

-- Complete Classwork 21-09-2026 
-- Q.3 Display employee name, employee salary, and their manager salary. 

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




                

                
