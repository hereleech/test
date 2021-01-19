FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt install software-properties-common
RUN echo y | add-apt-repository ppa:deadsnakes/ppa
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
	python3.8-dev \
	python3-dev \
	megatools \
	curl \
	gnupg2 \
	jq \
	aria2 \
	git \
	unzip \
	unrar \
	tar \
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
RUN pip3 install virtualenv
RUN dpkg-reconfigure locales
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
