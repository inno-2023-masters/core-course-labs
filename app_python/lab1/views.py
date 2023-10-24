from datetime import datetime
from zoneinfo import ZoneInfo

from django.http import HttpResponse


def index(request):
    return HttpResponse(str(datetime.now(tz=ZoneInfo("Europe/Moscow"))))
