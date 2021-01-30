FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
	busybox \

	&& apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*
COPY . /app
RUN chmod 777 /app/run.sh
CMD ["/app/run.sh"]
