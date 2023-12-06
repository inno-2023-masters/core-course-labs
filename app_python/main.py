from datetime import datetime

from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
from prometheus_fastapi_instrumentator import Instrumentator
from pytz import timezone

app = FastAPI()
Instrumentator().instrument(app).expose(app)

def add_visit_to_file():
    with open('./volume/visits', 'r') as f:
        visits = int(f.read()) + 1
    with open('./volume/visits', 'w') as f:
        f.write(str(visits))

@app.get("/")
async def root():
    add_visit_to_file()

    dt_format = "%d-%m-%Y %H:%M:%S"
    moscow_zone = datetime.now(timezone("Europe/Moscow"))
    return moscow_zone.strftime(dt_format)

@app.get("/visits", response_class=PlainTextResponse)
async def root():
    with open('./volume/visits', 'r') as f:
        visits = f.read()
    return str(visits)


@app.get("/health", status_code=200)
async def health():
    return "Server is healthy"