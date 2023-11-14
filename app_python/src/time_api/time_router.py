from fastapi import APIRouter
from fastapi.responses import HTMLResponse
from pytz import timezone
from datetime import datetime


time_api_router = APIRouter(
    prefix="/time",
    tags=["time"],
    responses={404: {"description": "Not found"}},
)


@time_api_router.get("/moscow_time")
async def get_moscow_time() -> HTMLResponse:
    moscow_tz = timezone("Europe/Moscow")
    current_time = datetime.now(moscow_tz)
    html_body = "<h1>Current Moscow Time</h1>"
    html_body += f"<p>Current date: {current_time.date()}</p>"
    html_body += f"<p>Current time: {current_time.time()}</p>"
    return HTMLResponse(content=html_body, status_code=200)
