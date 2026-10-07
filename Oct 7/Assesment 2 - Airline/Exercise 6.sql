SELECT 
    airline,
    AVG(ticket_price) AS average_ticket_price
FROM flights
GROUP BY airline;