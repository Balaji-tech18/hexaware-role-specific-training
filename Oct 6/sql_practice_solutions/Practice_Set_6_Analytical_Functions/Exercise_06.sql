SELECT *, SUM(calls_handled) OVER (PARTITION BY team ORDER BY performance_date, call_id) AS cumulative_team_calls 
FROM call_performance;
