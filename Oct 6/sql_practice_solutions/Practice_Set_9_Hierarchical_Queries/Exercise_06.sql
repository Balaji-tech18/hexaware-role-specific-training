WITH RECURSIVE MeeraSubordinates AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE employee_name = 'Meera Shah'
    UNION ALL
    SELECT sh.employee_id, sh.employee_name, sh.manager_id, sh.designation
    FROM staff_hierarchy sh
    INNER JOIN MeeraSubordinates ms ON sh.manager_id = ms.employee_id
)
SELECT * FROM MeeraSubordinates WHERE employee_name != 'Meera Shah';
