from .routes import get_msk_time_router, index_router, visits_counter_router
import uvicorn
from fastapi import FastAPI
from starlette.staticfiles import StaticFiles

from .settings import get_settings

app = FastAPI()
settings = get_settings()

app.include_router(get_msk_time_router)
app.include_router(index_router)
app.include_router(visits_counter_router)

app.mount("/static", StaticFiles(directory="static"), name="static")
if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=settings.app_port, reload=True)
