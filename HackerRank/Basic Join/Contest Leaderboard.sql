SELECT SS.hacker_id, H.name, SUM(SS.MX) AS total_score
FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS MX
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS SS
    JOIN Hackers H ON SS.hacker_id = H.hacker_id
GROUP BY SS.hacker_id, H.name
HAVING total_score != 0
ORDER BY total_score DESC, SS.hacker_id ASC
