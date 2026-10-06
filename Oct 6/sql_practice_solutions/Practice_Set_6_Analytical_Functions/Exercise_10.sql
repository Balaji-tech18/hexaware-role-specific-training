SELECT *, SUM(calls_handled) OVER (PARTITION BY agent_name) AS total_agent_calls 
FROM call_performance;
