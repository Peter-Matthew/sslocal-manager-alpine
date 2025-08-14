FROM alpine:3.22.1

ENV TZ=Asia/Shanghai
ENV ARGS=

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.22/community" >> /etc/apk/repositories && \
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

COPY ./entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 1080/udp 1080/tcp

STOPSIGNAL SIGINT

CMD [ "sslocal" ]
