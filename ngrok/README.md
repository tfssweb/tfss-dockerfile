# ngrok

## 添加域名解析

TCP解析，不要使用CDN

记录类型：A记录

主机记录：@

记录值：部署ngrok-server容器的主机IP

HTTP泛解析，可以配置CDN。若不设置泛解析，则添加一个HTTP转发就需要添加一条A记录的解析

记录类型：A记录

主机记录：*

记录值：部署ngrok-server容器的主机IP



## 客户端使用

执行 `docker inspect ngrok-server | jq '.[0].Mounts[0].Source'` 命令获取数据卷

进入此目录的package子目录，下载对应系统版本的客户端。

配置Client文件：

软件包中的配置文件基本生成好，只需要求改映射的配置，模板如下

```
server_addr: "example.com:4443"
trust_host_root_certs: false

tunnels:
    ssh:
       remote_port: 3000
       proto:
         tcp: "127.0.0.1:22"
    mstsc:
        proto:
         tcp: "127.0.0.1:3389"
    web:
     subdomain: "www"
     proto:
       http: 80
    domain:
     hostname: "www.example.com"
     proto:
       http: 80
```

常用参数说明：

`remote_port`：指定端口，不设置则随机分配（建议使用）

`tcp`：目标主机（格式为：IP:端口），可以是本机，也可以是内网其他主机。

`subdomain`：域名前缀

`http`：HTTP主机（格式为：IP:端口），可以转发内网其他HTTP主机

`hostname`：使用自己的域名所配置的值

启动Client 安装screen工具 $ Ubuntu

```
apt-get install screen -y

```

$ CentOS

```
yum install screen -y

```

创建screen回话

```
screen -S ssh

```

启动一个穿透

```
unzip linux64.zip
cd ngrok
./start.sh ngrok.cfg ssh
```

# 迁移

## 以挂载数据卷

1、打包/etc/ngrok目录下所有文件，拷贝至新节点执行上面的命令即可，注意修改挂载路径

2、更改域名解析

## 未挂在数据卷

1、执行`docker inspect ngrok-server | jq '.[0].Mounts[0].Source'`命令获取卷，打包此目录中的所有文件，拷贝至新节点

2、启动ngrok-server容器，注意修改挂载路径

3、更改域名解析
