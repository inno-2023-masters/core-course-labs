from django.http import HttpResponse
from datetime import datetime
import pytz

def current_msk_time(request):
    #Set timezone
    moscow_tz = pytz.timezone('Europe/Moscow')
    #Get current time in Moscow
    moscow_time = datetime.now(moscow_tz)
    #Format time
    now = moscow_time.strftime('%Y-%m-%d %H:%M:%S')
    return HttpResponse(f'Current time is: {now}')
