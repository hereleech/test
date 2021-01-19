FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
	unzip \
	unrar \
	tar \
  python3 \
  python3-pip \
	python3-lxml \
	pv \
	jq \
	ffmpeg \
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install yarl multidict aiohttp pyrogram aria2p hachoir Pillow tgcrypto youtube-dl hurry.filesize
RUN dpkg-reconfigure locales
COPY . /app
CMD ["/app/run.sh"]
