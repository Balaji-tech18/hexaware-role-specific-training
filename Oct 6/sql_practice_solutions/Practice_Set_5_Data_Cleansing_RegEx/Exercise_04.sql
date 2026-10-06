UPDATE registrations 
SET email = NULL 
WHERE TRIM(email) = '';
