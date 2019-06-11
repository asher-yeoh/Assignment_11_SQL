SELECT name FROM world
WHERE name LIKE 'Y%'

SELECT name FROM world
WHERE name LIKE '%Y'

SELECT name FROM world
WHERE name LIKE '%x%'

SELECT name FROM world
WHERE name LIKE '%land'

SELECT name FROM world
WHERE name LIKE 'C%'
AND name LIKE '%ia'

SELECT name FROM world
WHERE name LIKE '%oo%'

SELECT name FROM world
WHERE name LIKE '%a%a%a%'

SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
WHERE name LIKE '%o__o%'

SELECT name FROM world
WHERE name LIKE '____'

SELECT name
FROM world
WHERE name = capital

SELECT name
FROM world
WHERE capital LIKE '%City'
AND concat(name, ' City') =  capital

SELECT capital, name
FROM world
WHERE capital like (concat('%', name, '%'))

SELECT capital, name
FROM world
WHERE capital like (concat('%', name, '%'))
AND capital <> name

SELECT name, REPLACE (capital, name, '') AS 'extension'
FROM world
WHERE capital like (concat('%', name, '%'))
AND capital <> name