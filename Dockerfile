FROM ubuntu:20.04

WORKDIR /torapp
RUN chmod -R 777 /torapp

ENV TZ Asia/Kolkata
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales curl
RUN curl https://rclone.org/install.sh | bash
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y curl git wget \
    python3 python3-venv python3-pip \
    aria2 \
    ffmpeg mediainfo unzip p7zip-full p7zip-rar
RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
RUN apt install -y qbittorrent-nox
RUN pip3 install setuptools
RUN pip3 install wheel
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
RUN chmod 777 /torapp/run.sh
RUN useradd -ms /bin/bash  myuser
USER myuser

CMD ["/torapp/run.sh"]
