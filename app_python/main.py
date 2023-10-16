from flask import Flask, render_template_string
from datetime import datetime
import pytz


app = Flask(__name__)


@app.route('/')
def get_current_time():
    context = {}
    src = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Time app</title>
</head>
    <body>
        <h1>The current time in Moscow: {{context.time}}</h1>
    </body>
</html>"""
    date_format = "%d/%m/%Y %H:%M:%S"
    moscow_time = datetime.now(pytz.timezone('Europe/Moscow'))
    context['time'] = moscow_time.strftime(date_format)

    return render_template_string(src, context=context)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
