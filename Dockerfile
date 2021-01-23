FROM lzzy12/mega-sdk-python:latest

WORKDIR /app
RUN chmod 777 /app

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN apt-get install -y software-properties-common && apt-add-repository non-free
RUN apt-get update
RUN apt-get install -y libmagic-dev
RUN echo y | apt install build-essential
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
	aria2 \
	curl \
        pv \
	jq \
        wget \
	git \
        p7zip-full \
        p7zip-rar \ 
        curl \
        python3-pip \
	python3-lxml \
	ffmpeg \
	
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x run.sh
CMD ["./run.sh"]
