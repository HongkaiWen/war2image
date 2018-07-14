This is a project show how to maintain a spring boot app for dockerized. `docker` folder、`Dockerfile`、`build.sh` on the root path just for this aim.

### Build image

```shell
./build.sh
```



### Run Image


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
- `-v` store the log files on host disk

- `-e JAVA_OPTS…` tunning jvm. In container, xmx must be sized.

- `-e ENV_NAME...` 1st business parameter

- `-e DB_IP…` 2nd business parameter

   

