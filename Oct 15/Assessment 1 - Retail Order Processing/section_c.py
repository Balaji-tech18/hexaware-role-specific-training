def calculate_total(price, quantity):
    return price * quantity

def calculate_discount(amount):
    return amount * (0.10 if amount >= 50000 else 0.05)

def total_sales(sales):
    return sum(sales)

def check_product_stock(product):
    return "Available" if product["stock"] > 0 else "Out of Stock"

square = lambda number: number * number
sales = [65000, 4500, 36000, 12000, 18000, 72000, 9000]
customers = [
    {"name": "North Star Retail", "city": "Hyderabad"},
    {"name": "Blue Mart", "city": "Mumbai"},
    {"name": "Prime Stores", "city": "Hyderabad"}
]
products = [
    {"product_name": "Laptop", "price": 65000},
    {"product_name": "Monitor", "price": 18000},
    {"product_name": "Keyboard", "price": 3000}
]
print(calculate_total(1500, 3))
print(calculate_discount(65000))
print(total_sales(sales))
print(check_product_stock({"stock": 12}))
print(square(6))
print(list(filter(lambda sale: sale > 20000, sales)))
print(list(map(lambda customer: customer["city"], customers)))
print(set(map(lambda customer: customer["city"], customers)))
print(sorted(products, key=lambda product: product["price"]))
