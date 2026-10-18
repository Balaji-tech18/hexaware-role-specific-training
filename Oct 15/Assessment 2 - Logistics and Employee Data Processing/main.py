import shipment_utils
from shipment_utils import calculate_shipping_cost
import shipment_utils as su

print(shipment_utils.calculate_shipping_cost(12.5, 68))
print(shipment_utils.shipment_category(22))
print(shipment_utils.is_delivered({"status": "Delivered"}))
print(calculate_shipping_cost(8, 70))
print(su.shipment_category(6))
