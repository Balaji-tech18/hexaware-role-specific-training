def calculate_shipping_cost(weight, rate):
    return weight * rate

def shipment_category(weight):
    if weight > 20:
        return "Heavy"
    if weight >= 10:
        return "Medium"
    return "Light"

shipments = [
    {"shipment_id": "S1001", "destination": "Hyderabad", "weight": 12.5, "status": "Delivered", "cost": 850},
    {"shipment_id": "S1002", "destination": "Mumbai", "weight": 8.0, "status": "In Transit", "cost": 620},
    {"shipment_id": "S1003", "destination": "Bangalore", "weight": 18.5, "status": "Delivered", "cost": 1250}
]
print(calculate_shipping_cost(12.5, 68))
print(shipment_category(22))
print(list(filter(lambda shipment: shipment["status"] == "Delivered", shipments)))
print(list(map(lambda shipment: shipment["destination"], shipments)))
print(sorted(shipments, key=lambda shipment: shipment["cost"]))
