SELECT *, DENSE_RANK() OVER (ORDER BY calls_handled DESC) AS dense_rank_num 
FROM call_performance;
