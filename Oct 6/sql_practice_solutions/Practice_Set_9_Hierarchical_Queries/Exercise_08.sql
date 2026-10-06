SELECT e.employee_name AS employee, m.employee_name AS manager
FROM staff_hierarchy e
LEFT JOIN staff_hierarchy m ON e.manager_id = m.employee_id;
