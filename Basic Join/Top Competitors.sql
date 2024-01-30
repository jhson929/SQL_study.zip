SELECT S.hacker_id
      ,H.name
FROM Submissions AS S
    JOIN Challenges AS C ON S.challenge_id = C.challenge_id
    JOIN Difficulty AS D ON C.difficulty_level = D.difficulty_level
    JOIN Hackers AS H ON S.hacker_id = H.hacker_id
WHERE D.score = S.score
GROUP BY S.hacker_id, H.name
HAVING COUNT(S.challenge_id) >= 2
ORDER BY COUNT(S.challenge_id) DESC, S.hacker_id ASC

/*
1. 제출이력 테이블과 문제테이블 Join -> 문제의 난이도를 함께 작성
2. 문제 테이블과 난이도 테이블 Join -> 난이도별 최고점수 작성
3. 난이도 테이블의 score와 제출이력 테이블의 score를 비교해서 같은거 필터링 (full score 받은 데이터만)
4. 제출이력 테이블의 hacker_id, 해커 테이블의 name으로 group by 묶고, full score 받은 문제 갯수 집계
5. 2개 이상인 것만 having 필터링
6. full socre 받은 총 문제 수로 DESC
7. hacker_id ASC 
*/
