CREATE PROCEDURE DeleteVehicle(IN p_id INT)
BEGIN
    DELETE FROM vehicles WHERE vehicle_id = p_id;
END;
