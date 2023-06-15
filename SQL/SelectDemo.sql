/*select statement
	*, Top, Distinct, Count, As, Max, min, average 
*/
--select Distinct(Gender) from EmployeeDemographics
--select top 3 * from EmployeeDemographics
--select * from EmployeeDemographics
--select count(LastName) as 'LastName amount' from EmployeeDemographics
--select MAX(Salary) as MaxSalary from EmployeeSalary
--select Min(Salary) as MinSalary from EmployeeSalary
select AVG(Salary) as AVGSalary from SQLTutorial.dbo.EmployeeSalary