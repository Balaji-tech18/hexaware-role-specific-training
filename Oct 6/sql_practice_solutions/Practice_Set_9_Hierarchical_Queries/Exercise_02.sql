SELECT * 
FROM staff_hierarchy 
WHERE manager_id = (SELECT employee_id FROM staff_hierarchy WHERE designation = 'CEO');
