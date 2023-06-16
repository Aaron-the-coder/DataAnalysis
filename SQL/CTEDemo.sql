/*
	CTEs: wrap up the result of a certain query so that we can use the result by refer to 
	CTE rather than query every time
*/

with CTE_Employee as
(select Demo.EmployeeID,Demo.FirstName, Demo.LastName, Demo.gender, COUNT(Demo.Gender) over (partition by Demo.Gender) as TotalGender, AVG(Salary) over (partition by Salary) as AVGSalary
from SQLTutorial..EmployeeDemographics Demo
join SQLTutorial..EmployeeSalary Sal
on Demo.EmployeeID = Sal.EmployeeId
)
select * from CTE_Employee