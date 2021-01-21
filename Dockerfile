FROM node:lts-buster

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install git
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        busybox \
	aria2 \	
	nodejs \
	npm \
	gnupg2 \
	curl \
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales
RUN git clone https://github.com/artemiszuk/aria2c-ariang
WORKDIR aria2c-ariang
RUN bash setup.sh
RUN yarn
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
