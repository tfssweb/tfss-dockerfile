# zookeeper

ZOOKEEPER_ID：环境变量设置zookeeper配置中的myid，单容器可以不设置，集群必须设置。

ZOOKEEPER_CLUSTER：环境变量：

    eg: server.1=zoo1:2888:3888,server.2=zoo2:2888:3888

eg：

# 单节点

    docker run -d --name zoo1 buxiaomo/zookeeper
    
    
# 集群
    
    
    docker run -d --name zoo1 -e ZOOKEEPER_ID=1 -e ZOOKEEPER_CLUSTER=server.1=zoo1:2888:3888,server.2=zoo2:2888:3888 buxiaomo/zookeeper
    
    docker run -d --name zoo2 -e ZOOKEEPER_ID=2 -e ZOOKEEPER_CLUSTER=server.1=zoo1:2888:3888,server.2=zoo2:2888:3888 buxiaomo/zookeeper
    
# docker-compose.yml管理

```
version: '2'
services:
    zookeeper01:
        image: daocloud.io/buxiaomo/zookeeper
        hostname: zookeeper01
        environment:
            - ZOOKEEPER_ID=1
            - ZOOKEEPER_CLUSTER=server.1=zookeeper01:2888:3888,server.2=zookeeper02:2888:3888,server.3=zookeeper03:2888:3888
        networks:
            zookeeper:
                aliases:
                    - zookeeper01
        volumes:
            - /nfs/zookeeper01:/zookeeper
    zookeeper02:
        image: daocloud.io/buxiaomo/zookeeper
        hostname: zookeeper02
        environment:
            - ZOOKEEPER_ID=2
            - ZOOKEEPER_CLUSTER=server.1=zookeeper01:2888:3888,server.2=zookeeper02:2888:3888,server.3=zookeeper03:2888:3888
        networks:
            zookeeper:
                aliases:
                    - zookeeper02
        volumes:
            - /nfs/zookeeper02:/zookeeper
    zookeeper03:
        image: daocloud.io/buxiaomo/zookeeper
        hostname: zookeeper03
        environment:
            - ZOOKEEPER_ID=3
            - ZOOKEEPER_CLUSTER=server.1=zookeeper01:2888:3888,server.2=zookeeper02:2888:3888,server.3=zookeeper03:2888:3888
        networks:
            zookeeper:
                aliases:
                    - zookeeper03
        volumes:
            - /nfs/zookeeper03:/zookeeper
volumes:
    zookeeper01:
    zookeeper02:
    zookeeper03:

networks:
    zookeeper:
        external: true
```
