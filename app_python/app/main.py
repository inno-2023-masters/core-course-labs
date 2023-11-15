"""Python devops app"""
from datetime import datetime
import pytz

from fastapi import FastAPI
from fastapi.responses import HTMLResponse


app = FastAPI()


@app.get("/")
async def show_time():
    """Function printing Moscow time"""
    msk_time = datetime.now(pytz.timezone('Europe/Moscow'))
    formatted_time = msk_time.strftime('%H:%M:%S')
    html_content = """
            <html>
                <head>
                    <title>Current Time Check</title>
                </head>
                <body>
                    <h1>Moscow time</h1>
                    <h3>Current time in Moscow is %s</h3>
                </body>
            </html>
            """

    return HTMLResponse(content=html_content % formatted_time, status_code=200)
