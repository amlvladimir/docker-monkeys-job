FROM ubuntu:latest

USER root
WORKDIR /var/www
RUN mkdir ~/.aws

COPY . /var/www
COPY ./aws-config ~/.aws/config
COPY ./aws-credentials ~/.aws/credentials

ENV TZ=Europe/Kiev

RUN DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get -y install sudo nano awscli mongo-tools