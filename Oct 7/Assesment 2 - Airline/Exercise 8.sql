SELECT 
    airline,
    AVG(ticket_price) AS average_ticket_price
FROM flights
GROUP BY airline
HAVING AVG(ticket_price) > 8000;