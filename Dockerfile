FROM python:3.11-slim

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-cache

COPY . .

ENV PYTHONPATH=/app
ENV FLASK_APP=main
ENV FLASK_DEBUG=0
ENV PYTHONUNBUFFERED=1

EXPOSE 5001

CMD ["uv", "run", "gunicorn", "--bind", "0.0.0.0:5001", "main:app"]
