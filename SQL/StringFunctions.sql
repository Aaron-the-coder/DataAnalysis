CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM
	SELECT EmployeeID, TRIM(EmployeeID) -- trim
	FROM EmployeeErrors

	SELECT EmployeeID, LTRIM(EmployeeID)--LTRIM
	FROM EmployeeErrors

	SELECT EmployeeID, RTRIM(EmployeeID) --RTRIM
	FROM EmployeeErrors
-- Using Replace
	SELECT LastName, REPLACE(LastName, ' - Fired','') ReplacedName
	FROM EmployeeErrors
-- Using Substring
	-- substring can be used to do fuzzy marching
	select demo.FirstName, SUBSTRING(demo.FirstName,1,3) SubDemoName, err.FirstName, SUBSTRING(err.FirstName,1,3) SubErrName
	from EmployeeDemographics demo
	join EmployeeErrors err
	on SUBSTRING(demo.FirstName,1,3) = SUBSTRING(err.FirstName,1,3) -- substring the first three letters in the firstname

	select demo.FirstName, SUBSTRING(demo.FirstName,LEN(demo.FirstName)-2,3) SubDemoName, err.FirstName, SUBSTRING(err.FirstName,LEN(err.FirstName)-2,3) SubErrName
	from EmployeeDemographics demo
	join EmployeeErrors err
	on SUBSTRING(demo.FirstName,LEN(demo.FirstName)-2,3) = SUBSTRING(err.FirstName,LEN(err.FirstName)-2,3) -- substring the last three letters in the firstname
-- Using UPPER and lower
	SELECT FirstName, UPPER(FirstName) UpperFName, LastName, LOWER(LastName) LowerLName
	from EmployeeDemographics