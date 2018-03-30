FROM openjdk:7u151
MAINTAINER "lhs" <http://www.tfss.me>

COPY sources.list /etc/apt/sources.list

RUN echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin

ENV ZOOKEEPER_VERSION 3.4.10
RUN apt-get update \
    && apt-get install axel --no-install-recommends -y \
    && axel -n 20 --output=/usr/local/src/zookeeper-${ZOOKEEPER_VERSION}.tar.gz http://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
    && tar -zxf /usr/local/src/zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /usr/local/ \
    && rm -rf /usr/local/src/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
    && apt-get remove axel -y \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*

RUN cp /usr/local/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo_sample.cfg /usr/local/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo.cfg \
    && sed -i "s#dataDir=/tmp/zookeeper#dataDir=/var/lib/zookeeper#g" /usr/local/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo.cfg \
    && mkdir -p /var/lib/zookeeper
ENV ZOOKEEPER_HOME /usr/local/zookeeper-${ZOOKEEPER_VERSION}
ENV PATH $PATH:$ZOOKEEPER_HOME/bin

WORKDIR /usr/local/zookeeper-${ZOOKEEPER_VERSION}

VOLUME /var/lib/zookeeper

ENV ZOOKEEPER_ID NULL
ENV ZOOKEEPER_CLUSTER NULL

EXPOSE 2181 2888 3888

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
CMD ["docker-entrypoint.sh"]
