FROM mysql:5.7
ENV TZ=Asia/Shanghai
ENV MYSQL_ROOT_PASSWORD=root

# 将sql文件放到此目录，可以自动执行
COPY ./db_equipment.sql /docker-entrypoint-initdb.d/

# 将配置文件放到此目录，进行配置
COPY ./utf8.cnf /etc/mysql/conf.d/