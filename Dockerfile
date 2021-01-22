FROM alpine:3.13.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apk update
RUN apk add python3 unrar unzip tar aria2 git python3-pip python3-lxml ffmpeg
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install --no-cache-dir aiohttp aria2p hachoir Pillow https://github.com/Mahesh0253/pyrogram/archive/asyncio.zip tgcrypto youtube-dl hurry.filesize
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
