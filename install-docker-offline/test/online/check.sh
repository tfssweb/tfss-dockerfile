#! /bin/bash

cd  /tmp/install-docker-ce/ && \
    sh install-docker.sh

docker version && docker-compose version
