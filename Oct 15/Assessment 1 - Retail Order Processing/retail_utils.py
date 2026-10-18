def calculate_order_total(price, quantity):
    return price * quantity

def calculate_discount(amount):
    return amount * (0.10 if amount >= 50000 else 0.05)

def check_stock(stock):
    if stock > 20:
        return "High Stock"
    if stock > 0:
        return "Low Stock"
    return "Out of Stock"
