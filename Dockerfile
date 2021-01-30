FROM lzzy12/mega-sdk-python:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN apt-get install -y software-properties-common && apt-add-repository non-free
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
	aria2 \
        curl \
	git \
	unzip \
	unrar \
	tar \
	python3-lxml \
	ffmpeg \
	
	
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN pip3 install setuptools
RUN pip3 install wheel
COPY . /app
RUN chown root:root /app/run.sh
RUN chmod 777 /app/run.sh
CMD ["/app/run.sh"]
