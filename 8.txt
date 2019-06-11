SELECT name
FROM teacher
WHERE dept IS NULL

SELECT t.name, d.name
FROM teacher t INNER JOIN dept d ON (t.dept = d.id)

SELECT t.name, d.name
FROM teacher t LEFT JOIN dept d ON (t.dept = d.id)

SELECT t.name, d.name
FROM teacher t RIGHT JOIN dept d ON (t.dept = d.id)

SELECT name,
COALESCE(mobile,'07986 444 2266') AS 'mobile'
FROM teacher

SELECT t.name,
COALESCE(d.name,'None') AS 'department'
FROM teacher t LEFT JOIN dept d ON (t.dept = d.id)

SELECT COUNT(id) AS 'teachers', COUNT(mobile) AS 'mobile_phones'
FROM teacher t

SELECT d.name AS 'department', COUNT(t.id) AS 'no_of_staffs'
FROM teacher t RIGHT JOIN dept d ON (t.dept = d.id)
GROUP BY d.name

SELECT t.name,
CASE WHEN t.dept = 1 OR t.dept = 2
THEN 'Sci'
ELSE 'Art'
END AS 'X'
FROM teacher t LEFT JOIN dept d ON (t.dept = d.id)

SELECT t.name,
CASE
WHEN t.dept = 1 OR t.dept = 2
THEN 'Sci'
WHEN t.dept = 3
THEN 'Art'
ELSE 'None'
END AS 'X'
FROM teacher t LEFT JOIN dept d ON (t.dept = d.id)
