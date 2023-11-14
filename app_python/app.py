from flask import Flask, render_template
import datetime

app = Flask(__name__)

@app.route('/')  #the decorator registers the url
def index():
    moscow_time = (datetime.datetime.utcnow() + datetime.timedelta(hours=3)).strftime("%H:%M:%S")  # creates a string constraining in the current time in the format "hour:minutes:seconds"
    return render_template('index.html', moscow_time=moscow_time)

if __name__ == '__main__':
    app.run(debug=True)

