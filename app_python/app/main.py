from datetime import datetime

from flask import Flask, render_template
import pytz

app = Flask(__name__)


def moscow_time() -> str:
    msk_tz = pytz.timezone('Europe/Moscow')
    time_str = datetime.now(msk_tz).strftime('%Y-%m-%d %H:%M:%S')

    return time_str



@app.route("/")
def homepage():
    return render_template('index.html', time_str=moscow_time())
