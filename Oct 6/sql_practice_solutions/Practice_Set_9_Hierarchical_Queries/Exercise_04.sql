WITH RECURSIVE Hierarchy AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE manager_id IS NULL
    UNION ALL
    SELECT sh.employee_id, sh.employee_name, sh.manager_id, sh.designation
    FROM staff_hierarchy sh
    INNER JOIN Hierarchy h ON sh.manager_id = h.employee_id
)
SELECT * FROM Hierarchy;
