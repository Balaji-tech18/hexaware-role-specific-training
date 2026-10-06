CREATE PROCEDURE CountVehiclesByType(IN p_type VARCHAR(50), OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count FROM vehicles WHERE vehicle_type = p_type;
END;
