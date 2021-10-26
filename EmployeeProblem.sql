--Uc-1
create database PayRoll;

--use database
use PayRoll;

--Uc-2 create a table for PayRoll
create table emp_payroll(
id int primary key,
name varchar(100),
salary int,
start_date Date
);

--Uc-3 Insert Data
insert into emp_payroll
values (10,'Ganesh',40000,'1/7/2021')

insert into emp_payroll
values(12,'David',70000,'1/3/2019')

--Uc-4 Show Table 
select * from emp_payroll;

--Uc-5 Insert More data
insert into emp_payroll values (18,'Nutan',81000,'2019/10/10'),
(20,'Bharati',100000,'2017/02/08');

--Printing data of a perticular empolyee(where condition)
select * from emp_payroll where name = 'David'; 

--searching name and salary for people how join from 2018-01-01
select name,salary from emp_payroll where start_date between CAST('2018-01-01' AS date) and GETDATE();

--Uc-6 add gender
Alter table emp_payroll add gender char;

update emp_payroll set gender='M' where name='Ganesh' or name='David';
update emp_payroll set gender='F' where name='Nutan' or name='Bharati';
Select * from emp_payroll;

--Uc-7
--Average Salary
select AVG(salary) from emp_payroll;
--Sum of Salary
select SUM(salary) from emp_payroll;
--Minimum of Salary
select MIN(salary) from emp_payroll;
--Maximum of Salary
select MAX(salary) from emp_payroll;
--Count
select COUNT(salary) from emp_payroll;
-- Group by 
--Total female salary
select SUM(salary) from emp_payroll
where gender = 'F' group by gender;
--Total male salary
select SUM(salary) from emp_payroll
where gender = 'M' group by gender;

--Uc-8
--Adding address,phone_no,dept
Alter table emp_payroll add address varchar(255) default 'Mumbai'; 
Alter table emp_payroll add phone_no varchar(255);
Alter table emp_payroll add dept varchar(255) not null default 'Adv. Dept';
select * from emp_payroll;

--Uc-9
Alter table emp_payroll add basicPay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float;

--Uc-10 Add Two Employee Having same name but different Dept.
insert into emp_payroll values
(90,'Terisa',3000000, '2018-01-03' , 'F','New York',9922003699,'Marketting',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00)
, (91,'Terisa',3000000, '2018-01-03' , 'F','New York',9034001654,'Sales',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00);
select * from emp_payroll where name='Terisa';

--Uc-11 Create Tables
create table Company(
CmpID int identity(1,1) PRIMARY KEY,
CmpName varchar(100) not null);

create table Department(
DepartmentID int identity(1,1) PRIMARY KEY,
DepartmentName varchar(100) not null);

create table employee(
ID int identity(1,1) PRIMARY KEY,
EmployeeName varchar(100) NOT NULL,
EmployeePhoneNumber int not null,
EmployeeAddress varchar(255),
EmployeeGender char(1),
CompanyID int,
Foreign key(CompanyID) REFERENCES employee(id)
);

create table Payment(
PaymentID int identity(1,1) PRIMARY KEY,
EmployeeID int,
basicPay float, 
Deduction float, 
TaxablePay float, 
IncomeTax float, 
NetPay float
Foreign key(EmployeeID) REFERENCES employee(id)
);

create table EmployeeDepartment(
EmployeeID int,
DepartmentID int,
Foreign key(EmployeeId) REFERENCES employee(id),
Foreign key(DepartmentID) REFERENCES Department(DepartmentID)
);