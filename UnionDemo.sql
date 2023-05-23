select * from EmployeeDemographics
union all
select * from WarehouseEmployeeDemographics

select EmployeeDemographics.EmployeeID, FirstName, Age
from EmployeeDemographics
union
select EmployeeSalary.EmployeeId, EmployeeSalary.JobTitle, EmployeeSalary.Salary
from EmployeeSalary