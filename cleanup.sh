#!/bin/bash

# 获取今天的日期作为TAG
TAG=$(date +%Y%m%d)

# Docker镜像名
IMAGE_NAME="jackypanster/my-flask-app"

# 停止并删除容器
docker stop ${IMAGE_NAME}-${TAG}
docker rm ${IMAGE_NAME}-${TAG}

# 删除Docker镜像
docker rmi ${IMAGE_NAME}:${TAG}