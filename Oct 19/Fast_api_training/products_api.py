from fastapi import FastAPI,HTTPException
from pydantic import BaseModel

app = FastAPI()
class Product(BaseModel):
    id:int
    name:str
    price:int

list_products = []

@app.get("/products")
def read_products():
    return list_products

@app.post("/products")
def create_product(product: Product):
    list_products.append(product)
    return {
        "message": "Product created successfully",
        "Product": product
    }

@app.get("/products/{id}")
def read_product(id: int):
    for product in list_products:
        if product.id == id:
            return product

    raise HTTPException(status_code=404, detail="Product not found")

@app.put("/products/{product_id}")
def update_product(product_id: int, up_product: Product):
    for index, product in enumerate(list_products):
        if product.id == product_id:
            list_products[index] = up_product
            return up_product

    raise HTTPException(status_code=404, detail="Product not found")

@app.delete("/products/{product_id}")
def delete_product(product_id: int):
    for index,product in enumerate(list_products):
        if product.id == product_id:
            deleted = list_products.pop(index)
            return {
                "message": "Product deleted successfully",
                "product": deleted
            }

    raise HTTPException(status_code=404, detail="Product not found")

