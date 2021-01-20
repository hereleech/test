FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
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
	nodejs \
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN pip3 install setuptools
RUN pip3 install wheel
RUn pip3 install nodeenv
RUN npm install -g typescript
RUN git clone https://artemiszuk:mygithub004@github.com/artemiszuk/atmb-pro
RUN cd atmb-pro
RUN npm install
RUN dpkg-reconfigure locales
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
