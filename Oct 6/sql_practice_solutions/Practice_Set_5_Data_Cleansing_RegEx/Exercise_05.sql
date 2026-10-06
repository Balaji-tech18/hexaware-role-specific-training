UPDATE registrations 
SET mobile = REPLACE(REPLACE(mobile, ' ', ''), '-', '');
