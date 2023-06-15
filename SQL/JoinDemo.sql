/*
	Inner join; Full/left/right outer join
*/

--select * from EmployeeDemographics

--select * from EmployeeSalary

--select * from EmployeeDemographics
--Inner join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId
--full outer join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId
--left outer join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId
--right outer join EmployeeSalary on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId

--select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--from EmployeeDemographics
--inner join EmployeeSalary
--left outer join EmployeeSalary
--right outer join EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId

-- use case 1: get the employee info with highest salary except Aaron
--select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--from EmployeeDemographics
--inner join EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId
--where FirstName <> 'Aaron' and EmployeeSalary.Salary > 47000
--order by Salary DESC

-- use case 2: get the average salary of the salesman
select EmployeeSalary.JobTitle, AVG(EmployeeSalary.Salary)
from EmployeeSalary
where JobTitle = 'salesman'
group by JobTitle