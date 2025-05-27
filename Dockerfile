FROM python:3.12-alpine3.21

ENV TZ=Asia/Shanghai
ENV ARGS=

# 更新系统包以修复已知漏洞，并安装shadowsocks-rust和依赖
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    tzdata \
    shadowsocks-rust \
    procps \
 && cp /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo "$TZ" > /etc/timezone \
 && rm -rf /var/cache/apk/*

# 安装Python依赖
RUN pip install flask

WORKDIR /app
COPY templates/ /app/templates/
COPY ./app.py /app/app.py
RUN chmod +x /app/app.py

# 暴露端口
EXPOSE 5000 1080/udp 1080/tcp

CMD ["python", "app.py"]
