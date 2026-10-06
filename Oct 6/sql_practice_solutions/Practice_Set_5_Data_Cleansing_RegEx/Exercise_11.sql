SELECT * 
FROM registrations 
WHERE email IS NOT NULL 
  AND TRIM(email) != '' 
  AND email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
