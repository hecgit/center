#!/bin/bash

mvn clean package

dockerImageName=service-center
dockerContainerName=service-center-c
dockerContainerPort=8001


docker stop $dockerContainerName
docker rm $dockerContainerName
docker rmi $dockerImageName

docker build -t $dockerImageName .

docker run -e JAVA_OPTS='-Xmx512m' --name $dockerContainerName -it -p ${dockerContainerPort}:8001 -d $dockerImageName

