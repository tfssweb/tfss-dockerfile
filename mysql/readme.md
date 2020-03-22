数据库创建的时候，难免会遇到数据库更改配置以及数据库初始化的问题，此`Dockerfile`就是为了记录一下配置文件的默认路径以及自动执行脚本的路径。

`/docker-entrypoint-initdb.d/`：将sql文件放到此目录下，可以自动进行执行；<br/>

`/etc/mysql/conf.d/`：此路径下可以添加自己的配置文件，可以减少`run`的时候添加那么多的参数。

构建镜像，执行：
```
docker build -t tfss_mysql .
```

启动容器，执行：
```
docker run -d -p 3306:3306 --name mysql tfss_mysql
```