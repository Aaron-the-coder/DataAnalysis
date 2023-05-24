/*
	Temp table: similar to creating tables, but not really exists in the database
*/
drop table if exists #temp_employee1
create table #temp_employee1(
	EmployeeID int,
	JobTitle varchar(50),
	Salary int
)

select * from #temp_employee1

insert into #temp_employee1
select * from SQLTutorial..EmployeeSalary

drop table if exists #temp_employee2
create table #Temp_Employee2(
	EmployeeID int, 
	FirstName varchar(50),
	LastName varchar(50),
	Gender varchar(50),
	TotalGender int,
	AverageSalary int
)

select * from #Temp_Employee2

insert into #temp_employee2
select Demo.EmployeeID,Demo.FirstName, Demo.LastName, Demo.gender, COUNT(Demo.Gender) over (partition by Demo.Gender) as TotalGender, AVG(Salary) over (partition by Salary) as AVGSalary
from SQLTutorial..EmployeeDemographics Demo
join SQLTutorial..EmployeeSalary Sal
on Demo.EmployeeID = Sal.EmployeeId