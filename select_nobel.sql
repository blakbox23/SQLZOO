--  Nobel prizes for 1950. 
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--  Show who won the 1962 prize for Literature. 
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- Show the year and subject that won 'Albert Einstein' his prize. 
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

-- Give the name of the 'Peace' winners since the year 2000, including 2000. 
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr LIKE '20%' 

-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. 
SELECT *
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject = 'Literature'

-- Show all details of the presidential winners: 
SELECT * FROM nobel
 WHERE winner IN ( 'Theodore Roosevelt',
                      'Woodrow Wilson',
                      'Jimmy Carter',
                      'Barack Obama'
                    )

-- Show the winners with first name John 
SELECT winner
FROM nobel
WHERE winner LIKE 'john %'

-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT *
FROM nobel
WHERE subject = 'Physics' AND yr ='1980' XOR
      subject = 'Chemistry' AND yr ='1984'

-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT *
FROM nobel
WHERE subject <> 'Chemistry' OR
      subject <> 'Medicine' AND
      yr = 1980

-- Early Medicine, Late Literature
SELECT *
FROM nobel
WHERE subject ='Medicine' AND yr < 1910 OR
      subject = 'Literature' AND yr >= 2004

-- Find all details of the prize won by PETER GRÜNBERG 
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- Find all details of the prize won by EUGENE O'NEILL 
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC, winner ASC;

-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
ORDER BY subject IN('Physics', 'Chemistry'), subject, winner;