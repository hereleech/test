FROM ubuntu:20.04
USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
	busybox \
	sudo \

	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
COPY . /app
RUN sudo chown root:root /app/run.sh
RUN chmod 777 /app/run.sh
CMD ["/app/run.sh"]
