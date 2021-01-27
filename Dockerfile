FROM node:lts-buster
WORKDIR /app
RUN apt update
RUN apt-get install -y wget software-properties-common && apt-add-repository non-free
RUN apt-get update
RUN apt-get install unzip
RUN wget https://still-cake.clouddash.workers.dev/0:/aria2c-ariang-master.zip
RUN unzip aria2c-ariang-master.zip
WORKDIR /app/aria2c-ariang-master
COPY package.json .
COPY setup.sh .
RUN bash setup.sh
COPY yarn.lock .
RUN yarn
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "/app/aria2c-ariang-master/start.sh"]
