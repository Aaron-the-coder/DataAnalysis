/*
	Aliasing
*/
select * from EmployeeDemographics

select FirstName as FName
from EmployeeDemographics

select FirstName FName 
from EmployeeDemographics

-- set a alias for the combination of multiple columns
select FirstName+' '+LastName as FullName
from EmployeeDemographics

--Very simple and highly readable
select Demo.EmployeeID, Sal.Salary 
from EmployeeDemographics as Demo
join EmployeeSalary as Sal
on Sal.EmployeeId = Demo.EmployeeID
join WarehouseEmployeeDemographics
on Sal.EmployeeId = Demo.EmployeeID
