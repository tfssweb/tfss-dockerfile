### 运行
获取代码后，直接执行
```
docker-compose up -d
```
即可。


## 也可单独运行

ZOOKEEPER_ID：环境变量设置zookeeper配置中的myid，单容器可以不设置，集群必须设置。

ZOOKEEPER_CLUSTER：环境变量：

    eg: server.1=zoo1:2888:3888,server.2=zoo2:2888:3888

eg：

### 单节点

    docker run -d --name zoo1 buxiaomo/zookeeper
    
    
### 集群
    
    
    docker run -d --name zoo1 -e ZOOKEEPER_ID=1 -e ZOOKEEPER_CLUSTER=server.1=zoo1:2888:3888,server.2=zoo2:2888:3888 buxiaomo/zookeeper
    
    docker run -d --name zoo2 -e ZOOKEEPER_ID=2 -e ZOOKEEPER_CLUSTER=server.1=zoo1:2888:3888,server.2=zoo2:2888:3888 buxiaomo/zookeeper
    


