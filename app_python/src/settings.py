"""Settings module."""
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    """Settings class. This class is used to store all the settings for the
    application."""
    app_port: int = 8000


def get_settings():
    """Return an instance of the Settings class."""
    return Settings()
