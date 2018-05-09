#! /bin/bash

tag=online

if [ -e ./$tag/Vagrantfile ]; then
    rm -f ./$tag/Vagrantfile
fi

cd ./$tag && \
    cp ../Vagrantfile . && \
    vagrant up

