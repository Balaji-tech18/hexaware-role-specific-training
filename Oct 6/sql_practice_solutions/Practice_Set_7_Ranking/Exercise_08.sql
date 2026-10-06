WITH RankedPerformance AS (
    SELECT *, RANK() OVER (PARTITION BY team ORDER BY calls_handled DESC) AS rnk 
    FROM call_performance
)
SELECT * 
FROM RankedPerformance 
WHERE rnk <= 3;
