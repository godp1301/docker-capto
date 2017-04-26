FROM ubuntu:14.04

RUN apt-get update && apt-get install -y nodejs-legacy npm
RUN npm install -g capto wait-for-mongo

COPY launcher.sh /launcher.sh
CMD "/launcher.sh"
