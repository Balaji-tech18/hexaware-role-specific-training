import event_utils
from event_utils import calculate_booking_amount
import event_utils as eu

amount = event_utils.calculate_booking_amount(2500, 4)
print(amount)
print(event_utils.calculate_discount(amount))
print(event_utils.check_event_capacity(500, 450))
print(calculate_booking_amount(3500, 2))
print(eu.check_event_capacity(200, 200))
