FROM python:3.10-slim AS builder

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements/base.txt /app/

RUN pip install --no-cache-dir -r /app/base.txt && cp $(which uvicorn) /app


FROM gcr.io/distroless/python3:latest

COPY --from=builder /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /app /app

ENV PYTHONPATH=/usr/local/lib/python3.10/site-packages

WORKDIR /app

COPY src /app/

EXPOSE 8000

USER nobody

CMD ["./uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]