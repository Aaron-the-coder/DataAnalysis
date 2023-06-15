/*
	update/delete statement
*/
select * from EmployeeDemographics
-- update statement
update EmployeeDemographics
set EmployeeID = 1012
where FirstName = 'Holly' and LastName = 'Flax'

-- delete statement
--select * -- in case of any mistakes, we'd better query the data we want to delete first
delete -- then we replace the "select *" with "delete". This time we will exactly delete our target raw
from EmployeeDemographics
where EmployeeID=1005