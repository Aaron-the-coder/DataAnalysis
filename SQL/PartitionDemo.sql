/*
	partition by statement
*/
-- with partition by, we can show multiple columns other than the aggregated one
select Demo.EmployeeID, Demo.FirstName,Demo.Gender, COUNT(Gender)
over (partition by Gender)
from SQLTutorial..EmployeeDemographics as Demo
full outer join SQLTutorial..EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeId

-- with group by, we can only show the collumn we agregated on
select Gender, COUNT(Gender)
from SQLTutorial..EmployeeDemographics as Demo
full outer join SQLTutorial..EmployeeSalary as Sal
on Demo.EmployeeID = Sal.EmployeeId
group by Gender