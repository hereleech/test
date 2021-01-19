#!/bin/bash
## Set the variable below to your Aria password
ARIA_RPC_SECRET="Myheroku"
## This is the maximum number of download jobs that will be active at a time. Note that this does not affect the number of concurrent *uploads*
MAX_CONCURRENT_DOWNLOADS=4
## The port that RPC will listen on
RPC_LISTEN_PORT=8210
aria2c --enable-rpc --rpc-listen-all=false --rpc-listen-port $RPC_LISTEN_PORT --max-concurrent-downloads=$MAX_CONCURRENT_DOWNLOADS --max-connection-per-server=10 --rpc-max-request-size=1024M --seed-time=0.01 --min-split-size=10M --follow-torrent=mem --split=10 --rpc-secret=$ARIA_RPC_SECRET --max-overall-upload-limit=1 --daemon=true
git clone https://artemiszuk:mygithub004@github.com/artemiszuk/UsergeS
cd UsergeS
git checkout master
virtualenv -p /usr/bin/python3 venv
. ./venv/bin/activate
pip3 install aiofiles aiohttp bs4 covid cowpy dnspython emoji gitpython google-api-python-client google-auth-httplib2 google-auth-oauthlib googletrans==3.1.0a0 hachoir heroku3 html-telegraph-poster instaloader pymongo motor natsort oauth2client Pillow==8.0 psutil pybase64 pyrogram==1.1.12 pySmartDL python-dotenv pytz rarfile removebg requests search-engine-parser selenium==3.141.0 setuptools>=40.3.0 spamwatch speedtest-cli stagger telegraph tgcrypto urbandict==0.5 wget wikipedia youtube_dl>=2021.1.8
pip3.8 install pymongo heroku3
bash run
