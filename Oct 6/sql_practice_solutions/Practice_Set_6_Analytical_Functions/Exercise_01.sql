SELECT *, SUM(calls_handled) OVER () AS total_calls 
FROM call_performance;
