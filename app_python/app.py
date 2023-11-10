from flask import Flask, render_template, Response
import datetime
import pytz
from prometheus_client import Counter, generate_latest, CollectorRegistry

app = Flask(__name__)

# Create Prometheus metrics
request_counter = Counter('http_requests_total', 'Total number of requests to the app')

def get_moscow_time():
    moscow_timezone = pytz.timezone("Europe/Moscow")
    moscow_time = datetime.datetime.now(moscow_timezone)
    return moscow_time.strftime("%Y-%m-%d %H:%M:%S")


@app.route("/")
def show_time():
    request_counter.inc()
    moscow_time = get_moscow_time()
    return render_template("index.html", moscow_time=moscow_time)


@app.route("/get_time/")
def get_time():
    moscow_timezone = pytz.timezone("Europe/Moscow")
    moscow_time = datetime.datetime.now(moscow_timezone)
    formatted_time = moscow_time.strftime("%Y-%m-%d %H:%M:%S")
    return formatted_time



@app.route('/metrics')
def metrics():
    registry = CollectorRegistry()
    data = generate_latest(registry)
    return Response(data, content_type='text/plain; version=0.0.4')
    


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)
