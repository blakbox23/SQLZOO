-- List the teachers who have NULL for their department. 
SELECT name
FROM teacher
WHERE dept IS NULL

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher. 
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- Use a different JOIN so that all teachers are listed. 
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id

-- Use a different JOIN so that all departments are listed. 
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id

-- Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266') 
FROM teacher

-- 6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id

-- Use COUNT to show the number of teachers and the number of mobile phones. 
SELECT COUNT(teacher.id), COUNT(mobile)
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id

-- 8.
SELECT dept.name, count(teacher.name)
FROM teacher RIGHT JOIN dept
ON teacher.dept = dept.id
GROUP BY dept.name;

-- 9.
SELECT teacher.name, CASE
WHEN dept IN (1,2) THEN 'Sci'
ELSE 'Art'  
END
FROM teacher

-- 10.
SELECT teacher.name, CASE 
                     WHEN dept IN (1,2) THEN 'Sci'
                     WHEN dept =  3 THEN 'Art'
                     ELSE 'None'
                     END
FROM teacher

