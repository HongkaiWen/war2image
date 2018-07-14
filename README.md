### 启动命令


```shell
docker run -d \
           --name war2image \
           --memory="512m" \
           --restart=always \
           -p 8888:8080 \
           -v /Users/hongkai/tmp/war2image:/usr/local/tomcat/logs \
           -e "JAVA_OPTS=-server -Xms300m -Xmx300m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/usr/local/tomcat/logs/oom.hprof -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:/usr/local/tomcat/logs/gcdetail.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=10M -XX:+PrintTenuringDistribution " \
           -e "ENV_NAME=In-Container" \
           -e "DB_IP=1.5.6.8" \
           hongkaiwen/war2image:1.0
```