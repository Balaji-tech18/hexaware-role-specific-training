WITH RECURSIVE AmanSubordinates AS (
    SELECT employee_id, employee_name, manager_id, designation
    FROM staff_hierarchy
    WHERE employee_name = 'Aman Khan'
    UNION ALL
    SELECT sh.employee_id, sh.employee_name, sh.manager_id, sh.designation
    FROM staff_hierarchy sh
    INNER JOIN AmanSubordinates AS_ ON sh.manager_id = AS_.employee_id
)
SELECT * FROM AmanSubordinates WHERE employee_name != 'Aman Khan';
