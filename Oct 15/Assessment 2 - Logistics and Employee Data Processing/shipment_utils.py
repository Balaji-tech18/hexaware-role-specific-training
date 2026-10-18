def calculate_shipping_cost(weight, rate):
    return weight * rate

def shipment_category(weight):
    if weight > 20:
        return "Heavy"
    if weight >= 10:
        return "Medium"
    return "Light"

def is_delivered(shipment):
    return shipment.get("status") == "Delivered"
