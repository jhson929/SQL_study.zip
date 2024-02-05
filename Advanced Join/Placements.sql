SELECT S.name
FROM Students AS S
    JOIN Packages AS P1 ON S.id = P1.id
    JOIN Friends AS F ON S.id = F.id
    JOIN Packages AS P2 ON F.friend_id = P2.id
WHERE P1.salary < P2.salary
ORDER BY P2.salary
