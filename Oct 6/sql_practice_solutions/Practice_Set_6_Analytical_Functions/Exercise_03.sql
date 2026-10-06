SELECT *, AVG(calls_handled) OVER (PARTITION BY team) AS team_avg_calls 
FROM call_performance;
