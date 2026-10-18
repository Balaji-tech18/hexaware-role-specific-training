shipment_costs = [850, 620, 1250, 480, 1600, 740, 590, 1100, 920, 1750, 520, 1050]
destinations = ["Hyderabad", "Mumbai", "Bangalore", "Delhi", "Pune", "Hyderabad", "Mumbai", "Delhi", "Bangalore", "Pune", "Hyderabad", "Mumbai"]
print(sum(shipment_costs))
print(sum(shipment_costs) / len(shipment_costs))
print(min(shipment_costs))
print(max(shipment_costs))
print(set(destinations))

shipment = {"shipment_id": "S1001", "destination": "Hyderabad", "weight": 12.5, "status": "Delivered", "cost": 850}
shipments = [
    {"shipment_id": "S1001", "destination": "Hyderabad", "weight": 12.5, "status": "Delivered", "cost": 850},
    {"shipment_id": "S1002", "destination": "Mumbai", "weight": 8.0, "status": "In Transit", "cost": 620},
    {"shipment_id": "S1003", "destination": "Bangalore", "weight": 18.5, "status": "Delivered", "cost": 1250}
]
print(shipment)
print([item for item in shipments if item["status"] == "Delivered"])
