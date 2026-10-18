def calculate_booking_amount(ticket_price, tickets):
    return ticket_price * tickets

def calculate_discount(amount):
    return amount * (0.10 if amount >= 10000 else 0.05)

def check_event_capacity(capacity, registered):
    if registered == capacity:
        return "Full"
    if registered < capacity:
        return "Seats Available"
    return "Invalid Data"
