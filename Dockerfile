FROM ubuntu:latest
USER root
WORKDIR /var/www
COPY . /var/www
COPY ./aws-config ~/.aws/config
COPY ./aws-credentials ~/.aws/credentials
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nano sudo gnupg lsb-release ca-certificates tzdata awscli
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
# RUN apt-get update && apt-get install -y mongodb-org
RUN apt-get update && apt-get install -y mongodb-org-tools mongodb-org-shell

# RUN aws s3 mb s3://odavi-mongo-dumps
# RUN aws s3 cp ./dump.tar.gz s3://odavi-mongo-dumps/

# RUN mongo --host mongodb0.example.com --port 28015 --username <username> --password <password> --eval <javascript> dbname
# RUN mongo --host mongodb0.example.com --port 28015 --username <username> --password <password> --eval '' dbname
# RUN mongodump --host mongodb0.example.com --port 28015 --username <username> --password <password> --db <database>
# RUN mongodump --host localhost --port 27017 --db local

# RUN mongodump --host mongo --port 27017 --username 'root' --password 'example' --db admin && ls -l ./dump/admin && tar -zcvf dump.tar.gz ./dump && ls -l ./

ENTRYPOINT ["top", "-b"]
CMD ["-c"]
