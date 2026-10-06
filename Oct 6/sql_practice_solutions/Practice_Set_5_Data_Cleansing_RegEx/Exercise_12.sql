SELECT registration_id, REGEXP_REPLACE(postal_code, '[^0-9]', '') AS cleaned_postal_code 
FROM registrations;
