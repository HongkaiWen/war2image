#!/bin/bash


# 通过dockerize工具动态替换配置文件中的信息
dockerize   -template /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application-container.yaml:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/application-container.yaml

echo "start up tomcat..."

chmod 774 /usr/local/tomcat/bin/catalina.sh
/usr/local/tomcat/bin/catalina.sh run
