-- 1. List each country name where the population is larger than that of 'Russia'.
SELECT name 
FROM world
WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
  
-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name 
FROM world
WHERE continent = 'Europe' AND gdp/population >
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom') 

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name;

-- 4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT name, population 
FROM world WHERE population > 
(SELECT population FROM world WHERE name = 'United Kingdom') AND population < 
(SELECT population FROM world WHERE name = 'Germany');

-- 5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- Decimal places
-- Percent symbol %
SELECT name,
   CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name='Germany')),'%')
FROM world
WHERE continent='Europe'
;

-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name FROM world 
  WHERE gdp > ALL
   (SELECT gdp FROM world
    WHERE continent = 'Europe' 
      AND gdp IS NOT NULL) 

-- 7. 







