CREATE PROCEDURE UpdateVehicleRate(IN p_id INT, IN p_rate DECIMAL(10,2))
BEGIN
    UPDATE vehicles SET daily_rate = p_rate WHERE vehicle_id = p_id;
END;
