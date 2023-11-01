from flask import Flask
from datetime import datetime
import pytz

app = Flask(__name__)


@app.route('/')
def get_current_time():
    timezone = pytz.timezone('Europe/Moscow')
    current_time = datetime.now(timezone).strftime("%Y-%m-%d %H:%M:%S")
    return f"The current time in Moscow is: {current_time}"


if __name__ == '__main__':
    app.run()
