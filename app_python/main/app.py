from datetime import datetime
import pytz
from flask import Flask

app = Flask(__name__)


@app.route("/MoscowTime/", methods=["GET"])
def moscow_time():
    moscow_timezone = pytz.timezone("Europe/Moscow")
    current_time_moscow = datetime.now(moscow_timezone)
    return f"Time in Moscow: {current_time_moscow.strftime('%Y-%m-%d %H:%M:%S %Z')}"


if __name__ == "__main__":
    app.run(port=5050, debug=True)
