from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/page1/{intro}")
def read_page(intro: str):
    return {"Intro": intro}