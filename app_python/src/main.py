from datetime import datetime

from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
from pytz import timezone

app = FastAPI()
Instrumentator().instrument(app).expose(app)


@app.get("/")
def get_time():
    moscow = timezone("Europe/Moscow")
    moscow_time = datetime.now(moscow)
    return {"time": moscow_time.strftime("%Y-%m-%d %H:%M:%S")}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app)
