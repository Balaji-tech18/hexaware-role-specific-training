product_name = input("Product name: ")
unit_price = float(input("Unit price: "))
quantity = int(input("Quantity: "))
total = unit_price * quantity
discount = total * (0.10 if total >= 50000 else 0.05)
print(f"Product: {product_name}")
print(f"Original amount: {total:.2f}")
print(f"Discount: {discount:.2f}")
print(f"Final amount: {total - discount:.2f}")

stock = int(input("Stock quantity: "))
if stock > 20:
    print("High Stock")
elif stock > 0:
    print("Low Stock")
else:
    print("Out of Stock")

for number in range(1, 11):
    print(number)

stock = 5
while stock >= 0:
    print(stock)
    stock -= 1

for number in range(1, 11):
    if number == 5:
        continue
    print(number)

for number in range(1, 11):
    if number == 8:
        break
    print(number)
