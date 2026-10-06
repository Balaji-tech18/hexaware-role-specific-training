SELECT *, LAG(calls_handled) OVER (PARTITION BY agent_name ORDER BY performance_date) AS prev_day_calls 
FROM call_performance;
