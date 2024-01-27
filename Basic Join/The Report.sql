SELECT IF(G.grade >= 8, S.name, NULL)
     , G.grade
     , S.marks
FROM Students AS S
    JOIN Grades AS G ON S.marks BETWEEN G.min_mark AND G.max_mark
ORDER BY G.grade DESC, S.name ASC, S.marks ASC
