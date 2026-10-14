class laptop():
    price=0
    processor=""
    ram=0

    def HP(self ):
        print(self.price);

        print(self.processor);
        print(self.ram);
    def Dell(self ):
        print(self.price);

    def Asus(self ):
        print(self.price);
        print(self.processor);
        print(self.ram);

asuslap = laptop()
hplap = laptop()
delllap = laptop()
asuslap.price = 80000
asuslap.processor = "Intel"
asuslap.ram = 16

asuslap.Asus()
