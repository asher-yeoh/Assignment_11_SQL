SELECT COUNT(*)
FROM stops

SELECT id
FROM stops
WHERE name IN ('Craiglockhart')

SELECT id, name
FROM stops s JOIN route r ON (s.id = r.stop)
WHERE num IN ('4')
AND company IN ('LRT')

SELECT company, num, COUNT(*)
FROM route
WHERE (
(stop = 149)
OR
(stop = 53)
)
GROUP BY company, num
HAVING COUNT(*) = 2

SELECT ra.company, ra.num, ra.stop, rb.stop
FROM route ra JOIN route rb ON (ra.company = rb.company AND ra.num = rb.num)
WHERE ra.stop = 53
AND rb.stop = 149

SELECT ra.company, ra.num, sa.name, sb.name
FROM route ra
JOIN route rb ON (ra.company = rb.company AND ra.num = rb.num)
JOIN stops sa ON (ra.stop = sa.id)
JOIN stops sb ON (rb.stop = sb.id)
WHERE sa.name = 'Craiglockhart'
AND sb.name = 'London Road'

SELECT DISTINCT ra.company, ra.num
FROM route ra
JOIN route rb ON (ra.company = rb.company AND ra.num = rb.num)
JOIN stops sa ON (ra.stop = sa.id)
JOIN stops sb ON (rb.stop = sb.id)
WHERE ra.stop = 115
AND rb.stop = 137

SELECT DISTINCT ra.company, ra.num
FROM route ra
JOIN route rb ON (ra.company = rb.company AND ra.num = rb.num)
JOIN stops sa ON (ra.stop = sa.id)
JOIN stops sb ON (rb.stop = sb.id)
WHERE sa.name = 'Craiglockhart'
AND sb.name = 'Tollcross'

SELECT DISTINCT sb.name, ra.company, ra.num
FROM route ra
JOIN route rb ON (ra.company = rb.company AND ra.num = rb.num)
JOIN stops sa ON (ra.stop = sa.id)
JOIN stops sb ON (rb.stop = sb.id)
WHERE sa.name = 'Craiglockhart'

/* Question 10: Unable to solve this question, only managed to find the routes from/to Craiglockhart and Lochend, respectively. */
-- Draft:
SELECT * from route
WHERE num in (
SELECT ra.num
FROM route ra join stops sa ON (ra.stop = sa.id) 
WHERE ra.stop in (
SELECT rb.stop
FROM route rb join stops sb ON (rb.stop = sb.id) 
WHERE sb.name in ('Craiglockhart')
)
)
ORDER by 1

SELECT * from route
WHERE num in (
SELECT ra.num
FROM route ra join stops sa ON (ra.stop = sa.id) 
WHERE ra.stop in (
SELECT rb.stop
FROM route rb join stops sb ON (rb.stop = sb.id) 
WHERE sb.name in ('Lochend')
)
)
ORDER by 1
