SELECT *
FROM flights
WHERE ticket_price > 15000
  AND destination_city IN ('Dubai', 'Singapore');