weight = float(input("Shipment weight: "))
cost = float(input("Shipment cost: "))
print(f"Cost per kg: {cost / weight:.2f}" if weight > 0 else "Weight must be greater than zero")

if weight > 20:
    print("Heavy")
elif weight >= 10:
    print("Medium")
else:
    print("Light")

for number in range(1, 21):
    print(number)

for number in range(1, 21):
    if number % 2 == 0:
        print(number)

attempt = 1
while attempt <= 5:
    print(f"Processing attempt {attempt}")
    attempt += 1
