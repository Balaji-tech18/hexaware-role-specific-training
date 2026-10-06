SELECT s.student_name, COALESCE(SUM(c.fee), 0) AS total_fees
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;
