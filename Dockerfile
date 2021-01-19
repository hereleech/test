FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
	curl \
	gnupg2 \
	jq \
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
RUN mkdir -p /tmp/ && \
    cd /tmp/ && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    # -f ==> is required to --fix-missing-dependancies
    dpkg -i ./google-chrome-stable_current_amd64.deb; apt -fqqy install && \
    # clean up the container "layer", after we are done
    rm ./google-chrome-stable_current_amd64.deb

# install chromedriver
RUN mkdir -p /tmp/ && \
    cd /tmp/ && \
    wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip  && \
    unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ && \
    # clean up the container "layer", after we are done
    rm /tmp/chromedriver.zip	
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install yarl multidict aiohttp pyrogram aria2p hachoir Pillow tgcrypto youtube-dl hurry.filesize
RUN dpkg-reconfigure locales
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
