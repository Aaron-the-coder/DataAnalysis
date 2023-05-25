/*
	Procedure
*/

create procedure Test
as
select * from EmployeeDemographics

exec Test

create procedure Temp_Employee_Procedure1
as 
create table #Temp_Employee2(
	EmployeeID int, 
	FirstName varchar(50),
	LastName varchar(50),
	Gender varchar(50),
	TotalGender int,
	AverageSalary int
)

insert into #temp_employee2
select Demo.EmployeeID,Demo.FirstName, Demo.LastName, Demo.gender, COUNT(Demo.Gender) over (partition by Demo.Gender) as TotalGender, AVG(Salary) over (partition by Salary) as AVGSalary
from SQLTutorial..EmployeeDemographics Demo
join SQLTutorial..EmployeeSalary Sal
on Demo.EmployeeID = Sal.EmployeeId

select * from #Temp_Employee2

EXEC Temp_Employee_Procedure1 @Gender1 = 'Male' --TODO This parameter doesn't work. Need to figure out the reason