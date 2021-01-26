FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y curl git wget \
    python3 python3-pip \
    aria2 \
    ffmpeg mediainfo unzip p7zip-full p7zip-rar
RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
RUN apt install -y qbittorrent-nox
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install --no-cache-dir aiohttp aria2p hachoir Pillow https://github.com/Mahesh0253/pyrogram/archive/asyncio.zip tgcrypto youtube-dl hurry.filesize
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
