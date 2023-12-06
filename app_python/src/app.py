from flask import Flask
from datetime import datetime
from zoneinfo import ZoneInfo
from waitress import serve
from prometheus_flask_exporter import PrometheusMetrics

import os.path
import logging

logging.basicConfig(
    format="%(asctime)-s  %(levelname)-8s: %(message)s",
    datefmt="%Y-%m-%dT%H:%M:%S"
)
logger = logging.getLogger("waitress")
logger.setLevel(logging.INFO)

app = Flask(__name__)
metrics = PrometheusMetrics(app)

visits_dir_path = "visits_dir"
visits_file_path = f"{visits_dir_path}/visits"


@app.route("/")
def current_time():
    __update_visits__()

    moscow_zone_info = ZoneInfo("Europe/Moscow")
    time: datetime = datetime.now(tz=moscow_zone_info)
    time_str: str = time.strftime("%H:%M:%S")

    logger.info(msg="Moscow time was sent")
    return "Moscow Time: " + time_str


@app.route("/health")
def health():
    logger.info(msg="Health status was sent")
    return "OK"


@app.route("/visits")
def visits():
    with open(visits_file_path, "r") as visits_file:
        logger.info(msg="Visits counter was sent")
        return visits_file.readline()


def __update_visits__():
    with open(visits_file_path, "r") as visits_file:
        counter = int(visits_file.readline())
    with open(visits_file_path, "w") as visits_file:
        visits_file.write(str(counter + 1))


def create_visits_file_if_not_exists():
    if not os.path.isdir(visits_dir_path):
        os.mkdir(visits_dir_path)
    if not os.path.isfile(visits_file_path):
        with open(visits_file_path, "w+") as file:
            file.write("0")


if __name__ == "__main__":
    create_visits_file_if_not_exists()
    serve(app=app, port="8080")
