FROM alpine:3.13.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apk update
RUN apk add --no-cache bash jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev
RUN apk add --no-cache g++ gcc libxml2-dev libxslt-dev python3-dev unrar unzip tar aria2 git py3-pip ffmpeg
RUN pip3 install --no-cache setuptools
RUN pip3 install --no-cache wheel
RUN ls /usr/lib/python3.8/site-packages/
RUN pip3 install --no-cache-dir virtualenv
COPY . /app
RUN chmod +x /app/run.sh
CMD ["/app/run.sh"]
