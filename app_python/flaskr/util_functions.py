"""Module of ad-hoc utility functions for DevOps course."""
from datetime import datetime
import pytz


def get_date(timezone: str, format_str: str) -> str:
    """Get current date in a specific timezone and format"""
    timezone_obj = pytz.timezone(timezone)
    time_str = datetime.now(timezone_obj).strftime(format_str)
    return time_str


def str_to_datetime(datetime_str: str) -> datetime:
    """Converting specifically formatted strings to datetime objects"""

    # handling some weirdness of response format.
    # e.g. there is an added hyphen at the end when converting to
    # bytes. Need to handle.
    if isinstance(datetime_str, bytes):
        datetime_str = str(datetime_str)
        datetime_str = datetime_str[-20:-1]
    else:
        datetime_str = datetime_str[-19:]
    datetime_obj = datetime.strptime(datetime_str, '%Y-%m-%d %H:%M:%S')

    return datetime_obj


def datetime_to_minutes(datetime_obj: datetime) -> int:
    """Convert datetime object to integer value of minutes since 0 A.D."""
    return (
        datetime_obj.year * 365 * 24 * 60 +
        datetime_obj.month * 30 * 24 * 60 +
        datetime_obj.day * 24 * 60 +
        datetime_obj.hour * 60 +
        datetime_obj.minute
    )


def compare_dates(datetime_a: str, datetime_b: str) -> bool:
    """Check if 2 datetimes are no more than 2 minutes apart"""
    minutes_a = datetime_to_minutes(str_to_datetime(datetime_a))
    minutes_b = datetime_to_minutes(str_to_datetime(datetime_b))

    # Keep relatively high margin of error of 2 minutes to
    # prevent false-negatives from high ping.
    return abs(minutes_a - minutes_b) < 2
