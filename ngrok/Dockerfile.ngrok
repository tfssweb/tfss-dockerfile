FROM golang:1.9.1
MAINTAINER "tfss" <1255791430@qq.com>

# COPY sources.list /etc/apt/sources.list

ENV REPO https://github.com/prikevs/ngrok.git
ENV NGROK_HOME /usr/local/ngrok
ENV NGROK_CONFIG /etc/ngrok
RUN apt-get update \
    && apt-get install --no-install-recommends git zip jq -y \
    && git clone ${REPO} ${NGROK_HOME} \
    && rm -rf /usr/local/ngrok/assets/client/tls/* \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/src/docker-17.03.0-ce.tgz  https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz \
    && tar --strip-components=1 -xvzf /usr/local/src/docker-17.03.0-ce.tgz -C /usr/local/bin \
    && rm -rf /usr/local/src/docker-17.03.0-ce.tgz

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ngrokuser /usr/local/bin/ngrokuser

ENV NGROK_DOMAIN **NULL**
ENV NGROK_USER admin
ENV NGROK_PAAS admin

EXPOSE 80 443 4443

VOLUME ["/etc/ngrok"]

WORKDIR ${NGROK_HOME}

CMD ["docker-entrypoint.sh"]
