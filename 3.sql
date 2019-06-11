SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950
 
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
FROM nobel
WHERE yr >= 2000
and subject= 'Peace'

SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989
AND subject= 'Literature'

SELECT * FROM nobel
WHERE winner IN (
'Theodore Roosevelt',
'Woodrow Wilson',
'Jimmy Carter',
'Barack Obama'
)

SELECT winner FROM nobel
WHERE winner LIKE 'John%'

SELECT yr, subject, winner
FROM nobel
WHERE (
subject IN ('Physics')
AND yr IN ('1980')
)
OR
(
subject IN ('Chemistry ')
AND yr IN ('1984')
)

SELECT yr, subject, winner
FROM nobel
WHERE yr IN ('1980')
AND
subject NOT IN ('Chemistry')
AND
subject NOT IN ('Medicine')

SELECT yr, subject, winner
FROM nobel
WHERE (
subject IN ('Medicine')
AND yr < 1910
)
OR
(
subject IN ('Literature')
AND yr >= 2004
)

SELECT *
FROM nobel
WHERE winner IN ('PETER GRÜNBERG')

SELECT *
FROM nobel
WHERE winner IN ('EUGENE O''NEILL')

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc, winner

SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner