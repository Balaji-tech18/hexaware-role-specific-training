CREATE PROCEDURE GetVehiclesByRateRange(IN p_min DECIMAL(10,2), IN p_max DECIMAL(10,2))
BEGIN
    SELECT * FROM vehicles WHERE daily_rate BETWEEN p_min AND p_max;
END;
