FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
	aria2 \
	git \
	unzip \
	unrar \
	tar \
        python3-dev \
        python3-pip \
	python3-lxml \
	ffmpeg \
	
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install --no-cache-dir requests psutil python-telegram-bot==12.6.1  google-api-python-client>=1.7.11,<1.7.20 google-auth-httplib2>=0.0.3,<0.1.0 google-auth-oauthlib>=0.4.1,<0.10.0 aria2p>=0.9.0,<0.15.0 python-dotenv>=0.10 tenacity>=6.0.0 python-magic beautifulsoup4>=4.8.2,<4.8.10 Pyrogram>=0.16.0,<0.16.10 TgCrypto>=1.1.1,<1.1.10 youtube-dl lxml telegraph
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
