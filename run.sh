#!/bin/sh
git clone https://github.com/artemiszuk/TorToolkit-Telegram
cd TorToolkit-Telegram
gunicorn tortoolkit:start_server --bind 0.0.0.0:80 --worker-class aiohttp.GunicornWebWorker & python3 -m tortoolkit
