FROM node:lts-buster
WORKDIR /root
COPY package.json .
COPY setup.sh .
RUN bash setup.sh
COPY yarn.lock .
RUN yarn
COPY . .
ENV PATH="/root/rclone-v1.51.0-linux-amd64:$PATH"
ENV PATH="/root/aria2-1.35.0-linux-gnu-64bit-build1:$PATH"
CMD bash /root/start.sh
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "/app/aria2c-ariang-master/start.sh"]
