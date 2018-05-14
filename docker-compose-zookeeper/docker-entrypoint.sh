#!/bin/bash
set -e
if [[ "${ZOOKEEPER_CLUSTER}" != "NULL" ]];then
    if [[ "${ZOOKEEPER_ID}" == "NULL" ]];then
        echo "Please Set ZOOKEEPER_ID"
        exit 1
    else
        if [ ! -e /var/lib/zookeeper/myid ];then
            echo "${ZOOKEEPER_ID}" > /var/lib/zookeeper/myid
        fi
    fi
fi
echo $ZOOKEEPER_CLUSTER | sed "s/,/\n/g" >> ${ZOOKEEPER_HOME}/conf/zoo.cfg

exec bin/zkServer.sh start-foreground
