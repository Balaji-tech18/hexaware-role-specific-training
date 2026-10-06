CREATE TABLE cleaned_registrations AS
SELECT 
    registration_id,
    TRIM(UPPER(full_name)) AS full_name,
    LOWER(NULLIF(TRIM(email), '')) AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(city) AS city,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS postal_code
FROM registrations;
