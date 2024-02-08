# 使用官方Python运行环境作为基础镜像
FROM python:3.8-slim

# 设置工作目录为/app
WORKDIR /app

# 将当前目录下的所有文件复制到容器的/app目录
COPY . /app

# 安装requirements.txt中定义的所有依赖
RUN pip install --no-cache-dir -r requirements.txt

# 让外界可以访问容器的5000端口
EXPOSE 5000

# 定义环境变量
ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0

# 使用flask命令来启动应用
# CMD ["flask", "run"]
CMD ["flask", "run", "--host=0.0.0.0"]