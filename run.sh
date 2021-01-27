#!/bin/sh
git clone https://github.com/artemiszuk/TorToolkit-Telegram
cd TorToolkit-Telegram
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
python3 -m tortoolkit
