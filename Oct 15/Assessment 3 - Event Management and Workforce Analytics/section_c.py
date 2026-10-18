def calculate_booking(ticket_price, tickets):
    return ticket_price * tickets

def calculate_discount(amount):
    return amount * (0.10 if amount >= 10000 else 0.05)

def is_active(status):
    return status == "Confirmed"

def total_bookings(amounts):
    return sum(amounts)

increase_by_ten_percent = lambda amount: amount * 1.10
booking_amounts = [5000, 3500, 7500, 6000, 4000, 7000, 3000, 10000]
registrations = [
    {"attendee_name": "Aarav Shah", "city": "Hyderabad", "status": "Confirmed", "amount": 5000},
    {"attendee_name": "Faiz Ahmed", "city": "Pune", "status": "Pending", "amount": 7500},
    {"attendee_name": "Simran Kaur", "city": "Mumbai", "status": "Confirmed", "amount": 3500}
]
print(calculate_booking(2500, 2))
print(calculate_discount(10000))
print(is_active("Confirmed"))
print(total_bookings(booking_amounts))
print(increase_by_ten_percent(5000))
print(list(filter(lambda amount: amount > 6000, booking_amounts)))
print(list(filter(lambda registration: registration["status"] == "Confirmed", registrations)))
print(list(map(lambda registration: registration["city"], registrations)))
print(set(map(lambda registration: registration["city"], registrations)))
print(sorted(registrations, key=lambda registration: registration["amount"]))
