SELECT id, title
FROM movie
WHERE yr = 1962

SELECT yr
FROM movie
WHERE title IN ('Citizen Kane')

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

SELECT id
FROM actor
WHERE name IN ('Glenn Close')

SELECT id
FROM movie
WHERE title IN ('Casablanca')

SELECT a.name
FROM casting c JOIN actor a ON (c.actorid = a.id)
WHERE c.movieid IN (
SELECT id
FROM movie
WHERE movieid = 11768
)

SELECT a.name
FROM casting c JOIN actor a ON (c.actorid = a.id)
WHERE c.movieid IN (
SELECT id
FROM movie
WHERE title = 'Alien'
)

SELECT m.title
FROM casting c JOIN movie m ON (c.movieid = m.id)
WHERE c.actorid IN (
SELECT id
FROM actor
WHERE name = 'Harrison Ford'
)

SELECT m.title
FROM casting c JOIN movie m ON (c.movieid = m.id)
WHERE c.actorid IN (
SELECT id
FROM actor
WHERE name = 'Harrison Ford'
)
AND c.ord <> 1

SELECT m.title, a.name
FROM casting c
JOIN movie m ON (c.movieid = m.id)
JOIN actor a ON (c.actorid = a.id)
WHERE c.ord = 1
AND m.yr IN ('1962')

SELECT m.yr, COUNT(m.title) AS 'movies'
FROM casting c
JOIN movie m ON (c.movieid = m.id)
JOIN actor a ON (c.actorid = a.id)
WHERE a.name = 'John Travolta'
GROUP BY m.yr
HAVING COUNT(m.title) >= 3

SELECT m.title, a.name
FROM casting c
JOIN movie m ON (c.movieid = m.id)
JOIN actor a ON (c.actorid = a.id)
WHERE m.id IN (
SELECT m.id FROM casting c
JOIN movie m ON (c.movieid = m.id)
JOIN actor a ON (c.actorid = a.id)
WHERE a.name IN ('Julie Andrews')
)
AND c.ord = 1

SELECT a.name
FROM casting c
JOIN actor a ON (c.actorid = a.id)
WHERE c.ord = 1
GROUP BY a.name
HAVING COUNT(c.movieid) >= 30

SELECT m.title, count(c.actorid) AS 'actors'
FROM casting c
JOIN movie m ON (c.movieid = m.id)
WHERE m.yr = '1978'
GROUP BY m.title
ORDER BY count(c.actorid) DESC, m.title

SELECT DISTINCT a.name
FROM casting c
JOIN actor a ON (c.actorid = a.id)
WHERE c.movieid IN (
SELECT c.movieid FROM casting c
JOIN movie m ON (c.movieid = m.id)
JOIN actor a ON (c.actorid = a.id)
WHERE a.name IN ('Art Garfunkel')
)
AND a.name <> 'Art Garfunkel'

