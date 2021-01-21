FROM ubuntu:18.04

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
	curl \
	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure locales
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && echo y | apt install yarn
RUN git clone https://github.com/maple3142/aria2c-ariang
WORKDIR aria2c-ariang
RUN bash setup.sh
RUN yarn
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
