/*
	Having clause
*/
--Get the jobtitle with an average salary over 47000
select JobTitle, AVG(Salary)
from EmployeeSalary
--An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.
--where AVG(Salary) >47000
group by JobTitle
having AVG(Salary) >47000
order by AVG(Salary)