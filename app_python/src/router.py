from fastapi import APIRouter
import logging

import service


class TimeRouter:
    """

    TimeRouter is a class that specify routes for the service.Timer

    """

    def __init__(self, name: str, route: str, logger: logging.Logger):
        self.name = name
        self.router = APIRouter()
        self.router.add_api_route(route, self.now, methods=["GET"])

        self.logger = logger
        self.timer = service.Timer(logger)

    async def now(self):
        return self.timer.now()
