#!/bin/sh
git clone https://github.com/artemiszuk/TorToolkit-Telegram
cd TorToolkit-Telegram
python3 -m tobrot
gunicorn tortoolkit:start_server --bind 0.0.0.0:$PORT --worker-class aiohttp.GunicornWebWorker
python3 -m tortoolkit
