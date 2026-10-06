CREATE PROCEDURE GetAvailableVehicles()
BEGIN
    SELECT * FROM vehicles WHERE available_status = 'Available';
END;
