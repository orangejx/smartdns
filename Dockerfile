FROM alpine:3.14.1

LABEL maintainer="William <x@ora.pub>"

RUN wget https://github.com/pymumu/smartdns/releases/download/Release34/smartdns-aarch64 \
  && mv smartdns-aarch64 /bin/smartdns \
  && chmod +x /bin/smartdns \
  && rm -rf smartdns*

ADD start.sh /start.sh
ADD config.conf /config.conf

WORKDIR /

VOLUME ["/smartdns"]

EXPOSE 53

CMD ["/start.sh"]
