WITH AgentTotalCalls AS (
    SELECT agent_name, SUM(calls_handled) AS total_calls 
    FROM call_performance 
    GROUP BY agent_name
)
SELECT agent_name, total_calls, RANK() OVER (ORDER BY total_calls DESC) AS overall_agent_rank 
FROM AgentTotalCalls;
