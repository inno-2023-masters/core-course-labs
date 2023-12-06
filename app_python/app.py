"""
This module contains a Flask web application that displays the current time in Moscow.
"""

from datetime import datetime
from flask import Flask, render_template
import pytz

app = Flask(__name__)

# Timezone for Moscow
MOSCOW_TZ = pytz.timezone('Europe/Moscow')

def get_visits():
    counter = 0
    try:
        counter = int(open('/visits/counter', 'r').read().strip())
    except Exception:
        pass
    
    return counter

def increment_visits():
    counter = get_visits() + 1
    print(counter, end='', file=open('/visits/counter', 'w'))

def get_moscow_time():
    """
    Get the current time in Moscow.

    Returns:
        str: The current time in Moscow as a string formatted as "YYYY-MM-DD HH:MM:SS".
    """

    cur_time = datetime.now(MOSCOW_TZ)
    return cur_time.strftime("%Y-%m-%d %H:%M:%S")

@app.route('/')
def index():
    """
    The index route of the application.
    
    Returns:
        str: Rendered 'index.html' template with the current Moscow time.
    """

    increment_visits()

    moscow_time = get_moscow_time()
    return render_template('index.html', moscow_time=moscow_time)

@app.route('/visits')
def visits():
    return render_template('visits.html', visits=get_visits())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
