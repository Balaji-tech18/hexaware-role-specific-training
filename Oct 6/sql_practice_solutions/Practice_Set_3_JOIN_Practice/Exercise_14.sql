SELECT c.course_name, COALESCE(SUM(c.fee), 0) AS total_revenue
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
