FROM ubuntu:18.04

RUN apt update
RUN apt install wget -y
RUN apt install curl -y
RUN cd ~
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs -y
RUN apt-get install build-essential -y
RUN npm i -g yarn
RUN mkdir /root/React-Landing-Page-Template/
COPY ./ /root/React-Landing-Page-Template/
WORKDIR /root/React-Landing-Page-Template/
RUN cd /root/React-Landing-Page-Template/
RUN yarn global add pm2
RUN yarn install
ENTRYPOINT [ "pm2-runtime", "start", "yarn", "--", "start" ]
