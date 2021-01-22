FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
	aria2 \
	git \
	unzip \
	unrar \
	tar \
        python3-dev \
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
RUN pip3 install yarl multidict aiohttp pyrogram aria2p hachoir Pillow tgcrypto youtube_dl==2020.11.12 hurry.filesize
RUN dpkg-reconfigure locales
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
