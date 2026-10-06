SELECT *, calls_handled - LAG(calls_handled) OVER (PARTITION BY agent_name ORDER BY performance_date) AS call_diff 
FROM call_performance;
