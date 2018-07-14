FROM registry.docker-cn.com/library/tomcat:8.5.27

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 设置字符集
ENV LANG C.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL C.UTF-8

# 删除默认的tomcat里内置的项目
RUN rm -rf /usr/local/tomcat/webapps/*

#安装 dockerize
RUN cd /tmp/ && wget https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz
RUN tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64-v0.6.1.tar.gz  && rm /tmp/dockerize-linux-amd64-v0.6.1.tar.gz


# 拷贝启动脚本
COPY ./docker/startApp.sh   /app_home/bin/start.sh

# copy war
COPY war2image.war /usr/local/tomcat/webapps/ROOT/
RUN unzip -o  /usr/local/tomcat/webapps/ROOT/war2image.war -d /usr/local/tomcat/webapps/ROOT/
RUN rm -rf /usr/local/tomcat/webapps/dolphin-ops/war2image.war


# 暴露8080端口
EXPOSE 8080

# 启动容器执行的命令
CMD bash /app_home/bin/start.sh