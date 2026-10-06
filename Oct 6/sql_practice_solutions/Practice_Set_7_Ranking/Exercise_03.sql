SELECT *, RANK() OVER (ORDER BY calls_handled DESC) AS rank_num 
FROM call_performance;
