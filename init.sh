#!/bin/bash
. ./config.sh
docker-compose up -d --no-deps --build monkeys
docker ps
