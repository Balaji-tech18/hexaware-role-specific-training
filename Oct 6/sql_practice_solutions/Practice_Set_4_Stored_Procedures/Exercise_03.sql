CREATE PROCEDURE GetVehiclesByType(IN p_type VARCHAR(50))
BEGIN
    SELECT * FROM vehicles WHERE vehicle_type = p_type;
END;
