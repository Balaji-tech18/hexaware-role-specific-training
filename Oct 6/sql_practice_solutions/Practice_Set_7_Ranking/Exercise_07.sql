SELECT *, RANK() OVER (ORDER BY customer_rating DESC) AS rating_rank 
FROM call_performance;
