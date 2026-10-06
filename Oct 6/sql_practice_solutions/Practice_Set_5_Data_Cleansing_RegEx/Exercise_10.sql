SELECT * 
FROM registrations 
WHERE email REGEXP '^[a-zA-Z0-9._%+-]+@gmail\\.com$';
