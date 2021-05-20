-- List the films where the yr is 1962 [Show id, title] 
SELECT id, title
 FROM movie
 WHERE yr=1962

-- Give year of 'Citizen Kane'. 
SELECT yr 
FROM movie
WHERE title = 'Citizen Kane'

-- Star Trek movies
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- What id number does the actor 'Glenn Close' have? 
SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- What is the id of the film 'Casablanca' 
SELECT id
FROM movie
WHERE title = 'Casablanca' 

-- Cast list for Casablanca
SELECT name
FROM actor Join casting ON (id = actorid)
WHERE movieid = 11768

-- Alien cast list
SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
           JOIN movie ON (movie.id = casting.movieid)
WHERE title= 'Alien' 

-- List the films in which 'Harrison Ford' has appeared 
SELECT title
FROM movie JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE actor.name =  'Harrison Ford'

-- Harrison Ford as a supporting actor
SELECT title
FROM movie JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE actor.name =  'Harrison Ford' AND casting.ord <> 1

-- Lead actors in 1962 movies
SELECT title, name
FROM movie JOIN casting ON movie.id = casting.movieid
           JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962 AND ord =1

--  show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- List the film title and the leading actor for all of the films 'Julie Andrews' played in. 
SELECT title, actor.name
FROM movie JOIN casting ON movie.id = casting.movieid
          JOIN actor ON actor.id = casting.actorid
WHERE 'Julie Andrews' IN (
SELECT name  
FROM actor JOIN casting c ON actor.id = c.actorid
WHERE movie.id = c.movieid 
)AND casting.ord = 1

-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. 
SELECT name 
FROM actor JOIN casting ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY name
HAVING COUNT(*)>=15

-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title. 
SELECT title, COUNT(actorid)
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title


