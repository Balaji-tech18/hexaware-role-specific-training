SELECT *, RANK() OVER (PARTITION BY team ORDER BY calls_handled DESC) AS team_rank 
FROM call_performance;
