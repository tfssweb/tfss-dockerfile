FROM mysql:5.7
MAINTAINER "tfss" <1255791430@qq.com>
ENV TZ=Asia/Shanghai
COPY ./db_equipment.sql /docker-entrypoint-initdb.d/
COPY ./utf8.cnf /etc/mysql/conf.d/