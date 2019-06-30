FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER tfss <1255791430@qq.com>

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /cloud-demo

WORKDIR /cloud-demo

EXPOSE 8080

ADD ./target/cloud-demo.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar cloud-demo.jar