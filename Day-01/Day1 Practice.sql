Create database Employee_Data_Typed; 
use Employee_Data_Typed;
Create Table Data(
empno int primary key, 
ename varchar(50), 
job varchar(50), 
mgr int, 
hiredata date, 
sal float, 
comm float, 
deptno int); 
INSERT INTO data
VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 1300.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 2100.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1750.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 3475.00, 1400.00, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1750.00, NULL, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 3350.00, NULL, 10),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2950.00, NULL, 20),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3500.00, NULL, 10),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5500.00, NULL, 30),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 2000.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1600.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 1450.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3500.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
select * from data; 
-- Q.1 Lisst All the Employees Whose Comission is NULL; 
select * from data where comm is NULL; 

-- Q.2 List All Employees Who Dont have a reporting Manager ; 
Select * from data where mgr is NULL; 

-- Q.3 List all SalesMan in dept 30 ; 
select * from data where job = 'SALESMAN' and deptno = 30;

-- Q.4 LIST ALL THE SALESMEN IN DEPT NUMBER 30 AND HAVING SALARY GREATER THAN 1500. 
select * from data where deptno = 30 and sal > 1500; 

-- Q.5List all the Employees Whose Name starts with S or A ; 
select * from data where ename like 'A%' or ename like 'S%'; 

-- Q.6 List all the Employees Except those who are working in Dept 10 and 20 ; 
select * from data where deptno not in  (10,20) ; 

-- Q.7 LIST THE EMPLOYEES WHOSE NAME DOES NOT START WITH ‘S’. 
select * from data where ename like 'S%'; 

-- Q.8 LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS IN DEPT 10. 
select * from data where mgr ; 
--       <---------------------------------------DAY 2 Functions --------------------------------------------------------> 
-- Single Row Functions 
-- q.1Display all eomployee names in uppercase ; 
SELECT upper(ename) from data; 

-- Q.2 dIPLAY JOB TITLES IN LOWERCASE 
SELECT LOWER(job) from data ; 

-- Q.3  show the length of each employee name 
select length(ename) from data; 

-- Q.4 Concenate 
select concat(ename,'-',job) from data ; 

-- Q.5 how the frist 3 char of each employee job title ; 
select substring(job,1,3) from data ;  

-- Q.6 Show last two characters of each employee name ; 
select substring(ename,length(ename)-1,2) from data; 
-- alternate ;
-- select reverse(substring(ename)    // PENDING

-- Q.8 Display 
select * from ; 


-- <-----------------------------------------------------NUmeric Function Questions---------------------------------------------------> 
-- Q.1 Show the ceiling value of each employee salary divided by 7 
SELECT ename, sal, CEIL(sal / 7) AS ceil_value
FROM data;



-- Q.2 Show the Floor value of each eomployee salary divided by 7 
select ename, sal, floor(sal/7) as floor_value from data ; 
-- Alternate non gpt 


-- 	Q.3 dISPLAY HE  SQUARE ROOT OF EACH EMOLOYEES SALARY 
SELECT ename, sal, SQRT(sal) AS sqrt_salary FROM data;
select sqrt(sal) from data ; 

-- Q.4 Show the square power of 2 of each employee salary
select ename,sal, POWER(sal,2) as square_salary from data; 
select POWER(sal,2) from data ; 

-- Q.5 Display the value of pi for every row ; 
 select *, PI() from data ; 


-- Q.6 Show eomployee names and calculate : salary x commission ; 
select ename, (sal*comm) as sum from data ; 

-- ---------------------------------------------------Date Function Questions------------------------------------------------------
-- Q.1 Display Each employee's name and their Hire date. 
select ;



-- <----------------------------------------------------DAY 3 Multi Row Functions----------------------------------------------------------> 

-- Q.1 Count the number employee for each job title and sort results alphabetically 
select job,count(*) as T_count from data group by job order by job asc; 

-- Q.2 Calculate the total salary 
select deptno,sum(sal) as total_sal from data 
group by deptno 
order by total_sal desc ; 

-- Q.3 Find the average comission for employees who earn comission ; 
select deptno,avg(comm) as total from data where comm is not null group by deptno ; 

-- --------------------------------------------------------CREATING TABLE DEPT -------------------------------------------------------------
create table dept(
deptno int, 
dname varchar(50),
loc varchar(50)); 

insert into dept values(
10,'Accounting','NewYork'),
(20,'Research','Dallas'),
(30,'Sales','chicago'),
(40,'Operations','boston'),
(50,'IT','Mumbai'); 

select * from dept; 

-- Q.1 Count the number of departments located in each city (LOC) 
Select loc, count(*) AS dept_count from dept group by loc; 

-- Q.2 List all departments names (DNAME) and their lengths (number of Characters) Order by name Length 


-- =============================== DAY 4 to do 
Select * from data 
where empno in ( select mgr 
				from emp 
                where ename = 'SMITH');
                
