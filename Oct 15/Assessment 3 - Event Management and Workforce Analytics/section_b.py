booking_amounts = [5000, 3500, 7500, 6000, 4000, 7000, 3000, 10000]
print(sum(booking_amounts))
print(sum(booking_amounts) / len(booking_amounts))
print(max(booking_amounts))
print(min(booking_amounts))
print([amount for amount in booking_amounts if amount > 5000])
print(sorted(booking_amounts, reverse=True))

cities = ["Hyderabad", "Mumbai", "Pune", "Hyderabad", "Delhi", "Mumbai"]
unique_cities = set(cities)
unique_cities.add("Chennai")
print(unique_cities)
print(len(unique_cities))

event = ("E101", "AI Innovation Summit", "Hyderabad", 500)
event_id, event_name, venue, capacity = event
print(event_id, event_name, venue, capacity)

registration = {
    "registration_id": "R1001",
    "attendee_name": "Aarav Shah",
    "city": "Hyderabad",
    "tickets": 2,
    "status": "Confirmed",
    "amount": 5000
}
registration["status"] = "Pending"
registration["tickets"] += 1
registration["email"] = "aarav@example.com"
for key, value in registration.items():
    print(f"{key}: {value}")
