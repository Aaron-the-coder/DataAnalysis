/*
	Procedure
*/

create procedure Test
as
select * from EmployeeDemographics

exec Test

GO
IF OBJECT_ID(N'[dbo].[Temp_Employee_Procedure1]',N'P') IS NOT NULL
    DROP PROCEDURE [dbo].[Temp_Employee_Procedure1]
GO
create procedure Temp_Employee_Procedure1
(@Gender1 varchar(50))
as 
create table #Temp_Employee2(
	EmployeeID int, 
	FirstName varchar(50),
	LastName varchar(50),
	Gender varchar(50),
	TotalGender int,
	AverageSalary int
)

insert into #Temp_Employee2
select Demo.EmployeeID,Demo.FirstName, Demo.LastName, Demo.gender, COUNT(Demo.Gender) over (partition by Demo.Gender) as TotalGender, AVG(Salary) over (partition by Salary) as AVGSalary
from SQLTutorial..EmployeeDemographics Demo
join SQLTutorial..EmployeeSalary Sal
on Demo.EmployeeID = Sal.EmployeeId

select * from #Temp_Employee2

EXEC Temp_Employee_Procedure1 @Gender1 = 'Female' --TODO This parameter doesn't work. Need to figure out the reason