FROM python:3.12-alpine3.21

ENV TZ=Asia/Shanghai
ENV ARGS=

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    tzdata \
    shadowsocks-rust \
    procps \
 && cp /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo "$TZ" > /etc/timezone \
 && apk del tzdata \
 && rm -rf \
        /var/cache/apk/* \
        /etc/apk/cache/* \
        /tmp/* \
        /var/tmp/*

RUN pip install --no-cache-dir flask

WORKDIR /app
COPY templates/ /app/templates/
COPY ./app.py /app/app.py
RUN chmod +x /app/app.py

EXPOSE 6000 8388/udp 8388/tcp

CMD ["python", "app.py"]
