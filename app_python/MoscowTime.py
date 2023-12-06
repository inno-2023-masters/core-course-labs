import requests
import json
import csv
import calendar
from flask import Flask

app = Flask(__name__)

@app.route('/')
def MoscowTime():
    counter_file = 'counter.csv'
    response = requests.get('https://api.api-ninjas.com/v1/worldtime?city={}'.format("Moscow"), timeout=5,
                            headers={'X-Api-Key': 'oZDQTEM0MJpKNshpblkFBQ==RRsPxd52ToPtLq75'})

    if response.status_code == requests.codes.ok:

        with open(counter_file, 'r') as f:
            last_val = int(csv.reader(f)) + 1
            with open(counter_file, 'a', newline='') as f_object:
                writer_object = csv.writer(f_object)
                writer_object.writerow([last_val])
                f_object.close()
            f.close()

        res = json.loads(response.text)
        time = res['hour']+":"+res['minute']+":"+res['second']+", "+res['day']+" "+\
               str(calendar.month_name[int(res['month'])])+" "+\
               res['year']+", "+res['day_of_week']
        return """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>Moscow Time App</title>
            </head>
            <body>
               <h1>Current Moscow Time is</h1>
               <h2> """+time+""" </h2>
            </body>
            </html>
        """
    return """
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <title>Moscow Time App</title>
                </head>
                <body>
                   <h1>Error occurred while loading a Moscow Time</h1>
                </body>
                </html>
            """

if __name__ == '__main__':
    app.run()
