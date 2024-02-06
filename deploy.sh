#!/bin/bash

# 获取今天的日期作为TAG
TAG=$(date +%Y%m%d)

# Docker镜像名
IMAGE_NAME="jackypanster/my-flask-app"

# 构建Docker镜像
docker build -t ${IMAGE_NAME}:${TAG} .

# 运行Docker容器
# 假设您的Flask应用监听在5000端口
docker run -d --name ${IMAGE_NAME}-${TAG} -p 5000:5000 ${IMAGE_NAME}:${TAG}
