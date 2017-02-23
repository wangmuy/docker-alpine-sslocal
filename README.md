shadowsocks and privoxy proxy client. ss on 1080, privoxy forward on 8118

```
sudo docker run -p 1080:1080 -p 8118:8118 -d --name sslocal wangmuy/alpine-sslocal /start.sh -s ssserver.ip -p 8388 -b 0.0.0.0 -k ssserver.passwd
```
