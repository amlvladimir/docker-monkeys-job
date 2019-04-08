#!/bin/bash
. ./config.sh
#
TIMESTAMP=$(date +%s)
#
mongodump --host $MONGO_HOST --port $MONGO_PORT --username $MONGO_USER --password $MONGO_PASSWORD --db $MONGO_DB
# ls -l ./dump/$MONGO_DB
rm -rf ./dump
tar -zcvf $MONGO_DB_$TIMESTAMP.tar.gz ./dump
# ls -l ./
aws s3 cp ./$MONGO_DB_$TIMESTAMP.tar.gz s3://$S3BUCKET/
