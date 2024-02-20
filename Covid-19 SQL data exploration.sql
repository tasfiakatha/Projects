SELECT *
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date;

SELECT *
FROM PortfolioProject.dbo.CovidVaccinations
WHERE continent IS NOT NULL
ORDER BY location, date;

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date;


-- What is the probability of dying from Covid-19?
-- Total Deaths as % of Total Cases
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS total_deaths_perc
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date;


-- Total Deaths as % of Total Cases in United States
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS total_deaths_perc
FROM PortfolioProject.dbo.CovidDeaths
WHERE location = 'United States'
ORDER BY location, date;


-- What percentage of the population got infected with Covid-19?
-- Total Cases as % of Total Population
SELECT location, date, total_cases, population, (total_cases/population)*100 AS total_cases_perc
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY total_cases_perc desc;


-- Total Cases as % of Total Population in United States
SELECT location, date, total_cases, population, (total_cases/population)*100 AS total_cases_perc
FROM PortfolioProject.dbo.CovidDeaths
WHERE location = 'United States'
ORDER BY location, date;


-- Countries with highest infection rate 
SELECT location, population, MAX(total_cases) AS HighestTotalCase, (MAX(total_cases)/population)*100 AS HighestTotalCasePerc
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY HighestTotalCasePerc DESC;


--Countries with highest death count per population
SELECT location, MAX(CAST(total_deaths AS int)) AS HighestTotalDeath
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY HighestTotalDeath DESC;


--Continents with highest death count per population
SELECT continent, MAX(CAST(total_deaths AS int)) AS HighestTotalDeath
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HighestTotalDeath DESC;


-- Global death percentage 
SELECT date, SUM(new_cases) AS TotalCases, SUM(CAST(new_deaths AS int)) AS TotalDeaths, (SUM(CAST(new_deaths AS int)))/(SUM(new_cases))*100 AS DeathPercentage
FROM PortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date DESC;


-- Total percentage of population vaccinated 
-- Join both Covid deaths and Covid vaccinations tables. Create cumulative total count of daily new vaccinations 
-- Use CTE

WITH PopVsVacc(continent, location, date, population, new_vaccinations, CumulativeDailyVacc)
AS
(
SELECT cd.continent, cd.location, cd.date, population, new_vaccinations, 
  SUM(CONVERT(int, new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS CumulativeDailyVacc
FROM PortfolioProject.dbo.CovidDeaths AS cd
INNER JOIN PortfolioProject.dbo.CovidVaccinations AS cv
ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
)
SELECT *, (CumulativeDailyVacc/population)*100 AS PercDailyVacc
FROM PopVsVacc;


-- TEMP Table
DROP TABLE IF EXISTS #PercPopulationVaccinated
CREATE TABLE #PercPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255), 
date datetime, 
population int, 
new_vaccinations int,
CumulativeDailyVacc int
)

INSERT INTO #PercPopulationVaccinated
SELECT cd.continent, cd.location, cd.date, population, new_vaccinations, 
  SUM(CONVERT(int, new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS CumulativeDailyVacc
FROM PortfolioProject.dbo.CovidDeaths AS cd
INNER JOIN PortfolioProject.dbo.CovidVaccinations AS cv
ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL

SELECT *, (CumulativeDailyVacc/population)*100 AS PercDailyVacc
FROM #PercPopulationVaccinated
ORDER BY location, date;


-- Create view to store data for later visualizations
CREATE VIEW PercPopulationVaccinated AS
SELECT cd.continent, cd.location, cd.date, population, new_vaccinations, 
  SUM(CONVERT(int, new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS CumulativeDailyVacc
FROM PortfolioProject.dbo.CovidDeaths AS cd
INNER JOIN PortfolioProject.dbo.CovidVaccinations AS cv
ON cd.location = cv.location
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL;

SELECT *
FROM PortfolioProject.dbo.PercPopulationVaccinated;

