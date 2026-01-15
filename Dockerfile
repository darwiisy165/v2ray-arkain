FROM alpine:latest

# Instalasi V2Ray Core
RUN apk add --no-cache curl bash
RUN bash <(curl -L https://raw.githubusercontent.com/v2fly/fscript/master/install-release.sh)

# Salin config dari repo ke container
COPY config.json /etc/v2ray/config.json

# Jalankan V2Ray langsung di port 80
EXPOSE 80
CMD ["/usr/local/bin/v2ray", "run", "-c", "/etc/v2ray/config.json"]

