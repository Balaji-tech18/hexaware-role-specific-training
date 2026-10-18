import csv
import json

with open("activity.txt", "w", encoding="utf-8") as file:
    file.write("Order file loaded\n")
    file.write("Customer records processed\n")
    file.write("Inventory checked\n")

with open("activity.txt", "a", encoding="utf-8") as file:
    file.write("Order summary generated\n")

with open("activity.txt", "r", encoding="utf-8") as file:
    print(file.read())

with open("customers.csv", newline="", encoding="utf-8") as file:
    customers = list(csv.DictReader(file))

print([customer for customer in customers if customer["active"] == "True"])
print([customer for customer in customers if customer["city"] == "Hyderabad"])

with open("products.json", encoding="utf-8") as file:
    products = json.load(file)

print([product["product_name"] for product in products])
print([product for product in products if product["price"] > 10000])
for product in products:
    print(product["supplier"]["name"], product["supplier"]["city"])

colors = [color for product in products for color in product["colors"]]
print(colors)
print(set(colors))

for product in products:
    if product["product_id"] == 202:
        product["stock"] += 5

with open("products_updated.json", "w", encoding="utf-8") as file:
    json.dump(products, file, indent=2)
