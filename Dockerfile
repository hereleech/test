FROM alpine:3.13.0

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
RUN pip3 install --no-cache-dir aiohttp aria2p hachoir Pillow https://github.com/Mahesh0253/pyrogram/archive/asyncio.zip tgcrypto youtube-dl hurry.filesize
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
