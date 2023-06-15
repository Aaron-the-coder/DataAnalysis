/*
	Case statement
*/

select EmployeeID, FirstName, Age,
CASE
	when age = 31 then 'Tom'
	WHEN age > 32 THEN 'old'
	WHEN age BETWEEN 27 and 32 THEN 'young'
	ELSE 'kid'
END
from EmployeeDemographics
where age is not null
order by age

-- give salesman a 10% pay raise
-- Accountant 5%
-- HR 1%
-- others 3%
select EmployeeSalary.EmployeeID, FirstName, JobTitle, Salary,
case 
	when JobTitle = 'salesman' then Salary*(1+0.1)
	when JobTitle = 'Accountant' then Salary*(1+0.5)
	when JobTitle = 'HR' then Salary*(1+0.01)
	else Salary*(1+0.03)
end as SalaryAfterRaise
from EmployeeDemographics
join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeId
