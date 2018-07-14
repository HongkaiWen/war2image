#!/bin/bash
echo -e "\e[1;32m step1: package the resouces ......"
echo -e "\e[0m"
mvn clean package -DskipTests -Pcontainer

if [ $? -ne 0 ]; then
  echo -e "\e[1;31m package the resources is unsuccessful."
  echo -e "\e[0m"
  exit;
fi

echo -e "\e[1;32m step2: copy resouce file to root path ......"
echo -e "\e[0m"

cp ./target/*.war ./war2image.war

echo -e "\e[1;32m step3: build docker image ......"
echo -e "\e[0m"

IMAGE_NAME="hongkaiwen/war2image:1.0"

docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
  echo -e "\e[1;31m build docker is unsuccessful."
  echo -e "\e[0m"
  exit;
else
    echo -e "\e[1;32m SUMMARY: build docker is successful, image name: $IMAGE_NAME"
    echo -e "\e[0m"
fi