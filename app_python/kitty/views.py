from django.shortcuts import render
from django.http import HttpResponse
import datetime
import pytz

# Create your views here.

from prometheus_client import Counter, Histogram

request_latency = Histogram("request_latency_seconds", "Request latency in seconds")
request_count = Counter("request_count", "Request Count")


def get_moscow_time():
    moscow_timezone = pytz.timezone("Europe/Moscow")
    moscow_time = datetime.datetime.now(moscow_timezone)
    return moscow_time.strftime("%Y-%m-%d %H:%M:%S")


@request_latency.time()
def show_time(request):
    request_count.inc()
    context = {"moscow_time": get_moscow_time()}
    return render(request, "index.html", context)


def get_time(request):
    formatted_time = get_moscow_time()
    return HttpResponse(formatted_time)
