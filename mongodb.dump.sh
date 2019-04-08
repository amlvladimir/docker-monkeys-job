#!/bin/bash
. ./config.sh
#
TIMESTAMP=$(date +%s)
#
rm -rf ${MONGO_DUMP}
mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} --username ${MONGO_USER} --password ${MONGO_PASSWORD} --db ${MONGO_DB} --out ${MONGO_DUMP}/archives
# ls -l ./dump/${MONGO_DB}
tar -zcvf ${MONGO_DUMP}/${MONGO_DB}-${TIMESTAMP}.tar.gz ${MONGO_DUMP}/archives
# ls -l ./
aws s3 cp ${MONGO_DUMP}/${MONGO_DB}-${TIMESTAMP}.tar.gz s3://${S3BUCKET}/
