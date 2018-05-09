#! /bin/bash

tag=offline

if [ -e ./$tag/Vagrantfile ]; then
    rm -f ./$tag/Vagrantfile
fi

cd ./$tag && \
    cp ../Vagrantfile . && \
    vagrant up
