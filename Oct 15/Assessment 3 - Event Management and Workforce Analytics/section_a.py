attendee_name = input("Attendee name: ")
tickets = int(input("Number of tickets: "))
ticket_price = float(input("Ticket price: "))
amount = tickets * ticket_price
discount_rate = 0.10 if amount >= 10000 else 0.05
discount = amount * discount_rate
print(f"Attendee: {attendee_name}")
print(f"Booking amount: {amount:.2f}")
print(f"Discount: {discount:.2f}")
print(f"Final amount: {amount - discount:.2f}")

capacity = int(input("Event capacity: "))
registered = int(input("Registered participants: "))
if registered == capacity:
    print("Full")
elif registered < capacity:
    print("Seats Available")
else:
    print("Invalid Data")

for number in range(1, 16):
    print(number)
    if number % 3 == 0:
        print(f"Divisible by 3: {number}")

count = 10
while count >= 1:
    print(count)
    count -= 1

for number in range(1, 11):
    if number == 3:
        continue
    if number == 8:
        break
    print(number)
