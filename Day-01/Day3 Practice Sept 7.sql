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





