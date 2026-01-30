-- Use "World " Database to solve the following questions 
-- (Hint : World Database is inbuilt in SQL Workbench so use code “use world;” to make use of the database)

use world ;

-- Question 1: Count how many cities are there in each country?
SELECT CountryCode, COUNT(*) AS TotalCities
FROM city
GROUP BY CountryCode;

-- Question 2 : Display all continents having more than 30 countries.
SELECT Continent, COUNT(*) AS TotalCountries
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30;

-- Question 3 : List regions whose total population exceeds 200 million.
SELECT Region, SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;

-- Question 4: Find the top 5 continents by average GNP per country.
SELECT Continent, AVG(GNP) AS AvgGNP
FROM country
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;

-- Question 5 : Find the total number of official languages spoken in each continent
SELECT c.Continent, COUNT(cl.Language) AS OfficialLanguages
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

-- Question 6 : Find the maximum and minimum GNP for each continent
SELECT Continent, MAX(GNP) AS MaxGNP, MIN(GNP) AS MinGNP
FROM country
GROUP BY Continent;

-- Question 7 : Find the country with the highest average city population.
SELECT c.Name AS CountryName, AVG(ci.Population) AS AvgCityPopulation
FROM country c
JOIN city ci ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

-- Question 8 : List continents where the average city population is greater than 200,000.
SELECT c.Continent, AVG(ci.Population) AS AvgCityPop
FROM country c
JOIN city ci ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
SELECT Continent, SUM(Population) AS TotalPop, AVG(LifeExpectancy) AS AvgLifeExp
FROM country
GROUP BY Continent
ORDER BY AvgLifeExp DESC;

-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 milli
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExp, SUM(Population) AS TotalPop
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExp DESC
LIMIT 3;


