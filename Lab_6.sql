
CREATE DATABASE Employee_075;
USE Employee_070;


CREATE TABLE dept(
    no INT PRIMARY KEY, 
    dname VARCHAR(20), 
    dloc VARCHAR(20)
);


CREATE TABLE employee(
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    mgr_no INT,
    hiredate VARCHAR(20), 
    sal FLOAT,
    no INT,
    FOREIGN KEY(no) REFERENCES dept(no)
);
CREATE TABLE incentives(
    empno INT, 
    date VARCHAR(20), 
    amt FLOAT,
    PRIMARY KEY(empno, date),
    FOREIGN KEY(empno) REFERENCES employee(empno)
);

CREATE TABLE project(
    pno INT PRIMARY KEY, 
    ploc VARCHAR(20),
    pname VARCHAR(20)
);

CREATE TABLE AssignedTo(
    empno INT, 
    pno INT,
    job_role TEXT, 
    PRIMARY KEY(empno, pno), 
    FOREIGN KEY(empno) REFERENCES employee(empno), 
    FOREIGN KEY(pno) REFERENCES project(pno)
);

INSERT INTO dept VALUES(1, "CSE", "Bengaluru");
INSERT INTO dept VALUES(2, "ECE", "Hyderabad");
INSERT INTO dept VALUES(4, "APPLE", "Delhi");
INSERT INTO dept VALUES(3, "Samsung", "Mumbai");

INSERT INTO employee VALUES(1, "Raju", 3, "23-05-2022", 36000, 3);
INSERT INTO employee VALUES(2, "Swati", 2, "01-04-2021", 40000, 5);
INSERT INTO employee VALUES(3, "Sneha", 1, "03-07-2021", 80000, 1);
INSERT INTO employee VALUES(4, "Raja", 3, "28-01-2021", 40000, 2);
INSERT INTO employee VALUES(5, "Gangu", 3, "28-08-2024", 10000, 3);

INSERT INTO incentives VALUES(1, "26-05-2021", 10000);
INSERT INTO incentives VALUES(2, "21-06-2021", 10000);
INSERT INTO incentives VALUES(3, "02-04-2024", 40000);
INSERT INTO incentives VALUES(4, "04-04-2024", 60000);
INSERT INTO incentives VALUES(5, "06-08-2024", 90000);


INSERT INTO project VALUES(1, "Bengaluru", "AB");
INSERT INTO project VALUES(2, "Mysore", "BC");
INSERT INTO project VALUES(3, "Mumbai", "DE");



INSERT INTO AssignedTo VALUES(1, 1, "Manager");
INSERT INTO AssignedTo VALUES(3, 2, "Employee");
INSERT INTO AssignedTo VALUES(3, 3, "Assistant Manager");



SELECT e.ename 
FROM Employee e, dept d
WHERE e.no = d.no 
AND d.dloc IN ('Bangalore', 'Mysore', 'Hyderabad');


SELECT e.empno
FROM Employee e
WHERE e.empno NOT IN (SELECT DISTINCT empno FROM Incentives);


SELECT e.ename, d.dname, p.ploc, a.job_role 
FROM Employee e 
JOIN dept d ON e.no = d.no 
JOIN AssignedTo a ON e.empno = a.empno 
JOIN project p ON a.pno = p.pno; 


-- WEEK 5 QUIRES 

-- 1) List all employees along with their project details (if assigned)
SELECT e.ename, d.dname, p.ploc, a.job_role 
FROM Employee e 
LEFT JOIN dept d ON e.no = d.no 
LEFT JOIN AssignedTo a ON e.empno = a.empno 
LEFT JOIN project p ON a.pno = p.pno; 

-- Find all employees who received incentives, along with the total incentive amount

select  e.ename , i.amt
from Employee e 
left JOIN incentives i on i.empno = e.empno;

-- Retrieve the project names and locations of projects with employees assigned as 'Manager'
select p.pname , e.ename as "Manager" , p.ploc as "Location"
from employee e , AssignedTo a
join project p on p.pno = a.pno 
where a.empno = e.empno  and a.job_role= "Manager";

-- List departments along with the number of employees in each department
select d.dname as "Department" , count(*)
from dept d , employee e 
where e.no = d.no
group by (e.no);

-- Find employees who have not been assigned to any project

select e.ename
from employee e 
where e.empno not in (select distinct a.empno from AssignedTo a );

-- List all employees along with their department names and location
select e.ename , d.dname , d.dloc
from employee e 
left join  dept d on d.no = e.no;

-- Retrieve the details of employees who work under a specific manager (e.g., manager with empno = 101)
select ename , e.no , mgr_no
from employee e 
where e.mgr_no = 3;

-- List all projects that have employees assigned and the number of employees on each project:

select p.pname , count(*)
from project p 
join AssignedTo a ON a.pno = p.pno
group by a.pno;

-- Find employees with the same manager and list their department details-- 
select e1.ename , e1.empno , d.dname , d.dloc
from employee e1 
join employee e2 on e1.mgr_no = e2.empno and e1.empno != e2.empno
join dept d on e1.no = d.no
order by e1.mgr_no;

-- List the total number of incentives given to each employee and the sum of incentives for each:


-- Retrieve all employees who have the role of 'Developer' on any project:

select e.ename , a.job_role 
from employee e , AssignedTo a
where e.empno = a.empno and a.job_role = "Developer";

-- Display the department-wise average salary of employees:
select d.dname , avg(e.sal) as "avg_salary"
from employee e 
join dept d on d.no = e.no
group by d.no
order by  avg(e.sal) desc ;