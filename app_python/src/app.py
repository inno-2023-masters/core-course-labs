import pytz
from fastapi import FastAPI
from datetime import datetime

tz = pytz.timezone('Europe/Moscow')

app = FastAPI()


@app.get('/')
def get_current_time():
    ts = datetime.now()
    return {'timestamp': tz.localize(ts).isoformat()}
