FROM ubuntu:20.04
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
	aria2 \
	git \
	unzip \
	unrar \
        p7zip-full \
        p7zip-rar \ 
        curl \
	tar \
        python3-dev \
        python3-pip \
	python3-lxml \
	ffmpeg \
	
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
