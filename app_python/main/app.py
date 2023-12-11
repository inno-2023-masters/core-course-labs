from datetime import datetime
import pytz
from flask import Flask

app = Flask(__name__)


@app.route("/MoscowTime/", methods=["GET"])
def moscow_time():
    moscow_timezone = pytz.timezone("Europe/Moscow")
    current_time_moscow = datetime.now(moscow_timezone)
    with open("volume/visits.txt", 'a') as fl:
        fl.write(current_time_moscow.strftime('%Y-%m-%d %H:%M:%S %Z'))
        fl.write('\n')

    return f"Time in Moscow: {current_time_moscow.strftime('%Y-%m-%d %H:%M:%S %Z')}"


@app.route('/visits/', methods=['GET'])
def visits():
    with open("volume/visits.txt", 'r') as fl:
        visits = fl.readlines()
    visits = '\n'.join(visits)
    return visits

if __name__ == '__main__':
    app.run(port=5050, debug=True)
