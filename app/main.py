from fastapi import FastAPI
import pendulum

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "5566 can't die22",
            "time": pendulum.now("Europe/Paris")}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}