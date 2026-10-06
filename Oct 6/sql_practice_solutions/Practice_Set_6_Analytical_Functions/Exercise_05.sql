SELECT *, SUM(calls_handled) OVER (PARTITION BY agent_name ORDER BY performance_date) AS cumulative_agent_calls 
FROM call_performance;
