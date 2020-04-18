FROM python:2.7-slim

COPY /requirements.txt /tmp/requirements.txt

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        supervisor && \
    python -m pip install uwsgi --no-cache-dir && \
    python -m pip install -r /tmp/requirements.txt && \
    rm -r /root/.cache/pip && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8000

ENTRYPOINT ./entrypoint.sh
