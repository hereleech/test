FROM ubuntu:20.04

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
RUN set -xe; \
	# Node.js repo
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -; \
	echo "deb https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee /etc/apt/sources.list.d/nodesource.list; \
	echo "deb-src https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee -a /etc/apt/sources.list.d/nodesource.list; \
	# yarn repo
	curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
	apt-get update >/dev/null; \
	apt-get -y --no-install-recommends install >/dev/null \
		nodejs \
		yarn \
	;\
	apt-get clean; rm -rf /var/lib/apt/lists/*;
RUN git clone https://github.com/maple3142/aria2c-ariang
WORKDIR aria2c-ariang
RUN bash setup.sh
RUN yarn
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
