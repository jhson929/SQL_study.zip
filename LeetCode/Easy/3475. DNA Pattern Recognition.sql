SELECT *
      ,IF(LEFT(dna_sequence, 3) = 'ATG', 1, 0) AS has_start
      ,IF(RIGHT(dna_sequence, 3) IN ('TAA', 'TAG', 'TGA'), 1, 0) AS has_stop
      ,IF(dna_sequence LIKE '%ATAT%', 1, 0) AS has_atat
      ,IF(dna_sequence LIKE '%GGG%', 1, 0) AS has_ggg 
FROM Samples
ORDER BY sample_id ASC

-- 정규표현식
SELECT
    *,
    dna_sequence REGEXP '^ATG' AS has_start,
    dna_sequence REGEXP 'TAA$|TAG$|TGA$' AS has_stop,
    dna_sequence REGEXP 'ATAT' AS has_atat,
    dna_sequence REGEXP 'GGG' AS has_ggg
FROM samples
ORDER BY sample_id
