"""This module defines a route for the root URL ("/time") to obtain the current time
in Moscow"""
import logging
from datetime import datetime

import pytz
from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel

logger = logging.getLogger(__name__)

router = APIRouter()


class TimeZoneRequest(BaseModel):
    """ Define a model for the request body """
    timezone: str = "Europe/Moscow"


@router.get("/time")
async def get_time(request_data: TimeZoneRequest = Depends()):
    """This function returns the current time in Moscow or the timezone specified in
    the request body."""
    try:
        time_zone = pytz.timezone(request_data.timezone)
        current_time = datetime.now(time_zone)
        logger.info("%s time retrieved successfully", request_data.timezone)
        return {"time": current_time.strftime("%H:%M:%S")}
    except pytz.exceptions.UnknownTimeZoneError as exc:
        logger.error("Invalid timezone provided: %s", request_data.timezone)
        raise HTTPException(status_code=400, detail="Invalid timezone provided") from exc
