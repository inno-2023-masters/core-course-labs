import uvicorn

from src.config import config

if __name__ == "__main__":
    uvicorn.run("src.server:app", host=config.host, port=config.port, reload=False)
