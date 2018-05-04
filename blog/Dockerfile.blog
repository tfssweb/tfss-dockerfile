#基础镜像:JDK8
FROM java:8

#维护者信息
MAINTAINER tfss 1255791430@qq.com

#镜像的操作指令
#将当前目录拷贝到容器内
COPY ./tale /tale
ENV TZ=Asia/Shanghai
COPY startup.sh /startup.sh

CMD ["sh", "/startup.sh"]
