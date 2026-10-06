WITH AgentBest AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY agent_name ORDER BY calls_handled DESC, customer_rating DESC) AS rnk 
    FROM call_performance
)
SELECT * 
FROM AgentBest 
WHERE rnk = 1;
