sales = [65000, 4500, 36000, 12000, 18000, 72000, 9000]
print(sum(sales))
print(max(sales))
print(min(sales))
print([sale for sale in sales if sale > 20000])
print(sorted(sales, reverse=True))

cities = ["Hyderabad", "Mumbai", "Delhi", "Hyderabad", "Pune", "Mumbai"]
print(set(cities))

product = (201, "Laptop", "Electronics", 65000)
product_id, product_name, category, price = product
print(product_id, product_name, category, price)

customer = {"id": "C101", "name": "North Star Retail", "city": "Hyderabad", "orders": 3, "active": True}
customer["city"] = "Chennai"
customer["orders"] += 1
customer["email"] = "contact@northstar.example"
for key, value in customer.items():
    print(f"{key}: {value}")
