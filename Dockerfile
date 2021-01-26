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
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
