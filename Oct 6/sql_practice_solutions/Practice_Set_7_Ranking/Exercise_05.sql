SELECT *,
    ROW_NUMBER() OVER (ORDER BY calls_handled DESC) AS row_num,
    RANK() OVER (ORDER BY calls_handled DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY calls_handled DESC) AS dense_rank_num
FROM call_performance;
