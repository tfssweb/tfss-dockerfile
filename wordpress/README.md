# 单机模式

​	网站卷将由宿主机挂载到容器内部

```shell
docker-compose -f docker-compose.yml -p webname up -d
```
# 单机模式迁移

​	打包 `docker-compose.yml` 所在目录，scp到新主机执行上面的命令即可


# 集群模式

​	由后端NFS提供共享存储，存放配置文件以及网站文件，Redis与MySQL将单独运行在各自的节点，这两个节点上不会运行其他服务，所以compose文件中写的是NFS路径挂载目录，要求所有container会运行的节点都必须挂载NFS目录。集群模式将会有一台前端Nginx左右入口所以，后端暴露的端口为3000，有前端Nginx做反代理访问

```shell
docker stack deploy -c xbclub.yml xbclub
```



暂时记录这么多，后面再改
