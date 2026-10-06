CREATE PROCEDURE GetVehiclesByMaxRate(IN p_max_rate DECIMAL(10,2))
BEGIN
    SELECT * FROM vehicles WHERE daily_rate <= p_max_rate;
END;
