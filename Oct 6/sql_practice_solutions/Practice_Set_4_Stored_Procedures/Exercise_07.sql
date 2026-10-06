CREATE PROCEDURE IncreaseRateByPercentage(IN p_pct DECIMAL(5,2))
BEGIN
    UPDATE vehicles SET daily_rate = daily_rate * (1 + p_pct / 100);
END;
