#! /bin/bash

cd  /tmp/install-docker-ce/ && \
    sh install-docker-offline.sh

docker version && /usr/local/bin/docker-compose version
