SELECT level, COUNT(*) AS employee_count
FROM (
    WITH RECURSIVE Hierarchy AS (
        SELECT employee_id, 1 AS level
        FROM staff_hierarchy
        WHERE manager_id IS NULL
        UNION ALL
        SELECT sh.employee_id, h.level + 1
        FROM staff_hierarchy sh
        INNER JOIN Hierarchy h ON sh.manager_id = h.employee_id
    )
    SELECT * FROM Hierarchy
) sub
GROUP BY level;
