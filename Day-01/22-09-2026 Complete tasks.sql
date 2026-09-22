-- ================================================STORED PROCEDURE 22-09-2026===================================
delimiter // 
create procedure display()
begin 
select * from employee ; 
end // 
delimiter ; 

call display(); 

-- Q.1 Show employee salary (Create a procedure show_salary that takes employee num as input and display sal ); 
delimiter // 
create procedure show_salary(in no int)
begin 
select sal from employee 
where empno = no ; 
end// 
delimiter ; 
call show_salary(7369); 

-- Q.2 Count employees in a dept create procedure count_emp that : accetps depatment number : Display total employeees in that dept 
delimiter // 
create procedure count_emp(in deptnum int)
begin 
select count(empno)
from employee 
where deptno = deptnum ; 
end // 
delimiter ; 

call count_emp(30); 

-- Q.3 Increase Salary 
  delimiter // 
  create procedure increase_sal(in e_num int )
  begin 
  update employee 
  set sal = sal+(sal*10/100) 
  where empno = e_num; 
  end //
  delimiter ; 
  
call display(); 
  call increase_sal(7499); 
call display(); 

delimiter // 
create procedure showsal(in no int, out salary decimal(10,2))
begin 
select sal into salary 
from employee 
where empno = no ; 
end // 
delimiter ; 

call showsal(7499,@sal); 
select @sal; 

-- ========================================================Allocated Task 22-09-2026 =======================================
-- Q.1 Create a procedure transfer_emp that accepts empno and new deptno updates the deptno of emp 
delimiter // 
create procedure Transfer_emp(in no int,in new_deptno int)
begin 
update employee 
set deptno = new_deptno
where empno = no ; 
end //
delimiter ; 

call display(); 
call Transfer_emp(7369,30); 

-- Q.2 Create a procedure dept_total_sal that : accepts dept no displays total sal of that dept 
delimiter // 
create procedure dept_total_sall(in in_deptno int)
begin
select sum(sal) from employee 
where deptno = in_deptno; 
end // 
delimiter ; 

call dept_total_sall(30); 

-- Q.3 Annual Salary calculation create procedure annual_sal that accepts emp no calculates annual sal(sal*12+comm)
delimiter // 
create procedure annual_sall(in in_empno int)
begin 
select sal,sal*12+comm from employee 
where empno = in_empno ; 
end // 
delimiter ; 

call display(); 
call annual_sall(7369); 

-- Q.4 Add new Employee Create procedure add_emp that inserts a new employee into emp table parameters: empno ename job sal deptno 
call display();

delimiter // 
create procedure add_empp(in empno int,in ename varchar(50),in job varchar(50),in sal int,in deptno int)
begin 
insert into employee (empno,ename,job,sal,deptno)
values
(empno,ename,job,sal,deptno);
end // 
delimiter ; 

call add_empp(2,'Sujit','Analyst',300000,30); 

