SELECT 
    TRIM(UPPER(full_name)) AS name,
    LOWER(NULLIF(TRIM(email), '')) AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(city) AS city
FROM registrations;
