SELECT *, RANK() OVER (ORDER BY calls_handled DESC) AS call_rank 
FROM call_performance;
