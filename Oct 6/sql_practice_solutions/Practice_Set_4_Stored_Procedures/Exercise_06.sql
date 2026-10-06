CREATE PROCEDURE UpdateVehicleStatus(IN p_id INT, IN p_status VARCHAR(20))
BEGIN
    UPDATE vehicles SET available_status = p_status WHERE vehicle_id = p_id;
END;
