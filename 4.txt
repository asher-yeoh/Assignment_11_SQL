SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

SELECT name FROM world
WHERE continent= 'Europe '
AND gdp/population >
(SELECT gdp/population FROM world
WHERE name='United Kingdom')

SELECT name, continent FROM world
WHERE continent in (
SELECT continent FROM world
where name in ('Argentina', 'Australia')
)
ORDER BY name

SELECT name, population FROM world
WHERE population > (
SELECT population FROM world
where name in ('Canada ')
)
AND population < (
SELECT population FROM world
where name in ('Poland')
)

SELECT name,
CONCAT((ROUND((population/(SELECT population FROM world WHERE name IN ('Germany')))*100, 0)),'%')
FROM world
WHERE continent in ('Europe')

SELECT name
FROM world
WHERE GDP > ALL(
SELECT GDP
FROM world
WHERE GDP > 0
AND continent IN ('Europe')
)

SELECT continent, name, area FROM world x
WHERE area >= ALL(
SELECT area FROM world y
WHERE x.continent = y.continent
AND area > 0
)

SELECT continent, name FROM world x
WHERE name <= ALL(
SELECT name FROM world y
WHERE x.continent = y.continent
)

SELECT name, continent, population FROM world
WHERE continent IN (
SELECT continent FROM world x
WHERE 25000000 >= ALL(
SELECT population FROM world y
WHERE x.continent = y.continent
AND y.population > 0
)
)

SELECT name, continent FROM world x
WHERE population > ALL(
SELECT (population*3) FROM world y
WHERE x.continent = y.continent
AND population > 0
AND x.name <> y.name
)
