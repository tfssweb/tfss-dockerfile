#! /bin/bash

root=$(pwd)

destroy(){
    if  vagrant status | grep -q 'running'  ; then
        vagrant destroy -f
    fi
}

cd $root/offline && destroy

cd $root/online && destroy

