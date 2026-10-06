SELECT *, SUM(calls_handled) OVER (PARTITION BY team) AS team_total_calls 
FROM call_performance;
