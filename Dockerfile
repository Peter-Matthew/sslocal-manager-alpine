FROM alpine:3.21

ENV DNS_ADDRS="114.114.114.114,8.8.8.8"
ENV TZ=Asia/Shanghai
ENV ARGS=

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    tzdata \
    shadowsocks-rust \
    procps \
 && cp /usr/share/zoneinfo/$TZ /etc/localtime \
 && echo "$TZ" > /etc/timezone \
 && rm -rf /var/cache/apk/*

COPY ./entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8388/udp 8388/tcp

STOPSIGNAL SIGINT

CMD [ "ssserver", "--log-without-time", "-c", "/.ssconfig.json" ]
