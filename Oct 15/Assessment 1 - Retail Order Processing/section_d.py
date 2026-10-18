class Product:
    def __init__(self, product_id, product_name, price, stock):
        self.product_id = product_id
        self.product_name = product_name
        self.price = price
        self.stock = stock

    def display_product(self):
        print(f"{self.product_name}: price={self.price}, stock={self.stock}")

    def calculate_value(self):
        return self.price * self.stock

class DiscountedProduct(Product):
    def __init__(self, product_id, product_name, price, stock, discount_percent):
        super().__init__(product_id, product_name, price, stock)
        self.discount_percent = discount_percent

    def display_product(self):
        print(f"{self.product_name}: price={self.price}, stock={self.stock}, discount={self.discount_percent}%")

class PremiumProduct(Product):
    def display_product(self):
        print(f"Premium {self.product_name}: price={self.price}, stock={self.stock}")

products = [
    Product(201, "Laptop", 65000, 12),
    DiscountedProduct(202, "Monitor", 18000, 8, 10),
    PremiumProduct(203, "Office Chair", 9000, 15)
]
for product in products:
    product.display_product()
    print(product.calculate_value())
