select * from PortfolioProjects..CovidVaccination
order by 3,4

select * from PortfolioProjects..CovidDeaths
where continent is not null
order by 3,4

-- select the data we are going to use
select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProjects..CovidDeaths
order by 1,2

--Looking at the total cases vs total deaths
--Get the likelihood of the death of COVID-19 in our country	
select location, date, total_cases, total_deaths, (CONVERT(DECIMAL(18,2), total_deaths)/CONVERT(DECIMAL(18,2), total_cases)) * 100 as 'deathRate(%)'
from PortfolioProjects..CovidDeaths
where location = 'Canada'
order by 1,2 DESC

--Looking at the total cases vs Population
--Show what percentage of population get covid
select location, date, total_cases, population, (CONVERT(DECIMAL(18,2), total_cases)/CONVERT(DECIMAL(18,2), population)) * 100 as 'infectRate(%)'
from PortfolioProjects..CovidDeaths
where location = 'Canada'
order by 1,2 DESC

--Looking at the locations with highest infection rate
select location, population, MAX(CONVERT(DECIMAL(18,2), total_cases)/CONVERT(DECIMAL(18,2), population) * 100) as 'infectRate(%)'
from PortfolioProjects..CovidDeaths
group by location, population
order by 3 DESC

--select location, CONVERT(DECIMAL(18,2), total_deaths)/CONVERT(DECIMAL(18,2), population) * 100 as 'deathRatePerPopulation(%)'
--from PortfolioProjects..CovidDeaths
----group by location
--order by 2 DESC

--Looking at the locations with the highest death count per population
select location, MAX(CONVERT(int, total_deaths)) 'TotalDeathCount'
from PortfolioProjects..CovidDeaths
where continent is not null
group by location
order by 2 DESC

--Looking at the continent with the highest death count per population
select location, MAX(CONVERT(int, total_deaths)) 'TotalDeathCount'
from PortfolioProjects..CovidDeaths
where continent is null
group by location
order by 2 DESC

--Global death rate history
select date, SUM(new_cases) TotalNewCases, SUM(new_deaths) TotalNewDeaths, SUM(new_deaths)/SUM(new_cases)*100 'NewDeathRate(%)'
from PortfolioProjects..CovidDeaths
where continent is not null
and new_cases is not null
and new_cases != 0
group by date 
order by date desc

--world death rate
select SUM(new_cases) TotalNewCases, SUM(new_deaths) TotalNewDeaths, SUM(new_deaths)/SUM(new_cases)*100 'NewDeathRate(%)'
from PortfolioProjects..CovidDeaths
where continent is not null
and new_cases is not null
and new_cases != 0