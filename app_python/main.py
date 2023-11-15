from flask import Flask
from datetime import datetime
import pytz

app = Flask(__name__)

@app.route('/')
def moscow_time():
    timezone = pytz.timezone('Europe/Moscow')
    time = datetime.now(timezone)
    formatted_time = time.strftime('%Y-%m-%d, %H:%M:%S.%f')[:-3]
    return 'Current Moscow time is ' + formatted_time

if __name__ == '__main__':
    app.run(host='127.0.0.1', debug=True)

