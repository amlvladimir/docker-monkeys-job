FROM ubuntu:latest
USER root
WORKDIR /var/www
COPY . /var/www

RUN apt-get update
RUN apt-get -y install sudo gnupg lsb-release ca-certificates
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update && apt-get install -y mongodb-org-tools

ENTRYPOINT ["top", "-b"]
CMD ["-c"]
