# 使用一个官方的 Python 3.9 轻量级镜像作为基础
FROM python:3.12-slim

# 设置容器的工作目录
WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用代码
COPY . .

# 启动应用
# Cloud Run 会将环境变量 PORT 设置为你指定的端口（默认 8080）
# 确保你的应用监听这个端口。
# --host 0.0.0.0 是必须的，以确保它能监听所有网络接口
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]