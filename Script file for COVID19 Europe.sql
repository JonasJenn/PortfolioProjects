-- Exploring COVID-19 deaths and infection counts of countries in Europe

-- Create table for csv file
CREATE TABLE COVID_19Deaths(
Date_Reported text,
Country_code varchar(50),
Continent varchar(50),
Location varchar(100),
Population2020 int,
total_cases int,
total_deaths int
);

-- Upload csv file into SQL
LOAD DATA INFILE 'C:\COVIDDataforEurope.csv'
INTO TABLE COVID_19deaths
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Explore table 
SELECT * 
FROM covid_19deaths;

-- Find the Death Percentage in each country
SELECT date_reported, Location, total_cases, Total_deaths, (total_deaths/total_cases)*100 AS Death_Percentage
FROM covid_19deaths
ORDER BY 1,2;

-- Percentage of Population with Covid in each country
SELECT date_reported, Location, total_cases, population2020, (total_cases/population2020)*100 AS Percentage_of_population_Infected
FROM covid_19deaths
ORDER BY location;

-- Countries with the Highest Infection Count compared to Population
SELECT Location, MAX(total_cases) AS Highest_Infection_Count, population2020, ((MAX(total_cases)/population2020))*100 AS Percentage_of_population_Infected
FROM covid_19deaths
GROUP BY location, population2020
ORDER BY Highest_Infection_Count desc;

-- Countries with the Highest Deaths Count per Population
SELECT Location, MAX(total_deaths) AS Highest_Death_Count
FROM covid_19deaths
GROUP BY location
ORDER BY Highest_Death_Count desc;

-- Creating views for visualizations in Tableau

Create View Death_Percentage AS
SELECT date_reported, Location, total_cases, Total_deaths, (total_deaths/total_cases)*100 AS Death_Percentage
FROM covid_19deaths;

Create View Highest_Death_Count AS 
SELECT Location, MAX(total_deaths) AS Highest_Death_Count
FROM covid_19deaths
GROUP BY location;

Create View Highest_Infection_Count AS 
SELECT Location, MAX(total_cases) AS Highest_Infection_Count, population2020, ((MAX(total_cases)/population2020))*100 AS Percentage_of_population_Infected
FROM covid_19deaths
GROUP BY location, population2020;
