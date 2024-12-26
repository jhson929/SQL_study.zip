-- 최소 3번 이상 감독에게 협조한 배우들의 (배우, 감독) 쌍
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >= 3
