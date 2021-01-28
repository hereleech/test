#!/bin/bash
git clone https://artemiszuk:mygithub004@github.com/artemiszuk/tortools
cd tortools
gunicorn tortoolkit:start_server --bind 0.0.0.0:3000 --worker-class aiohttp.GunicornWebWorker & python3 -m tortoolkit
