-- |x1-x2| - |y1-y2|
SELECT ROUND(ABS(MIN(lat_n) - MAX(lat_n) - ABS(MIN(long_w) - MAX(long_w))), 4)
FROM station
