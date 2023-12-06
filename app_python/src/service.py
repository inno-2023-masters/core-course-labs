import datetime
import pytz
import logging

class Timer:
    """

    Timer is a class that provides simple interface to work with time

    """

    def __init__(self, logger: logging.Logger):
        self.MoscowTimezone = pytz.timezone("Europe/Moscow")
        self.logger = logger

    def now(self):
        now = datetime.datetime.now(tz=self.MoscowTimezone)
        self.logger.log(
            level=logging.INFO,
            msg=f"time was requested, returned: {now}",
        )
        return datetime.datetime.now(tz=self.MoscowTimezone)
