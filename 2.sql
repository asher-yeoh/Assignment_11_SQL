SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population >= '200000000'

SELECT name, gdp/population AS 'per_capita_GDP' FROM world
WHERE population >= '200000000'

SELECT name, population/1000000 AS 'population in millions' FROM world
WHERE continent = 'South America'

SELECT name, population FROM world
where name in ('France', 'Germany', 'Italy')

SELECT name FROM world
where name like '%United%'

SELECT name, population, area FROM world
where (
area  > '3000000'
OR
population > '250000000'
)

SELECT name, population, area FROM world
where (
area  > '3000000'
XOR
population > '250000000'
)

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) FROM world
where continent = 'South America'

SELECT name, ROUND(gdp/population, -3) AS 'per_capita_GDP' FROM world
where gdp >= '1000000000000'

SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital FROM world
where LEFT(name,1) = LEFT(capital,1)
and name <> capital

SELECT name FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
and name not like '% %'
