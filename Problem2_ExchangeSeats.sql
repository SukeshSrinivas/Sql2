# Write your MySQL query statement below
WITH CTE AS (SELECT *, MAX(id) OVER () AS TotalStudents, CASE 
WHEN id % 2 = 0 THEN 'even' ELSE 'odd' END AS 'oddcheck' 
FROM seat)

SELECT CTE.id, CASE 
WHEN CTE.oddcheck='odd' AND CTE.id <> CTE.TotalStudents THEN 
 LEAD(CTE.student,1,0) OVER (Order by id) 
WHEN CTE.oddcheck='even' THEN 
 LAG(CTE.student,1,0) OVER (Order by id) 
 ELSE CTE.student END AS student
 FROM CTE

/*
Alternative Learned from Web
SELECT 
    id,
    CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
        ELSE COALESCE(LEAD(student) OVER(ORDER BY id), student)
    END AS student
FROM Seat
*/