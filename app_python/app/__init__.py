from flask import Flask
import datetime
import pytz

app = Flask(__name__)


@app.route('/')
def index():
    utc_now = datetime.datetime.now(pytz.utc)
    moscow_tz = pytz.timezone('Europe/Moscow')
    moscow_now = utc_now.astimezone(moscow_tz)
    moscow_time = moscow_now.strftime('%Y-%m-%d %H:%M:%S')

    return moscow_time


if __name__ == '__main__':
    app.run(debug=True, port=8080)
