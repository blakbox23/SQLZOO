-- How many stops are in the database. 
SELECT COUNT(*)
FROM stops 

-- Find the id value for the stop 'Craiglockhart' 
SELECT id 
FROM stops 
WHERE name = 'Craiglockhart' 

-- Give the id and the name for the stops on the '4' 'LRT' service. 
SELECT id, name
FROM route JOIN stops ON route.stop = stops.id
WHERE company = 'LRT' and num = '4'

-- 4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- 5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith') 
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b
ON a.num = b.num AND a.company = b.company
WHERE a.stop = 115 AND b.stop =137

-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross' 
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b
ON a.num = b.num AND a.company = b.company
WHERE stopsa.name = 'Craiglockhart' AND b.stop =137


