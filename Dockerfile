FROM python:3

RUN apt-get update && echo y | apt-get install software-properties-common && echo y | add-apt-repository multiverse
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y git unzip unrar tar ffmpeg aria2
RUN pip3 install aiohttp aria2p hachoir Pillow https://github.com/Mahesh0253/pyrogram/archive/asyncio.zip tgcrypto youtube-dl hurry.filesize
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
