FROM ubuntu:20.04

WORKDIR /app
RUN chmod 777 /app
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
RUN git clone https://github.com/artemiszuk/TorToolkit-Telegram && cd TorToolkit-Telegram
WORKDIR /app/TorToolkit-Telegram
RUN pip3 install -r requirements.txt
COPY . .
RUN chmod +x /app/TorToolkit-Telegram/start.sh
RUN chmod +x /app/TorToolkit-Telegram/alive.sh
CMD ["/app/TorToolkit-Telegram/start.sh"]
