#!/bin/bash
python3 -m venv env
source ./env/bin/activate
git clone https://artemiszuk:mygithub004@github.com/artemiszuk/telegram-bot
cd telegram-bot
python3 -m tobrot

