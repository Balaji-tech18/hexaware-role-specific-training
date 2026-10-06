SELECT *, ROW_NUMBER() OVER (ORDER BY calls_handled DESC) AS row_num 
FROM call_performance;
