FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt install software-properties-common
RUN echo y | add-apt-repository ppa:deadsnakes/ppa
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
	megatools \
	curl \
	gnupg2 \
	jq \
	aria2 \
	git \
	unzip \
	unrar \
	tar \
        python3.8 \
        python3-pip \
	python3-lxml \
	pv \
	jq \
	ffmpeg \
	
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*	
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install aiofiles aiohttp bs4 covid cowpy dnspython emoji gitpython google-api-python-client google-auth-httplib2 google-auth-oauthlib googletrans==3.1.0a0 hachoir heroku3 html-telegraph-poster instaloader motor natsort oauth2client Pillow==8.0 psutil pybase64 pyrogram==1.1.12 pySmartDL python-dotenv pytz rarfile removebg requests search-engine-parser selenium==3.141.0 setuptools>=40.3.0 spamwatch speedtest-cli stagger telegraph tgcrypto urbandict==0.5 wget wikipedia youtube_dl>=2021.1.8
RUN dpkg-reconfigure locales
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
