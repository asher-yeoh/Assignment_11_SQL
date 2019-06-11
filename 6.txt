SELECT matchid, player FROM goal 
WHERE teamid = 'GER'

SELECT id, stadium, team1, team2
FROM game 
where id IN ('1012')

SELECT go.player, go.teamid, ga.stadium, ga.mdate
FROM game ga JOIN goal go ON (ga.id = go.matchid)
WHERE go.teamid = 'GER'

SELECT ga.team1, ga.team2, go.player
FROM game ga JOIN goal go ON (ga.id = go.matchid)
WHERE go.player LIKE 'Mario%'

SELECT go.player, go.teamid, e.coach, go.gtime
FROM goal go JOIN eteam e ON (go.teamid = e.id)
WHERE go.gtime <= 10

SELECT ga.mdate, e.teamname
FROM game ga JOIN eteam e ON (ga.team1 = e.id)
WHERE e.coach IN ('Fernando Santos')

SELECT go.player
FROM goal go JOIN game ga ON (go.matchid = ga.id)
WHERE ga.stadium IN ('National Stadium, Warsaw')

SELECT DISTINCT go.player
FROM game ga JOIN goal go ON (ga.id = go.matchid)
WHERE (
team1 = 'GER'
OR
team2 = 'GER'
)
AND go.teamid <> 'GER'

SELECT e.teamname, COUNT(go.teamid) AS 'goals'
FROM eteam e JOIN goal go ON (e.id = go.teamid)
GROUP BY e.teamname

SELECT ga.stadium , COUNT(go.teamid) AS 'goals'
FROM game ga JOIN goal go ON (ga.id = go.matchid)
GROUP BY ga.stadium

SELECT go.matchid, ga.mdate, COUNT(go.teamid)
FROM goal go JOIN game ga ON (go.matchid = ga.id)
WHERE (
team1 = 'POL'
OR
team2 = 'POL'
)
GROUP BY go.matchid, ga.mdate

SELECT go.matchid, ga.mdate, COUNT(go.teamid) AS 'goals'
FROM goal go JOIN game ga ON (go.matchid = ga.id)
WHERE go.teamid = 'GER'
GROUP BY go.matchid, ga.mdate

SELECT ga.mdate, ga.team1,
SUM(CASE WHEN go.teamid = ga.team1
THEN 1 ELSE 0
END) AS 'score1',
ga.team2,
SUM(CASE WHEN go.teamid = ga.team2
THEN 1 ELSE 0
END) AS 'score2'
FROM game ga LEFT JOIN goal go ON (ga.id = go.matchid)
GROUP BY ga.mdate, ga.team1, ga.team2
ORDER BY ga.mdate, go.matchid, ga.team1, ga.team2