class Shipment:
    def __init__(self, shipment_id, destination, weight, cost):
        self.shipment_id = shipment_id
        self.destination = destination
        self.weight = weight
        self.cost = cost

    def display(self):
        print(f"{self.shipment_id}: {self.destination}, {self.weight} kg, cost {self.cost}")

class ExpressShipment(Shipment):
    def __init__(self, shipment_id, destination, weight, cost, surcharge=250):
        super().__init__(shipment_id, destination, weight, cost)
        self.surcharge = surcharge

    def display(self):
        print(f"{self.shipment_id}: {self.destination}, {self.weight} kg, express cost {self.cost + self.surcharge}")

shipments = [
    Shipment("S1001", "Hyderabad", 12.5, 850),
    ExpressShipment("S1002", "Mumbai", 8.0, 620)
]
for shipment in shipments:
    shipment.display()
