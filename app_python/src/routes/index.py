"""
This file defines the routes for the root URL ("/") and the static files
"""
from fastapi import APIRouter
from fastapi.responses import FileResponse, HTMLResponse
from starlette.staticfiles import StaticFiles
from .visits_counter import increment_visit_count

router = APIRouter()

router.mount("/static", StaticFiles(directory="static"), name="static")


@router.get("/", response_class=HTMLResponse)
async def root():
    """ Define a route for the root URL ("/") to serve index.html """
    increment_visit_count()
    return FileResponse("static/index.html")
