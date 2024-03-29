SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
AND institution='Edinburgh Napier University'
AND subject='(8) Computer Science'
   
SELECT institution, subject
FROM nss
WHERE question='Q15'
AND score >= 100

SELECT institution, score
FROM nss
WHERE question='Q15'
AND subject='(8) Computer Science'
AND score < 50

SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject

SELECT subject, SUM(response*A_STRONGLY_AGREE/100)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject

SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response),0)
FROM nss
WHERE question='Q22'
AND subject IN ('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject

SELECT institution, ROUND(SUM(response*score)/SUM(response),0)
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution

SELECT institution, SUM(sample),
SUM(CASE 
WHEN subject = '(8) Computer Science' 
THEN sample ELSE 0
END) AS 'computing_students'
FROM nss
WHERE question='Q01'
AND (institution LIKE '%Manchester%')
GROUP BY institution