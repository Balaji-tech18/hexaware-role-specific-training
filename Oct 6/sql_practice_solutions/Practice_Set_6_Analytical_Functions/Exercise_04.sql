SELECT *, AVG(customer_rating) OVER (PARTITION BY team) AS team_avg_rating 
FROM call_performance;
