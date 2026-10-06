SELECT *, calls_handled - AVG(calls_handled) OVER (PARTITION BY team) AS diff_from_team_avg 
FROM call_performance;
