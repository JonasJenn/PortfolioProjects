SELECT * 
FROM Jentech.COVIDDataforEurope;

-- Find the Death Percentage in each country
SELECT date_reported, Location, total_cases, Total_deaths, (total_deaths/total_cases)*100 AS Death_Percentage
FROM Jentech.COVIDDataforEurope
ORDER BY 1,2;

-- Percentage of Population with Covid in each country
SELECT date_reported, Location, total_cases, population2020, (total_cases/population2020)*100 AS Percentage_of_population_Infected
FROM Jentech.COVIDDataforEurope
ORDER BY location;

-- Countries with the Highest Infection Count compared to Population
SELECT Location, MAX(total_cases) AS Highest_Infection_Count, population2020, ((MAX(total_cases)/population2020))*100 AS Percentage_of_population_Infected
FROM Jentech.COVIDDataforEurope
GROUP BY location, population2020
ORDER BY Highest_Infection_Count desc;

-- Countries with the Highest Deaths Count per Population
SELECT Location, MAX(total_deaths) AS Highest_Death_Count
FROM Jentech.COVIDDataforEurope
GROUP BY location
ORDER BY Highest_Death_Count desc;

-- Creating views for visualizations in Tableau
Create View Death_Percentage AS
SELECT date_reported, Location, total_cases, Total_deaths, (total_deaths/total_cases)*100 AS Death_Percentage
FROM Jentech.COVIDDataforEurope;

Create View Highest_Death_Count AS 
SELECT Location, MAX(total_deaths) AS Highest_Death_Count
FROM Jentech.COVIDDataforEurope
GROUP BY location;

Create View Highest_Infection_Count AS 
SELECT Location, MAX(total_cases) AS Highest_Infection_Count, population2020, ((MAX(total_cases)/population2020))*100 AS Percentage_of_population_Infected
FROM Jentech.COVIDDataforEurope
GROUP BY location, population2020;
