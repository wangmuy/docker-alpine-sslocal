FROM shadowsocks/shadowsocks-libev
MAINTAINER noone <noone@valar.morghulis> 

USER root

RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
    && apk --update add --no-cache libsodium py-pip

RUN apk --no-cache --update add privoxy \
    && sed -i'' 's/127\.0\.0\.1:8118/0\.0\.0\.0:8118/' /etc/privoxy/config \
    && echo "forward-socks5  /       127.0.0.1:1080  ." >> /etc/privoxy/config

COPY start.sh /start.sh

EXPOSE 1080 8118
