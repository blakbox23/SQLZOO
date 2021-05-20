-- SELECT BASICS
-- Population of Germany
SELECT population FROM world
  WHERE name = 'Germany'

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Just the right size
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

  