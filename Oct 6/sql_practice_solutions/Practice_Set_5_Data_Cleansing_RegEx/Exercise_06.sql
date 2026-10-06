UPDATE registrations 
SET mobile = REGEXP_REPLACE(mobile, '[^0-9]', '');
