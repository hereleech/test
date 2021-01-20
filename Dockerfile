FROM ubuntu:20.04
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
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
	ffmpeg \
	nodejs \
	npm \
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN npm install -g typescript
RUN git clone https://artemiszuk:mygithub004@github.com/artemiszuk/atmb-pro
WORKDIR /usr/src/app/atmb-pro
RUN npm install
RUN tsc
RUN dpkg-reconfigure locales
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
