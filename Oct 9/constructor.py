class car():
    def __init__(self,year,brand,model):
        self.brand = brand
        self.year = year
        self.model = model

    def display(self):
        print(f"This is a {self.brand} !!!")

bmw = car(2012,"BMW","M3")
bmw.brand = "Audi"
bmw.display()
