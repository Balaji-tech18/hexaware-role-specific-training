SELECT * 
FROM registrations 
WHERE email IS NULL OR TRIM(email) = '';
