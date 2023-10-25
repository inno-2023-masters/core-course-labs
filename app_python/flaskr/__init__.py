"""Module for flask web app factory."""
import os
from flask import Flask
from . import util_functions as uf


def create_app(test_config=None):
    """Web app factory for flask application."""
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    app = Flask(__name__)

    @app.route('/')
    def home():
        """Home page function showing the date and time in Moscow"""
        return "Time in Moscow: " + uf.get_date("Europe/Moscow",
                                                '%Y-%m-%d %H:%M:%S')

    if __name__ == '__main__':
        app.run()

    return app
