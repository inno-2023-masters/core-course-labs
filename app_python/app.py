from flask import Flask, render_template
from datetime import datetime
import pytz

app = Flask(__name__)

# Define a route to display the current time in Moscow
@app.route('/')
def display_time():
    moscow_timezone = pytz.timezone('Europe/Moscow')
    moscow_time = datetime.now(moscow_timezone)
    formatted_time = moscow_time.strftime('%Y-%m-%d %H:%M:%S')
    return f'Current time in Moscow: {formatted_time}'

if __name__ == '__main__':
    app.run(debug=True)
