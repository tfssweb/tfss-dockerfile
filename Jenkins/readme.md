在这个例子里，我们下载了静态编译的 docker 可执行文件，并提取命令行安装到系统目录下。然后调整了 jenkins 用户的组 ID，调整为宿主 docker 组ID，从而使其具有执行 docker 命令的权限。

组 ID 使用了 `DOCKER_GID` 参数来定义，以方便进一步定制。构建时可以通过` --build-arg `来改变 `DOCKER_GID` 的默认值，运行时也可以通过 `--user jenkins:1234 `来改变运行用户的身份。

这里的基础镜像使用的是 `jenkins:alpine`，换为非 alpine 的镜像 `jenkins:latest` 也是一样的。

用下面的命令来构建镜像（假设镜像名为 jenkins-docker）：

```
$ docker build -t jenkins-docker .
```
如果需要构建时调整 docker 组 ID，可以使用 `--build-arg `来覆盖参数默认值：

```
$ docker build -t jenkins-docker --build-arg DOCKER_GID=1234 .
```
在启动容器的时候，将宿主的 `/var/run/docker.sock `文件挂载到容器内的同样位置，从而让容器内可以通过 unix socket 调用宿主的 Docker 引擎。

比如，可以用下面的命令启动 jenkins：

```
$ docker run --name jenkins \
    -d \
    -p 8080:8080 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jenkins-docker
```


在 jenkins 容器中，就已经可以执行 docker 命令了，可以通过 docker exec 来验证这个结果：
```
$ docker exec -it jenkins sh
/ $ id
uid=1000(jenkins) gid=999(ping) groups=999(ping)
/ $ docker version
Client:
 Version:      1.12.3
 API version:  1.24
 Go version:   go1.6.3
 Git commit:   6b644ec
 Built:        Wed Oct 26 23:26:11 2016
 OS/Arch:      linux/amd64
Server:
 Version:      1.13.0-rc2
 API version:  1.25
 Go version:   go1.7.3
 Git commit:   1f9b3ef
 Built:        Wed Nov 23 06:32:39 2016
 OS/Arch:      linux/amd64
/ $
```